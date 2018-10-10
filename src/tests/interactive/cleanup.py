#!/usr/bin/env python2

"""Cleanup interactive transcript received on standard input.

This mostly consists in pretty-pretting JSON messages and sorting their
fields, to permit text-based comparisons against reference transcripts.

Usage: python cleanup.py fname.clean < fname.dirty
"""

import json
import sys
import re
import os

def cleanup_json(js):
    if isinstance(js, dict):
        if "fname" in js:
            js["fname"] = os.path.basename(js["fname"].replace('\\', '/'))
        if "location" in js:
            js["location"] = "<location removed>"
        for v in js.itervalues():
            cleanup_json(v)
    elif isinstance(js, list):
        for v in js:
            cleanup_json(v)

def cleanup_one(line):
    line = re.sub(r"\b(?<![\\])u[0-9]+\b", "u[...]", line)
    try:
        js = json.loads(line)
        if js.get("kind") == "protocol-info":
            js = {"kind": js.get("kind"), "rest": "[...]"} # Drop message body
        if js.get("kind") == "message" and js.get("level") == "progress":
            return "" # Drop full message
        cleanup_json(js)
        return json.dumps(js, ensure_ascii=False, sort_keys=True) + "\n"
    except Exception as ex:
        return line

def main():
    # Writing to stdout converts newlines, which confuses diff on Windows, so
    # write to a file instead.  There's no reasonable way to do this in a Python
    # 2/3 compatible way, so the following is Python-2 only.
    lines = [line.decode("utf-8") for line in sys.stdin]
    with open(sys.argv[1], mode="wb") as out:
        for line in lines:
            out.write(cleanup_one(line).encode("utf-8"))
            out.flush()

if __name__ == '__main__':
    main()
