open Prims
type env =
  {
  env: FStar_TypeChecker_Env.env ;
  subst: FStar_Syntax_Syntax.subst_elt Prims.list ;
  tc_const: FStar_Const.sconst -> FStar_Syntax_Syntax.typ }
let empty :
  FStar_TypeChecker_Env.env ->
    (FStar_Const.sconst -> FStar_Syntax_Syntax.typ) -> env
  = fun env  -> fun tc_const  -> { env; subst = []; tc_const } 
let gen_wps_for_free :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binders ->
      FStar_Syntax_Syntax.bv ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.eff_decl ->
            (FStar_Syntax_Syntax.sigelts * FStar_Syntax_Syntax.eff_decl)
  =
  fun env  ->
    fun binders  ->
      fun a  ->
        fun wp_a  ->
          fun ed  ->
            let wp_a =
              FStar_TypeChecker_Normalize.normalize
                [FStar_TypeChecker_Normalize.Beta;
                FStar_TypeChecker_Normalize.EraseUniverses] env wp_a
               in
            let a =
              let uu___94_64 = a  in
              let _0_177 =
                FStar_TypeChecker_Normalize.normalize
                  [FStar_TypeChecker_Normalize.EraseUniverses] env
                  a.FStar_Syntax_Syntax.sort
                 in
              {
                FStar_Syntax_Syntax.ppname =
                  (uu___94_64.FStar_Syntax_Syntax.ppname);
                FStar_Syntax_Syntax.index =
                  (uu___94_64.FStar_Syntax_Syntax.index);
                FStar_Syntax_Syntax.sort = _0_177
              }  in
            let d s = FStar_Util.print1 "\\x1b[01;36m%s\\x1b[00m\n" s  in
            (let uu____70 =
               FStar_TypeChecker_Env.debug env (FStar_Options.Other "ED")  in
             if uu____70
             then
               (d "Elaborating extra WP combinators";
                (let _0_178 = FStar_Syntax_Print.term_to_string wp_a  in
                 FStar_Util.print1 "wp_a is: %s\n" _0_178))
             else ());
            (let rec collect_binders t =
               let uu____80 =
                 (let _0_179 = FStar_Syntax_Subst.compress t  in
                  FStar_All.pipe_left FStar_Syntax_Util.unascribe _0_179).FStar_Syntax_Syntax.n
                  in
               match uu____80 with
               | FStar_Syntax_Syntax.Tm_arrow (bs,comp) ->
                   let rest =
                     match comp.FStar_Syntax_Syntax.n with
                     | FStar_Syntax_Syntax.Total (t,uu____102) -> t
                     | uu____109 -> failwith "wp_a contains non-Tot arrow"
                      in
                   let _0_180 = collect_binders rest  in
                   FStar_List.append bs _0_180
               | FStar_Syntax_Syntax.Tm_type uu____114 -> []
               | uu____117 -> failwith "wp_a doesn't end in Type0"  in
             let mk_lid name =
               FStar_Ident.lid_of_path
                 (FStar_Ident.path_of_text
                    (Prims.strcat
                       (FStar_Ident.text_of_lid ed.FStar_Syntax_Syntax.mname)
                       (Prims.strcat "_" name))) FStar_Range.dummyRange
                in
             let gamma =
               let _0_181 = collect_binders wp_a  in
               FStar_All.pipe_right _0_181 FStar_Syntax_Util.name_binders  in
             (let uu____136 =
                FStar_TypeChecker_Env.debug env (FStar_Options.Other "ED")
                 in
              if uu____136
              then
                d
                  (let _0_182 =
                     FStar_Syntax_Print.binders_to_string ", " gamma  in
                   FStar_Util.format1 "Gamma is %s\n" _0_182)
              else ());
             (let unknown = FStar_Syntax_Syntax.tun  in
              let mk x =
                (FStar_Syntax_Syntax.mk x) None FStar_Range.dummyRange  in
              let sigelts = FStar_Util.mk_ref []  in
              let register env lident def =
                let uu____168 =
                  FStar_TypeChecker_Util.mk_toplevel_definition env lident
                    def
                   in
                match uu____168 with
                | (sigelt,fv) ->
                    ((let _0_184 =
                        let _0_183 = FStar_ST.read sigelts  in sigelt ::
                          _0_183
                         in
                      FStar_ST.write sigelts _0_184);
                     fv)
                 in
              let binders_of_list =
                FStar_List.map
                  (fun uu____193  ->
                     match uu____193 with
                     | (t,b) ->
                         let _0_185 = FStar_Syntax_Syntax.as_implicit b  in
                         (t, _0_185))
                 in
              let mk_all_implicit =
                FStar_List.map
                  (fun t  ->
                     let _0_186 = FStar_Syntax_Syntax.as_implicit true  in
                     ((Prims.fst t), _0_186))
                 in
              let args_of_binders =
                FStar_List.map
                  (fun bv  ->
                     FStar_Syntax_Syntax.as_arg
                       (FStar_Syntax_Syntax.bv_to_name (Prims.fst bv)))
                 in
              let uu____228 =
                let uu____240 =
                  let mk f =
                    let t =
                      FStar_Syntax_Syntax.gen_bv "t" None
                        FStar_Syntax_Util.ktype
                       in
                    let body =
                      let _0_187 = f (FStar_Syntax_Syntax.bv_to_name t)  in
                      FStar_Syntax_Util.arrow gamma _0_187  in
                    let _0_192 =
                      let _0_191 =
                        let _0_190 = FStar_Syntax_Syntax.mk_binder a  in
                        let _0_189 =
                          let _0_188 = FStar_Syntax_Syntax.mk_binder t  in
                          [_0_188]  in
                        _0_190 :: _0_189  in
                      FStar_List.append binders _0_191  in
                    FStar_Syntax_Util.abs _0_192 body None  in
                  let _0_194 = mk FStar_Syntax_Syntax.mk_Total  in
                  let _0_193 = mk FStar_Syntax_Syntax.mk_GTotal  in
                  (_0_194, _0_193)  in
                match uu____240 with
                | (ctx_def,gctx_def) ->
                    let ctx_lid = mk_lid "ctx"  in
                    let ctx_fv = register env ctx_lid ctx_def  in
                    let gctx_lid = mk_lid "gctx"  in
                    let gctx_fv = register env gctx_lid gctx_def  in
                    let mk_app fv t =
                      mk
                        (FStar_Syntax_Syntax.Tm_app
                           (let _0_205 =
                              let _0_204 =
                                FStar_List.map
                                  (fun uu____308  ->
                                     match uu____308 with
                                     | (bv,uu____314) ->
                                         let _0_196 =
                                           FStar_Syntax_Syntax.bv_to_name bv
                                            in
                                         let _0_195 =
                                           FStar_Syntax_Syntax.as_implicit
                                             false
                                            in
                                         (_0_196, _0_195)) binders
                                 in
                              let _0_203 =
                                let _0_202 =
                                  let _0_198 =
                                    FStar_Syntax_Syntax.bv_to_name a  in
                                  let _0_197 =
                                    FStar_Syntax_Syntax.as_implicit false  in
                                  (_0_198, _0_197)  in
                                let _0_201 =
                                  let _0_200 =
                                    let _0_199 =
                                      FStar_Syntax_Syntax.as_implicit false
                                       in
                                    (t, _0_199)  in
                                  [_0_200]  in
                                _0_202 :: _0_201  in
                              FStar_List.append _0_204 _0_203  in
                            (fv, _0_205)))
                       in
                    (env, (mk_app ctx_fv), (mk_app gctx_fv))
                 in
              match uu____228 with
              | (env,mk_ctx,mk_gctx) ->
                  let c_pure =
                    let t =
                      FStar_Syntax_Syntax.gen_bv "t" None
                        FStar_Syntax_Util.ktype
                       in
                    let x =
                      let _0_206 = FStar_Syntax_Syntax.bv_to_name t  in
                      FStar_Syntax_Syntax.gen_bv "x" None _0_206  in
                    let ret =
                      Some
                        (FStar_Util.Inl
                           (FStar_Syntax_Util.lcomp_of_comp
                              (FStar_Syntax_Syntax.mk_Total
                                 (mk_ctx (FStar_Syntax_Syntax.bv_to_name t)))))
                       in
                    let body =
                      let _0_207 = FStar_Syntax_Syntax.bv_to_name x  in
                      FStar_Syntax_Util.abs gamma _0_207 ret  in
                    let _0_210 =
                      let _0_209 = mk_all_implicit binders  in
                      let _0_208 =
                        binders_of_list [(a, true); (t, true); (x, false)]
                         in
                      FStar_List.append _0_209 _0_208  in
                    FStar_Syntax_Util.abs _0_210 body ret  in
                  let c_pure =
                    let _0_211 = mk_lid "pure"  in register env _0_211 c_pure
                     in
                  let c_app =
                    let t1 =
                      FStar_Syntax_Syntax.gen_bv "t1" None
                        FStar_Syntax_Util.ktype
                       in
                    let t2 =
                      FStar_Syntax_Syntax.gen_bv "t2" None
                        FStar_Syntax_Util.ktype
                       in
                    let l =
                      let _0_216 =
                        mk_gctx
                          (let _0_215 =
                             let _0_213 =
                               FStar_Syntax_Syntax.mk_binder
                                 (let _0_212 =
                                    FStar_Syntax_Syntax.bv_to_name t1  in
                                  FStar_Syntax_Syntax.new_bv None _0_212)
                                in
                             [_0_213]  in
                           let _0_214 =
                             FStar_Syntax_Syntax.mk_GTotal
                               (FStar_Syntax_Syntax.bv_to_name t2)
                              in
                           FStar_Syntax_Util.arrow _0_215 _0_214)
                         in
                      FStar_Syntax_Syntax.gen_bv "l" None _0_216  in
                    let r =
                      let _0_217 =
                        mk_gctx (FStar_Syntax_Syntax.bv_to_name t1)  in
                      FStar_Syntax_Syntax.gen_bv "r" None _0_217  in
                    let ret =
                      Some
                        (FStar_Util.Inl
                           (FStar_Syntax_Util.lcomp_of_comp
                              (FStar_Syntax_Syntax.mk_Total
                                 (mk_gctx (FStar_Syntax_Syntax.bv_to_name t2)))))
                       in
                    let outer_body =
                      let gamma_as_args = args_of_binders gamma  in
                      let inner_body =
                        let _0_222 = FStar_Syntax_Syntax.bv_to_name l  in
                        let _0_221 =
                          let _0_220 =
                            let _0_219 =
                              FStar_Syntax_Syntax.as_arg
                                (let _0_218 =
                                   FStar_Syntax_Syntax.bv_to_name r  in
                                 FStar_Syntax_Util.mk_app _0_218
                                   gamma_as_args)
                               in
                            [_0_219]  in
                          FStar_List.append gamma_as_args _0_220  in
                        FStar_Syntax_Util.mk_app _0_222 _0_221  in
                      FStar_Syntax_Util.abs gamma inner_body ret  in
                    let _0_225 =
                      let _0_224 = mk_all_implicit binders  in
                      let _0_223 =
                        binders_of_list
                          [(a, true);
                          (t1, true);
                          (t2, true);
                          (l, false);
                          (r, false)]
                         in
                      FStar_List.append _0_224 _0_223  in
                    FStar_Syntax_Util.abs _0_225 outer_body ret  in
                  let c_app =
                    let _0_226 = mk_lid "app"  in register env _0_226 c_app
                     in
                  let c_lift1 =
                    let t1 =
                      FStar_Syntax_Syntax.gen_bv "t1" None
                        FStar_Syntax_Util.ktype
                       in
                    let t2 =
                      FStar_Syntax_Syntax.gen_bv "t2" None
                        FStar_Syntax_Util.ktype
                       in
                    let t_f =
                      let _0_229 =
                        let _0_227 =
                          FStar_Syntax_Syntax.null_binder
                            (FStar_Syntax_Syntax.bv_to_name t1)
                           in
                        [_0_227]  in
                      let _0_228 =
                        FStar_Syntax_Syntax.mk_GTotal
                          (FStar_Syntax_Syntax.bv_to_name t2)
                         in
                      FStar_Syntax_Util.arrow _0_229 _0_228  in
                    let f = FStar_Syntax_Syntax.gen_bv "f" None t_f  in
                    let a1 =
                      let _0_230 =
                        mk_gctx (FStar_Syntax_Syntax.bv_to_name t1)  in
                      FStar_Syntax_Syntax.gen_bv "a1" None _0_230  in
                    let ret =
                      Some
                        (FStar_Util.Inl
                           (FStar_Syntax_Util.lcomp_of_comp
                              (FStar_Syntax_Syntax.mk_Total
                                 (mk_gctx (FStar_Syntax_Syntax.bv_to_name t2)))))
                       in
                    let _0_242 =
                      let _0_232 = mk_all_implicit binders  in
                      let _0_231 =
                        binders_of_list
                          [(a, true);
                          (t1, true);
                          (t2, true);
                          (f, false);
                          (a1, false)]
                         in
                      FStar_List.append _0_232 _0_231  in
                    let _0_241 =
                      let _0_240 =
                        let _0_239 =
                          let _0_238 =
                            let _0_235 =
                              let _0_234 =
                                let _0_233 = FStar_Syntax_Syntax.bv_to_name f
                                   in
                                [_0_233]  in
                              FStar_List.map FStar_Syntax_Syntax.as_arg
                                _0_234
                               in
                            FStar_Syntax_Util.mk_app c_pure _0_235  in
                          let _0_237 =
                            let _0_236 = FStar_Syntax_Syntax.bv_to_name a1
                               in
                            [_0_236]  in
                          _0_238 :: _0_237  in
                        FStar_List.map FStar_Syntax_Syntax.as_arg _0_239  in
                      FStar_Syntax_Util.mk_app c_app _0_240  in
                    FStar_Syntax_Util.abs _0_242 _0_241 ret  in
                  let c_lift1 =
                    let _0_243 = mk_lid "lift1"  in
                    register env _0_243 c_lift1  in
                  let c_lift2 =
                    let t1 =
                      FStar_Syntax_Syntax.gen_bv "t1" None
                        FStar_Syntax_Util.ktype
                       in
                    let t2 =
                      FStar_Syntax_Syntax.gen_bv "t2" None
                        FStar_Syntax_Util.ktype
                       in
                    let t3 =
                      FStar_Syntax_Syntax.gen_bv "t3" None
                        FStar_Syntax_Util.ktype
                       in
                    let t_f =
                      let _0_248 =
                        let _0_246 =
                          FStar_Syntax_Syntax.null_binder
                            (FStar_Syntax_Syntax.bv_to_name t1)
                           in
                        let _0_245 =
                          let _0_244 =
                            FStar_Syntax_Syntax.null_binder
                              (FStar_Syntax_Syntax.bv_to_name t2)
                             in
                          [_0_244]  in
                        _0_246 :: _0_245  in
                      let _0_247 =
                        FStar_Syntax_Syntax.mk_GTotal
                          (FStar_Syntax_Syntax.bv_to_name t3)
                         in
                      FStar_Syntax_Util.arrow _0_248 _0_247  in
                    let f = FStar_Syntax_Syntax.gen_bv "f" None t_f  in
                    let a1 =
                      let _0_249 =
                        mk_gctx (FStar_Syntax_Syntax.bv_to_name t1)  in
                      FStar_Syntax_Syntax.gen_bv "a1" None _0_249  in
                    let a2 =
                      let _0_250 =
                        mk_gctx (FStar_Syntax_Syntax.bv_to_name t2)  in
                      FStar_Syntax_Syntax.gen_bv "a2" None _0_250  in
                    let ret =
                      Some
                        (FStar_Util.Inl
                           (FStar_Syntax_Util.lcomp_of_comp
                              (FStar_Syntax_Syntax.mk_Total
                                 (mk_gctx (FStar_Syntax_Syntax.bv_to_name t3)))))
                       in
                    let _0_267 =
                      let _0_252 = mk_all_implicit binders  in
                      let _0_251 =
                        binders_of_list
                          [(a, true);
                          (t1, true);
                          (t2, true);
                          (t3, true);
                          (f, false);
                          (a1, false);
                          (a2, false)]
                         in
                      FStar_List.append _0_252 _0_251  in
                    let _0_266 =
                      let _0_265 =
                        let _0_264 =
                          let _0_263 =
                            let _0_260 =
                              let _0_259 =
                                let _0_258 =
                                  let _0_255 =
                                    let _0_254 =
                                      let _0_253 =
                                        FStar_Syntax_Syntax.bv_to_name f  in
                                      [_0_253]  in
                                    FStar_List.map FStar_Syntax_Syntax.as_arg
                                      _0_254
                                     in
                                  FStar_Syntax_Util.mk_app c_pure _0_255  in
                                let _0_257 =
                                  let _0_256 =
                                    FStar_Syntax_Syntax.bv_to_name a1  in
                                  [_0_256]  in
                                _0_258 :: _0_257  in
                              FStar_List.map FStar_Syntax_Syntax.as_arg
                                _0_259
                               in
                            FStar_Syntax_Util.mk_app c_app _0_260  in
                          let _0_262 =
                            let _0_261 = FStar_Syntax_Syntax.bv_to_name a2
                               in
                            [_0_261]  in
                          _0_263 :: _0_262  in
                        FStar_List.map FStar_Syntax_Syntax.as_arg _0_264  in
                      FStar_Syntax_Util.mk_app c_app _0_265  in
                    FStar_Syntax_Util.abs _0_267 _0_266 ret  in
                  let c_lift2 =
                    let _0_268 = mk_lid "lift2"  in
                    register env _0_268 c_lift2  in
                  let c_push =
                    let t1 =
                      FStar_Syntax_Syntax.gen_bv "t1" None
                        FStar_Syntax_Util.ktype
                       in
                    let t2 =
                      FStar_Syntax_Syntax.gen_bv "t2" None
                        FStar_Syntax_Util.ktype
                       in
                    let t_f =
                      let _0_271 =
                        let _0_269 =
                          FStar_Syntax_Syntax.null_binder
                            (FStar_Syntax_Syntax.bv_to_name t1)
                           in
                        [_0_269]  in
                      let _0_270 =
                        FStar_Syntax_Syntax.mk_Total
                          (mk_gctx (FStar_Syntax_Syntax.bv_to_name t2))
                         in
                      FStar_Syntax_Util.arrow _0_271 _0_270  in
                    let f = FStar_Syntax_Syntax.gen_bv "f" None t_f  in
                    let ret =
                      Some
                        (FStar_Util.Inl
                           (FStar_Syntax_Util.lcomp_of_comp
                              (FStar_Syntax_Syntax.mk_Total
                                 (mk_ctx
                                    (let _0_274 =
                                       let _0_272 =
                                         FStar_Syntax_Syntax.null_binder
                                           (FStar_Syntax_Syntax.bv_to_name t1)
                                          in
                                       [_0_272]  in
                                     let _0_273 =
                                       FStar_Syntax_Syntax.mk_GTotal
                                         (FStar_Syntax_Syntax.bv_to_name t2)
                                        in
                                     FStar_Syntax_Util.arrow _0_274 _0_273)))))
                       in
                    let e1 =
                      let _0_275 = FStar_Syntax_Syntax.bv_to_name t1  in
                      FStar_Syntax_Syntax.gen_bv "e1" None _0_275  in
                    let body =
                      let _0_283 =
                        let _0_277 =
                          let _0_276 = FStar_Syntax_Syntax.mk_binder e1  in
                          [_0_276]  in
                        FStar_List.append gamma _0_277  in
                      let _0_282 =
                        let _0_281 = FStar_Syntax_Syntax.bv_to_name f  in
                        let _0_280 =
                          let _0_279 =
                            FStar_Syntax_Syntax.as_arg
                              (FStar_Syntax_Syntax.bv_to_name e1)
                             in
                          let _0_278 = args_of_binders gamma  in _0_279 ::
                            _0_278
                           in
                        FStar_Syntax_Util.mk_app _0_281 _0_280  in
                      FStar_Syntax_Util.abs _0_283 _0_282 ret  in
                    let _0_286 =
                      let _0_285 = mk_all_implicit binders  in
                      let _0_284 =
                        binders_of_list
                          [(a, true); (t1, true); (t2, true); (f, false)]
                         in
                      FStar_List.append _0_285 _0_284  in
                    FStar_Syntax_Util.abs _0_286 body ret  in
                  let c_push =
                    let _0_287 = mk_lid "push"  in register env _0_287 c_push
                     in
                  let ret_tot_wp_a =
                    Some
                      (FStar_Util.Inl
                         (FStar_Syntax_Util.lcomp_of_comp
                            (FStar_Syntax_Syntax.mk_Total wp_a)))
                     in
                  let mk_generic_app c =
                    if (FStar_List.length binders) > (Prims.parse_int "0")
                    then
                      mk
                        (FStar_Syntax_Syntax.Tm_app
                           (let _0_288 = args_of_binders binders  in
                            (c, _0_288)))
                    else c  in
                  let wp_if_then_else =
                    let result_comp =
                      FStar_Syntax_Syntax.mk_Total
                        (let _0_293 =
                           let _0_291 = FStar_Syntax_Syntax.null_binder wp_a
                              in
                           let _0_290 =
                             let _0_289 =
                               FStar_Syntax_Syntax.null_binder wp_a  in
                             [_0_289]  in
                           _0_291 :: _0_290  in
                         let _0_292 = FStar_Syntax_Syntax.mk_Total wp_a  in
                         FStar_Syntax_Util.arrow _0_293 _0_292)
                       in
                    let c =
                      FStar_Syntax_Syntax.gen_bv "c" None
                        FStar_Syntax_Util.ktype
                       in
                    let _0_302 =
                      let _0_294 = FStar_Syntax_Syntax.binders_of_list [a; c]
                         in
                      FStar_List.append binders _0_294  in
                    let _0_301 =
                      let l_ite =
                        FStar_Syntax_Syntax.fvar FStar_Syntax_Const.ite_lid
                          (FStar_Syntax_Syntax.Delta_defined_at_level
                             (Prims.parse_int "2")) None
                         in
                      let _0_300 =
                        let _0_299 =
                          let _0_298 =
                            let _0_297 =
                              let _0_296 =
                                let _0_295 =
                                  FStar_Syntax_Syntax.as_arg
                                    (FStar_Syntax_Syntax.bv_to_name c)
                                   in
                                [_0_295]  in
                              FStar_Syntax_Util.mk_app l_ite _0_296  in
                            [_0_297]  in
                          FStar_List.map FStar_Syntax_Syntax.as_arg _0_298
                           in
                        FStar_Syntax_Util.mk_app c_lift2 _0_299  in
                      FStar_Syntax_Util.ascribe _0_300
                        (FStar_Util.Inr result_comp)
                       in
                    FStar_Syntax_Util.abs _0_302 _0_301
                      (Some
                         (FStar_Util.Inl
                            (FStar_Syntax_Util.lcomp_of_comp result_comp)))
                     in
                  let wp_if_then_else =
                    let _0_303 = mk_lid "wp_if_then_else"  in
                    register env _0_303 wp_if_then_else  in
                  let wp_if_then_else = mk_generic_app wp_if_then_else  in
                  let wp_assert =
                    let q =
                      FStar_Syntax_Syntax.gen_bv "q" None
                        FStar_Syntax_Util.ktype
                       in
                    let wp = FStar_Syntax_Syntax.gen_bv "wp" None wp_a  in
                    let l_and =
                      FStar_Syntax_Syntax.fvar FStar_Syntax_Const.and_lid
                        (FStar_Syntax_Syntax.Delta_defined_at_level
                           (Prims.parse_int "1")) None
                       in
                    let body =
                      let _0_313 =
                        let _0_312 =
                          let _0_311 =
                            let _0_308 =
                              let _0_307 =
                                let _0_306 =
                                  let _0_305 =
                                    let _0_304 =
                                      FStar_Syntax_Syntax.as_arg
                                        (FStar_Syntax_Syntax.bv_to_name q)
                                       in
                                    [_0_304]  in
                                  FStar_Syntax_Util.mk_app l_and _0_305  in
                                [_0_306]  in
                              FStar_List.map FStar_Syntax_Syntax.as_arg
                                _0_307
                               in
                            FStar_Syntax_Util.mk_app c_pure _0_308  in
                          let _0_310 =
                            let _0_309 = FStar_Syntax_Syntax.bv_to_name wp
                               in
                            [_0_309]  in
                          _0_311 :: _0_310  in
                        FStar_List.map FStar_Syntax_Syntax.as_arg _0_312  in
                      FStar_Syntax_Util.mk_app c_app _0_313  in
                    let _0_315 =
                      let _0_314 =
                        FStar_Syntax_Syntax.binders_of_list [a; q; wp]  in
                      FStar_List.append binders _0_314  in
                    FStar_Syntax_Util.abs _0_315 body ret_tot_wp_a  in
                  let wp_assert =
                    let _0_316 = mk_lid "wp_assert"  in
                    register env _0_316 wp_assert  in
                  let wp_assert = mk_generic_app wp_assert  in
                  let wp_assume =
                    let q =
                      FStar_Syntax_Syntax.gen_bv "q" None
                        FStar_Syntax_Util.ktype
                       in
                    let wp = FStar_Syntax_Syntax.gen_bv "wp" None wp_a  in
                    let l_imp =
                      FStar_Syntax_Syntax.fvar FStar_Syntax_Const.imp_lid
                        (FStar_Syntax_Syntax.Delta_defined_at_level
                           (Prims.parse_int "1")) None
                       in
                    let body =
                      let _0_326 =
                        let _0_325 =
                          let _0_324 =
                            let _0_321 =
                              let _0_320 =
                                let _0_319 =
                                  let _0_318 =
                                    let _0_317 =
                                      FStar_Syntax_Syntax.as_arg
                                        (FStar_Syntax_Syntax.bv_to_name q)
                                       in
                                    [_0_317]  in
                                  FStar_Syntax_Util.mk_app l_imp _0_318  in
                                [_0_319]  in
                              FStar_List.map FStar_Syntax_Syntax.as_arg
                                _0_320
                               in
                            FStar_Syntax_Util.mk_app c_pure _0_321  in
                          let _0_323 =
                            let _0_322 = FStar_Syntax_Syntax.bv_to_name wp
                               in
                            [_0_322]  in
                          _0_324 :: _0_323  in
                        FStar_List.map FStar_Syntax_Syntax.as_arg _0_325  in
                      FStar_Syntax_Util.mk_app c_app _0_326  in
                    let _0_328 =
                      let _0_327 =
                        FStar_Syntax_Syntax.binders_of_list [a; q; wp]  in
                      FStar_List.append binders _0_327  in
                    FStar_Syntax_Util.abs _0_328 body ret_tot_wp_a  in
                  let wp_assume =
                    let _0_329 = mk_lid "wp_assume"  in
                    register env _0_329 wp_assume  in
                  let wp_assume = mk_generic_app wp_assume  in
                  let wp_close =
                    let b =
                      FStar_Syntax_Syntax.gen_bv "b" None
                        FStar_Syntax_Util.ktype
                       in
                    let t_f =
                      let _0_332 =
                        let _0_330 =
                          FStar_Syntax_Syntax.null_binder
                            (FStar_Syntax_Syntax.bv_to_name b)
                           in
                        [_0_330]  in
                      let _0_331 = FStar_Syntax_Syntax.mk_Total wp_a  in
                      FStar_Syntax_Util.arrow _0_332 _0_331  in
                    let f = FStar_Syntax_Syntax.gen_bv "f" None t_f  in
                    let body =
                      let _0_341 =
                        let _0_340 =
                          let _0_339 =
                            let _0_333 =
                              FStar_List.map FStar_Syntax_Syntax.as_arg
                                [FStar_Syntax_Util.tforall]
                               in
                            FStar_Syntax_Util.mk_app c_pure _0_333  in
                          let _0_338 =
                            let _0_337 =
                              let _0_336 =
                                let _0_335 =
                                  let _0_334 =
                                    FStar_Syntax_Syntax.bv_to_name f  in
                                  [_0_334]  in
                                FStar_List.map FStar_Syntax_Syntax.as_arg
                                  _0_335
                                 in
                              FStar_Syntax_Util.mk_app c_push _0_336  in
                            [_0_337]  in
                          _0_339 :: _0_338  in
                        FStar_List.map FStar_Syntax_Syntax.as_arg _0_340  in
                      FStar_Syntax_Util.mk_app c_app _0_341  in
                    let _0_343 =
                      let _0_342 =
                        FStar_Syntax_Syntax.binders_of_list [a; b; f]  in
                      FStar_List.append binders _0_342  in
                    FStar_Syntax_Util.abs _0_343 body ret_tot_wp_a  in
                  let wp_close =
                    let _0_344 = mk_lid "wp_close"  in
                    register env _0_344 wp_close  in
                  let wp_close = mk_generic_app wp_close  in
                  let ret_tot_type =
                    Some
                      (FStar_Util.Inl
                         (let _0_345 =
                            FStar_Syntax_Syntax.mk_Total
                              FStar_Syntax_Util.ktype
                             in
                          FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp
                            _0_345))
                     in
                  let ret_gtot_type =
                    Some
                      (FStar_Util.Inl
                         (let _0_346 =
                            FStar_Syntax_Syntax.mk_GTotal
                              FStar_Syntax_Util.ktype
                             in
                          FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp
                            _0_346))
                     in
                  let mk_forall x body =
                    (FStar_Syntax_Syntax.mk
                       (FStar_Syntax_Syntax.Tm_app
                          (let _0_350 =
                             let _0_349 =
                               FStar_Syntax_Syntax.as_arg
                                 (let _0_348 =
                                    let _0_347 =
                                      FStar_Syntax_Syntax.mk_binder x  in
                                    [_0_347]  in
                                  FStar_Syntax_Util.abs _0_348 body
                                    ret_tot_type)
                                in
                             [_0_349]  in
                           (FStar_Syntax_Util.tforall, _0_350)))) None
                      FStar_Range.dummyRange
                     in
                  let rec is_discrete t =
                    let uu____721 =
                      (FStar_Syntax_Subst.compress t).FStar_Syntax_Syntax.n
                       in
                    match uu____721 with
                    | FStar_Syntax_Syntax.Tm_type uu____722 -> false
                    | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
                        (FStar_List.for_all
                           (fun uu____737  ->
                              match uu____737 with
                              | (b,uu____741) ->
                                  is_discrete b.FStar_Syntax_Syntax.sort) bs)
                          && (is_discrete (FStar_Syntax_Util.comp_result c))
                    | uu____742 -> true  in
                  let rec is_monotonic t =
                    let uu____747 =
                      (FStar_Syntax_Subst.compress t).FStar_Syntax_Syntax.n
                       in
                    match uu____747 with
                    | FStar_Syntax_Syntax.Tm_type uu____748 -> true
                    | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
                        (FStar_List.for_all
                           (fun uu____763  ->
                              match uu____763 with
                              | (b,uu____767) ->
                                  is_discrete b.FStar_Syntax_Syntax.sort) bs)
                          && (is_monotonic (FStar_Syntax_Util.comp_result c))
                    | uu____768 -> is_discrete t  in
                  let rec mk_rel rel t x y =
                    let mk_rel = mk_rel rel  in
                    let t =
                      FStar_TypeChecker_Normalize.normalize
                        [FStar_TypeChecker_Normalize.Beta;
                        FStar_TypeChecker_Normalize.Eager_unfolding;
                        FStar_TypeChecker_Normalize.UnfoldUntil
                          FStar_Syntax_Syntax.Delta_constant] env t
                       in
                    let uu____820 =
                      (FStar_Syntax_Subst.compress t).FStar_Syntax_Syntax.n
                       in
                    match uu____820 with
                    | FStar_Syntax_Syntax.Tm_type uu____821 -> rel x y
                    | FStar_Syntax_Syntax.Tm_arrow
                      (binder::[],{
                                    FStar_Syntax_Syntax.n =
                                      FStar_Syntax_Syntax.GTotal (b,_);
                                    FStar_Syntax_Syntax.tk = _;
                                    FStar_Syntax_Syntax.pos = _;
                                    FStar_Syntax_Syntax.vars = _;_})
                      |FStar_Syntax_Syntax.Tm_arrow
                      (binder::[],{
                                    FStar_Syntax_Syntax.n =
                                      FStar_Syntax_Syntax.Total (b,_);
                                    FStar_Syntax_Syntax.tk = _;
                                    FStar_Syntax_Syntax.pos = _;
                                    FStar_Syntax_Syntax.vars = _;_})
                        ->
                        let a = (Prims.fst binder).FStar_Syntax_Syntax.sort
                           in
                        let uu____867 = (is_monotonic a) || (is_monotonic b)
                           in
                        if uu____867
                        then
                          let a1 = FStar_Syntax_Syntax.gen_bv "a1" None a  in
                          let body =
                            let _0_356 =
                              let _0_352 =
                                let _0_351 =
                                  FStar_Syntax_Syntax.as_arg
                                    (FStar_Syntax_Syntax.bv_to_name a1)
                                   in
                                [_0_351]  in
                              FStar_Syntax_Util.mk_app x _0_352  in
                            let _0_355 =
                              let _0_354 =
                                let _0_353 =
                                  FStar_Syntax_Syntax.as_arg
                                    (FStar_Syntax_Syntax.bv_to_name a1)
                                   in
                                [_0_353]  in
                              FStar_Syntax_Util.mk_app y _0_354  in
                            mk_rel b _0_356 _0_355  in
                          mk_forall a1 body
                        else
                          (let a1 = FStar_Syntax_Syntax.gen_bv "a1" None a
                              in
                           let a2 = FStar_Syntax_Syntax.gen_bv "a2" None a
                              in
                           let body =
                             let _0_366 =
                               let _0_358 = FStar_Syntax_Syntax.bv_to_name a1
                                  in
                               let _0_357 = FStar_Syntax_Syntax.bv_to_name a2
                                  in
                               mk_rel a _0_358 _0_357  in
                             let _0_365 =
                               let _0_364 =
                                 let _0_360 =
                                   let _0_359 =
                                     FStar_Syntax_Syntax.as_arg
                                       (FStar_Syntax_Syntax.bv_to_name a1)
                                      in
                                   [_0_359]  in
                                 FStar_Syntax_Util.mk_app x _0_360  in
                               let _0_363 =
                                 let _0_362 =
                                   let _0_361 =
                                     FStar_Syntax_Syntax.as_arg
                                       (FStar_Syntax_Syntax.bv_to_name a2)
                                      in
                                   [_0_361]  in
                                 FStar_Syntax_Util.mk_app y _0_362  in
                               mk_rel b _0_364 _0_363  in
                             FStar_Syntax_Util.mk_imp _0_366 _0_365  in
                           let _0_367 = mk_forall a2 body  in
                           mk_forall a1 _0_367)
                    | FStar_Syntax_Syntax.Tm_arrow (binder::binders,comp) ->
                        let t =
                          let uu___95_894 = t  in
                          let _0_369 =
                            FStar_Syntax_Syntax.Tm_arrow
                              (let _0_368 =
                                 FStar_Syntax_Syntax.mk_Total
                                   (FStar_Syntax_Util.arrow binders comp)
                                  in
                               ([binder], _0_368))
                             in
                          {
                            FStar_Syntax_Syntax.n = _0_369;
                            FStar_Syntax_Syntax.tk =
                              (uu___95_894.FStar_Syntax_Syntax.tk);
                            FStar_Syntax_Syntax.pos =
                              (uu___95_894.FStar_Syntax_Syntax.pos);
                            FStar_Syntax_Syntax.vars =
                              (uu___95_894.FStar_Syntax_Syntax.vars)
                          }  in
                        mk_rel t x y
                    | FStar_Syntax_Syntax.Tm_arrow uu____906 ->
                        failwith "unhandled arrow"
                    | uu____914 -> FStar_Syntax_Util.mk_untyped_eq2 x y  in
                  let stronger =
                    let wp1 = FStar_Syntax_Syntax.gen_bv "wp1" None wp_a  in
                    let wp2 = FStar_Syntax_Syntax.gen_bv "wp2" None wp_a  in
                    let rec mk_stronger t x y =
                      let t =
                        FStar_TypeChecker_Normalize.normalize
                          [FStar_TypeChecker_Normalize.Beta;
                          FStar_TypeChecker_Normalize.Eager_unfolding;
                          FStar_TypeChecker_Normalize.UnfoldUntil
                            FStar_Syntax_Syntax.Delta_constant] env t
                         in
                      let uu____929 =
                        (FStar_Syntax_Subst.compress t).FStar_Syntax_Syntax.n
                         in
                      match uu____929 with
                      | FStar_Syntax_Syntax.Tm_type uu____930 ->
                          FStar_Syntax_Util.mk_imp x y
                      | FStar_Syntax_Syntax.Tm_app (head,args) when
                          FStar_Syntax_Util.is_tuple_constructor
                            (FStar_Syntax_Subst.compress head)
                          ->
                          let project i tuple =
                            let projector =
                              let _0_371 =
                                let _0_370 =
                                  FStar_Syntax_Util.mk_tuple_data_lid
                                    (FStar_List.length args)
                                    FStar_Range.dummyRange
                                   in
                                FStar_TypeChecker_Env.lookup_projector env
                                  _0_370 i
                                 in
                              FStar_Syntax_Syntax.fvar _0_371
                                (FStar_Syntax_Syntax.Delta_defined_at_level
                                   (Prims.parse_int "1")) None
                               in
                            FStar_Syntax_Util.mk_app projector
                              [(tuple, None)]
                             in
                          let uu____981 =
                            let uu____985 =
                              FStar_List.mapi
                                (fun i  ->
                                   fun uu____990  ->
                                     match uu____990 with
                                     | (t,q) ->
                                         let _0_373 = project i x  in
                                         let _0_372 = project i y  in
                                         mk_stronger t _0_373 _0_372) args
                               in
                            match uu____985 with
                            | [] ->
                                failwith
                                  "Impossible : Empty application when creating stronger relation in DM4F"
                            | rel0::rels -> (rel0, rels)  in
                          (match uu____981 with
                           | (rel0,rels) ->
                               FStar_List.fold_left FStar_Syntax_Util.mk_conj
                                 rel0 rels)
                      | FStar_Syntax_Syntax.Tm_arrow
                        (binders,{
                                   FStar_Syntax_Syntax.n =
                                     FStar_Syntax_Syntax.GTotal (b,_);
                                   FStar_Syntax_Syntax.tk = _;
                                   FStar_Syntax_Syntax.pos = _;
                                   FStar_Syntax_Syntax.vars = _;_})
                        |FStar_Syntax_Syntax.Tm_arrow
                        (binders,{
                                   FStar_Syntax_Syntax.n =
                                     FStar_Syntax_Syntax.Total (b,_);
                                   FStar_Syntax_Syntax.tk = _;
                                   FStar_Syntax_Syntax.pos = _;
                                   FStar_Syntax_Syntax.vars = _;_})
                          ->
                          let bvs =
                            FStar_List.mapi
                              (fun i  ->
                                 fun uu____1050  ->
                                   match uu____1050 with
                                   | (bv,q) ->
                                       let _0_375 =
                                         let _0_374 =
                                           FStar_Util.string_of_int i  in
                                         Prims.strcat "a" _0_374  in
                                       FStar_Syntax_Syntax.gen_bv _0_375 None
                                         bv.FStar_Syntax_Syntax.sort) binders
                             in
                          let args =
                            FStar_List.map
                              (fun ai  ->
                                 FStar_Syntax_Syntax.as_arg
                                   (FStar_Syntax_Syntax.bv_to_name ai)) bvs
                             in
                          let body =
                            let _0_377 = FStar_Syntax_Util.mk_app x args  in
                            let _0_376 = FStar_Syntax_Util.mk_app y args  in
                            mk_stronger b _0_377 _0_376  in
                          FStar_List.fold_right
                            (fun bv  -> fun body  -> mk_forall bv body) bvs
                            body
                      | uu____1061 -> failwith "Not a DM elaborated type"  in
                    let body =
                      let _0_380 = FStar_Syntax_Util.unascribe wp_a  in
                      let _0_379 = FStar_Syntax_Syntax.bv_to_name wp1  in
                      let _0_378 = FStar_Syntax_Syntax.bv_to_name wp2  in
                      mk_stronger _0_380 _0_379 _0_378  in
                    let _0_382 =
                      let _0_381 =
                        binders_of_list
                          [(a, false); (wp1, false); (wp2, false)]
                         in
                      FStar_List.append binders _0_381  in
                    FStar_Syntax_Util.abs _0_382 body ret_tot_type  in
                  let stronger =
                    let _0_383 = mk_lid "stronger"  in
                    register env _0_383 stronger  in
                  let stronger = mk_generic_app stronger  in
                  let wp_ite =
                    let wp = FStar_Syntax_Syntax.gen_bv "wp" None wp_a  in
                    let uu____1079 = FStar_Util.prefix gamma  in
                    match uu____1079 with
                    | (wp_args,post) ->
                        let k =
                          FStar_Syntax_Syntax.gen_bv "k" None
                            (Prims.fst post).FStar_Syntax_Syntax.sort
                           in
                        let equiv =
                          let k_tm = FStar_Syntax_Syntax.bv_to_name k  in
                          let eq =
                            let _0_384 =
                              FStar_Syntax_Syntax.bv_to_name (Prims.fst post)
                               in
                            mk_rel FStar_Syntax_Util.mk_iff
                              k.FStar_Syntax_Syntax.sort k_tm _0_384
                             in
                          let uu____1105 =
                            FStar_Syntax_Util.destruct_typ_as_formula eq  in
                          match uu____1105 with
                          | Some (FStar_Syntax_Util.QAll (binders,[],body))
                              ->
                              let k_app =
                                let _0_385 = args_of_binders binders  in
                                FStar_Syntax_Util.mk_app k_tm _0_385  in
                              let guard_free =
                                FStar_Syntax_Syntax.fv_to_tm
                                  (FStar_Syntax_Syntax.lid_as_fv
                                     FStar_Syntax_Const.guard_free
                                     FStar_Syntax_Syntax.Delta_constant None)
                                 in
                              let pat =
                                let _0_387 =
                                  let _0_386 =
                                    FStar_Syntax_Syntax.as_arg k_app  in
                                  [_0_386]  in
                                FStar_Syntax_Util.mk_app guard_free _0_387
                                 in
                              let pattern_guarded_body =
                                mk
                                  (FStar_Syntax_Syntax.Tm_meta
                                     (let _0_390 =
                                        FStar_Syntax_Syntax.Meta_pattern
                                          (let _0_389 =
                                             let _0_388 =
                                               FStar_Syntax_Syntax.as_arg pat
                                                in
                                             [_0_388]  in
                                           [_0_389])
                                         in
                                      (body, _0_390)))
                                 in
                              FStar_Syntax_Util.close_forall binders
                                pattern_guarded_body
                          | uu____1122 ->
                              failwith
                                "Impossible: Expected the equivalence to be a quantified formula"
                           in
                        let body =
                          let _0_398 =
                            let _0_397 =
                              let _0_396 =
                                let _0_395 =
                                  FStar_Syntax_Syntax.bv_to_name wp  in
                                let _0_394 =
                                  let _0_393 = args_of_binders wp_args  in
                                  let _0_392 =
                                    let _0_391 =
                                      FStar_Syntax_Syntax.as_arg
                                        (FStar_Syntax_Syntax.bv_to_name k)
                                       in
                                    [_0_391]  in
                                  FStar_List.append _0_393 _0_392  in
                                FStar_Syntax_Util.mk_app _0_395 _0_394  in
                              FStar_Syntax_Util.mk_imp equiv _0_396  in
                            FStar_Syntax_Util.mk_forall k _0_397  in
                          FStar_Syntax_Util.abs gamma _0_398 ret_gtot_type
                           in
                        let _0_400 =
                          let _0_399 =
                            FStar_Syntax_Syntax.binders_of_list [a; wp]  in
                          FStar_List.append binders _0_399  in
                        FStar_Syntax_Util.abs _0_400 body ret_gtot_type
                     in
                  let wp_ite =
                    let _0_401 = mk_lid "wp_ite"  in
                    register env _0_401 wp_ite  in
                  let wp_ite = mk_generic_app wp_ite  in
                  let null_wp =
                    let wp = FStar_Syntax_Syntax.gen_bv "wp" None wp_a  in
                    let uu____1133 = FStar_Util.prefix gamma  in
                    match uu____1133 with
                    | (wp_args,post) ->
                        let x =
                          FStar_Syntax_Syntax.gen_bv "x" None
                            FStar_Syntax_Syntax.tun
                           in
                        let body =
                          let _0_405 =
                            let _0_404 =
                              FStar_All.pipe_left
                                FStar_Syntax_Syntax.bv_to_name
                                (Prims.fst post)
                               in
                            let _0_403 =
                              let _0_402 =
                                FStar_Syntax_Syntax.as_arg
                                  (FStar_Syntax_Syntax.bv_to_name x)
                                 in
                              [_0_402]  in
                            FStar_Syntax_Util.mk_app _0_404 _0_403  in
                          FStar_Syntax_Util.mk_forall x _0_405  in
                        let _0_408 =
                          let _0_407 =
                            let _0_406 =
                              FStar_Syntax_Syntax.binders_of_list [a]  in
                            FStar_List.append _0_406 gamma  in
                          FStar_List.append binders _0_407  in
                        FStar_Syntax_Util.abs _0_408 body ret_gtot_type
                     in
                  let null_wp =
                    let _0_409 = mk_lid "null_wp"  in
                    register env _0_409 null_wp  in
                  let null_wp = mk_generic_app null_wp  in
                  let wp_trivial =
                    let wp = FStar_Syntax_Syntax.gen_bv "wp" None wp_a  in
                    let body =
                      let _0_418 =
                        let _0_417 =
                          let _0_416 = FStar_Syntax_Syntax.bv_to_name a  in
                          let _0_415 =
                            let _0_414 =
                              let _0_411 =
                                let _0_410 =
                                  FStar_Syntax_Syntax.as_arg
                                    (FStar_Syntax_Syntax.bv_to_name a)
                                   in
                                [_0_410]  in
                              FStar_Syntax_Util.mk_app null_wp _0_411  in
                            let _0_413 =
                              let _0_412 = FStar_Syntax_Syntax.bv_to_name wp
                                 in
                              [_0_412]  in
                            _0_414 :: _0_413  in
                          _0_416 :: _0_415  in
                        FStar_List.map FStar_Syntax_Syntax.as_arg _0_417  in
                      FStar_Syntax_Util.mk_app stronger _0_418  in
                    let _0_420 =
                      let _0_419 =
                        FStar_Syntax_Syntax.binders_of_list [a; wp]  in
                      FStar_List.append binders _0_419  in
                    FStar_Syntax_Util.abs _0_420 body ret_tot_type  in
                  let wp_trivial =
                    let _0_421 = mk_lid "wp_trivial"  in
                    register env _0_421 wp_trivial  in
                  let wp_trivial = mk_generic_app wp_trivial  in
                  ((let uu____1179 =
                      FStar_TypeChecker_Env.debug env
                        (FStar_Options.Other "ED")
                       in
                    if uu____1179
                    then d "End Dijkstra monads for free"
                    else ());
                   (let c = FStar_Syntax_Subst.close binders  in
                    let _0_439 = FStar_List.rev (FStar_ST.read sigelts)  in
                    let _0_438 =
                      let uu___96_1188 = ed  in
                      let _0_437 =
                        let _0_422 = c wp_if_then_else  in ([], _0_422)  in
                      let _0_436 = let _0_423 = c wp_ite  in ([], _0_423)  in
                      let _0_435 = let _0_424 = c stronger  in ([], _0_424)
                         in
                      let _0_434 = let _0_425 = c wp_close  in ([], _0_425)
                         in
                      let _0_433 = let _0_426 = c wp_assert  in ([], _0_426)
                         in
                      let _0_432 = let _0_427 = c wp_assume  in ([], _0_427)
                         in
                      let _0_431 = let _0_428 = c null_wp  in ([], _0_428)
                         in
                      let _0_430 = let _0_429 = c wp_trivial  in ([], _0_429)
                         in
                      {
                        FStar_Syntax_Syntax.qualifiers =
                          (uu___96_1188.FStar_Syntax_Syntax.qualifiers);
                        FStar_Syntax_Syntax.cattributes =
                          (uu___96_1188.FStar_Syntax_Syntax.cattributes);
                        FStar_Syntax_Syntax.mname =
                          (uu___96_1188.FStar_Syntax_Syntax.mname);
                        FStar_Syntax_Syntax.univs =
                          (uu___96_1188.FStar_Syntax_Syntax.univs);
                        FStar_Syntax_Syntax.binders =
                          (uu___96_1188.FStar_Syntax_Syntax.binders);
                        FStar_Syntax_Syntax.signature =
                          (uu___96_1188.FStar_Syntax_Syntax.signature);
                        FStar_Syntax_Syntax.ret_wp =
                          (uu___96_1188.FStar_Syntax_Syntax.ret_wp);
                        FStar_Syntax_Syntax.bind_wp =
                          (uu___96_1188.FStar_Syntax_Syntax.bind_wp);
                        FStar_Syntax_Syntax.if_then_else = _0_437;
                        FStar_Syntax_Syntax.ite_wp = _0_436;
                        FStar_Syntax_Syntax.stronger = _0_435;
                        FStar_Syntax_Syntax.close_wp = _0_434;
                        FStar_Syntax_Syntax.assert_p = _0_433;
                        FStar_Syntax_Syntax.assume_p = _0_432;
                        FStar_Syntax_Syntax.null_wp = _0_431;
                        FStar_Syntax_Syntax.trivial = _0_430;
                        FStar_Syntax_Syntax.repr =
                          (uu___96_1188.FStar_Syntax_Syntax.repr);
                        FStar_Syntax_Syntax.return_repr =
                          (uu___96_1188.FStar_Syntax_Syntax.return_repr);
                        FStar_Syntax_Syntax.bind_repr =
                          (uu___96_1188.FStar_Syntax_Syntax.bind_repr);
                        FStar_Syntax_Syntax.actions =
                          (uu___96_1188.FStar_Syntax_Syntax.actions)
                      }  in
                    (_0_439, _0_438)))))
  
type env_ = env
let get_env : env -> FStar_TypeChecker_Env.env = fun env  -> env.env 
type nm =
  | N of FStar_Syntax_Syntax.typ 
  | M of FStar_Syntax_Syntax.typ 
let uu___is_N : nm -> Prims.bool =
  fun projectee  -> match projectee with | N _0 -> true | uu____1210 -> false 
let __proj__N__item___0 : nm -> FStar_Syntax_Syntax.typ =
  fun projectee  -> match projectee with | N _0 -> _0 
let uu___is_M : nm -> Prims.bool =
  fun projectee  -> match projectee with | M _0 -> true | uu____1222 -> false 
let __proj__M__item___0 : nm -> FStar_Syntax_Syntax.typ =
  fun projectee  -> match projectee with | M _0 -> _0 
type nm_ = nm
let nm_of_comp : FStar_Syntax_Syntax.comp' -> nm =
  fun uu___83_1232  ->
    match uu___83_1232 with
    | FStar_Syntax_Syntax.Total (t,uu____1234) -> N t
    | FStar_Syntax_Syntax.Comp c when
        FStar_All.pipe_right c.FStar_Syntax_Syntax.flags
          (FStar_Util.for_some
             (fun uu___82_1243  ->
                match uu___82_1243 with
                | FStar_Syntax_Syntax.CPS  -> true
                | uu____1244 -> false))
        -> M (c.FStar_Syntax_Syntax.result_typ)
    | FStar_Syntax_Syntax.Comp c ->
        failwith
          (let _0_441 =
             let _0_440 = FStar_Syntax_Syntax.mk_Comp c  in
             FStar_All.pipe_left FStar_Syntax_Print.comp_to_string _0_440  in
           FStar_Util.format1 "[nm_of_comp]: impossible (%s)" _0_441)
    | FStar_Syntax_Syntax.GTotal uu____1246 ->
        failwith "[nm_of_comp]: impossible (GTot)"
  
let string_of_nm : nm -> Prims.string =
  fun uu___84_1254  ->
    match uu___84_1254 with
    | N t ->
        let _0_442 = FStar_Syntax_Print.term_to_string t  in
        FStar_Util.format1 "N[%s]" _0_442
    | M t ->
        let _0_443 = FStar_Syntax_Print.term_to_string t  in
        FStar_Util.format1 "M[%s]" _0_443
  
let is_monadic_arrow : FStar_Syntax_Syntax.term' -> nm =
  fun n  ->
    match n with
    | FStar_Syntax_Syntax.Tm_arrow
        (uu____1260,{ FStar_Syntax_Syntax.n = n;
                      FStar_Syntax_Syntax.tk = uu____1262;
                      FStar_Syntax_Syntax.pos = uu____1263;
                      FStar_Syntax_Syntax.vars = uu____1264;_})
        -> nm_of_comp n
    | uu____1275 -> failwith "unexpected_argument: [is_monadic_arrow]"
  
let is_monadic_comp c =
  let uu____1287 = nm_of_comp c.FStar_Syntax_Syntax.n  in
  match uu____1287 with | M uu____1288 -> true | N uu____1289 -> false 
exception Not_found 
let uu___is_Not_found : Prims.exn -> Prims.bool =
  fun projectee  ->
    match projectee with | Not_found  -> true | uu____1293 -> false
  
let double_star :
  FStar_Syntax_Syntax.typ ->
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax
  =
  fun typ  ->
    let star_once typ =
      let _0_447 =
        let _0_445 =
          let _0_444 = FStar_Syntax_Syntax.new_bv None typ  in
          FStar_All.pipe_left FStar_Syntax_Syntax.mk_binder _0_444  in
        [_0_445]  in
      let _0_446 = FStar_Syntax_Syntax.mk_Total FStar_Syntax_Util.ktype0  in
      FStar_Syntax_Util.arrow _0_447 _0_446  in
    let _0_448 = FStar_All.pipe_right typ star_once  in
    FStar_All.pipe_left star_once _0_448
  
let rec mk_star_to_type :
  (FStar_Syntax_Syntax.term' ->
     (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
       FStar_Syntax_Syntax.syntax)
    ->
    env ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax ->
        (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
          FStar_Syntax_Syntax.syntax
  =
  fun mk  ->
    fun env  ->
      fun a  ->
        mk
          (FStar_Syntax_Syntax.Tm_arrow
             (let _0_453 =
                let _0_451 =
                  let _0_450 = FStar_Syntax_Syntax.null_bv (star_type' env a)
                     in
                  let _0_449 = FStar_Syntax_Syntax.as_implicit false  in
                  (_0_450, _0_449)  in
                [_0_451]  in
              let _0_452 =
                FStar_Syntax_Syntax.mk_Total FStar_Syntax_Util.ktype0  in
              (_0_453, _0_452)))

and star_type' :
  env ->
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax -> FStar_Syntax_Syntax.term
  =
  fun env  ->
    fun t  ->
      let mk x = (FStar_Syntax_Syntax.mk x) None t.FStar_Syntax_Syntax.pos
         in
      let mk_star_to_type = mk_star_to_type mk  in
      let t = FStar_Syntax_Subst.compress t  in
      match t.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_arrow (binders,uu____1373) ->
          let binders =
            FStar_List.map
              (fun uu____1392  ->
                 match uu____1392 with
                 | (bv,aqual) ->
                     let _0_455 =
                       let uu___97_1399 = bv  in
                       let _0_454 =
                         star_type' env bv.FStar_Syntax_Syntax.sort  in
                       {
                         FStar_Syntax_Syntax.ppname =
                           (uu___97_1399.FStar_Syntax_Syntax.ppname);
                         FStar_Syntax_Syntax.index =
                           (uu___97_1399.FStar_Syntax_Syntax.index);
                         FStar_Syntax_Syntax.sort = _0_454
                       }  in
                     (_0_455, aqual)) binders
             in
          (match t.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Tm_arrow
               (uu____1400,{
                             FStar_Syntax_Syntax.n =
                               FStar_Syntax_Syntax.GTotal (hn,uu____1402);
                             FStar_Syntax_Syntax.tk = uu____1403;
                             FStar_Syntax_Syntax.pos = uu____1404;
                             FStar_Syntax_Syntax.vars = uu____1405;_})
               ->
               mk
                 (FStar_Syntax_Syntax.Tm_arrow
                    (let _0_456 =
                       FStar_Syntax_Syntax.mk_GTotal (star_type' env hn)  in
                     (binders, _0_456)))
           | uu____1425 ->
               let uu____1426 = is_monadic_arrow t.FStar_Syntax_Syntax.n  in
               (match uu____1426 with
                | N hn ->
                    mk
                      (FStar_Syntax_Syntax.Tm_arrow
                         (let _0_457 =
                            FStar_Syntax_Syntax.mk_Total (star_type' env hn)
                             in
                          (binders, _0_457)))
                | M a ->
                    mk
                      (FStar_Syntax_Syntax.Tm_arrow
                         (let _0_463 =
                            let _0_461 =
                              let _0_460 =
                                let _0_459 =
                                  FStar_Syntax_Syntax.null_bv
                                    (mk_star_to_type env a)
                                   in
                                let _0_458 =
                                  FStar_Syntax_Syntax.as_implicit false  in
                                (_0_459, _0_458)  in
                              [_0_460]  in
                            FStar_List.append binders _0_461  in
                          let _0_462 =
                            FStar_Syntax_Syntax.mk_Total
                              FStar_Syntax_Util.ktype0
                             in
                          (_0_463, _0_462)))))
      | FStar_Syntax_Syntax.Tm_app (head,args) ->
          let debug t s =
            let string_of_set f s =
              let elts = FStar_Util.set_elements s  in
              match elts with
              | [] -> "{}"
              | x::xs ->
                  let strb = FStar_Util.new_string_builder ()  in
                  (FStar_Util.string_builder_append strb "{";
                   (let _0_464 = f x  in
                    FStar_Util.string_builder_append strb _0_464);
                   FStar_List.iter
                     (fun x  ->
                        FStar_Util.string_builder_append strb ", ";
                        (let _0_465 = f x  in
                         FStar_Util.string_builder_append strb _0_465)) xs;
                   FStar_Util.string_builder_append strb "}";
                   FStar_Util.string_of_string_builder strb)
               in
            let _0_467 = FStar_Syntax_Print.term_to_string t  in
            let _0_466 = string_of_set FStar_Syntax_Print.bv_to_string s  in
            FStar_Util.print2_warning "Dependency found in term %s : %s"
              _0_467 _0_466
             in
          let rec is_non_dependent_arrow ty n =
            let uu____1499 =
              (FStar_Syntax_Subst.compress ty).FStar_Syntax_Syntax.n  in
            match uu____1499 with
            | FStar_Syntax_Syntax.Tm_arrow (binders,c) ->
                let uu____1512 =
                  Prims.op_Negation (FStar_Syntax_Util.is_tot_or_gtot_comp c)
                   in
                if uu____1512
                then false
                else
                  (try
                     let non_dependent_or_raise s ty =
                       let sinter =
                         let _0_468 = FStar_Syntax_Free.names ty  in
                         FStar_Util.set_intersect _0_468 s  in
                       let uu____1526 =
                         Prims.op_Negation (FStar_Util.set_is_empty sinter)
                          in
                       if uu____1526
                       then (debug ty sinter; Prims.raise Not_found)
                       else ()  in
                     let uu____1529 = FStar_Syntax_Subst.open_comp binders c
                        in
                     match uu____1529 with
                     | (binders,c) ->
                         let s =
                           FStar_List.fold_left
                             (fun s  ->
                                fun uu____1540  ->
                                  match uu____1540 with
                                  | (bv,uu____1546) ->
                                      (non_dependent_or_raise s
                                         bv.FStar_Syntax_Syntax.sort;
                                       FStar_Util.set_add bv s))
                             FStar_Syntax_Syntax.no_names binders
                            in
                         let ct = FStar_Syntax_Util.comp_result c  in
                         (non_dependent_or_raise s ct;
                          (let k = n - (FStar_List.length binders)  in
                           if k > (Prims.parse_int "0")
                           then is_non_dependent_arrow ct k
                           else true))
                   with | Not_found  -> false)
            | uu____1559 ->
                ((let _0_469 = FStar_Syntax_Print.term_to_string ty  in
                  FStar_Util.print1_warning "Not a dependent arrow : %s"
                    _0_469);
                 false)
             in
          let rec is_valid_application head =
            let uu____1565 =
              (FStar_Syntax_Subst.compress head).FStar_Syntax_Syntax.n  in
            match uu____1565 with
            | FStar_Syntax_Syntax.Tm_fvar fv when
                (((FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Syntax_Const.option_lid)
                    ||
                    (FStar_Syntax_Syntax.fv_eq_lid fv
                       FStar_Syntax_Const.either_lid))
                   ||
                   (FStar_Syntax_Syntax.fv_eq_lid fv
                      FStar_Syntax_Const.eq2_lid))
                  ||
                  (FStar_Syntax_Util.is_tuple_constructor
                     (FStar_Syntax_Subst.compress head))
                -> true
            | FStar_Syntax_Syntax.Tm_fvar fv when
                is_non_dependent_arrow
                  (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.ty
                  (FStar_List.length args)
                ->
                let res =
                  FStar_TypeChecker_Normalize.normalize
                    [FStar_TypeChecker_Normalize.Inlining;
                    FStar_TypeChecker_Normalize.UnfoldUntil
                      FStar_Syntax_Syntax.Delta_constant] env.env t
                   in
                (match res.FStar_Syntax_Syntax.n with
                 | FStar_Syntax_Syntax.Tm_app uu____1579 -> true
                 | uu____1589 ->
                     ((let _0_470 = FStar_Syntax_Print.term_to_string head
                          in
                       FStar_Util.print1_warning
                         "Got a term which might be a non-dependent user-defined data-type %s\n"
                         _0_470);
                      false))
            | FStar_Syntax_Syntax.Tm_bvar _|FStar_Syntax_Syntax.Tm_name _ ->
                true
            | FStar_Syntax_Syntax.Tm_uinst (t,uu____1594) ->
                is_valid_application t
            | uu____1599 -> false  in
          let uu____1600 = is_valid_application head  in
          if uu____1600
          then
            mk
              (FStar_Syntax_Syntax.Tm_app
                 (let _0_472 =
                    FStar_List.map
                      (fun uu____1612  ->
                         match uu____1612 with
                         | (t,qual) ->
                             let _0_471 = star_type' env t  in (_0_471, qual))
                      args
                     in
                  (head, _0_472)))
          else
            Prims.raise
              (FStar_Errors.Err
                 (let _0_473 = FStar_Syntax_Print.term_to_string t  in
                  FStar_Util.format1
                    "For now, only [either], [option] and [eq2] are supported in the definition language (got: %s)"
                    _0_473))
      | FStar_Syntax_Syntax.Tm_bvar _
        |FStar_Syntax_Syntax.Tm_name _
         |FStar_Syntax_Syntax.Tm_type _|FStar_Syntax_Syntax.Tm_fvar _ -> t
      | FStar_Syntax_Syntax.Tm_abs (binders,repr,something) ->
          let uu____1655 = FStar_Syntax_Subst.open_term binders repr  in
          (match uu____1655 with
           | (binders,repr) ->
               let env =
                 let uu___100_1661 = env  in
                 let _0_474 =
                   FStar_TypeChecker_Env.push_binders env.env binders  in
                 {
                   env = _0_474;
                   subst = (uu___100_1661.subst);
                   tc_const = (uu___100_1661.tc_const)
                 }  in
               let repr = star_type' env repr  in
               FStar_Syntax_Util.abs binders repr something)
      | FStar_Syntax_Syntax.Tm_refine (x,t) when false ->
          let x = FStar_Syntax_Syntax.freshen_bv x  in
          let sort = star_type' env x.FStar_Syntax_Syntax.sort  in
          let subst = [FStar_Syntax_Syntax.DB ((Prims.parse_int "0"), x)]  in
          let t = FStar_Syntax_Subst.subst subst t  in
          let t = star_type' env t  in
          let subst = [FStar_Syntax_Syntax.NM (x, (Prims.parse_int "0"))]  in
          let t = FStar_Syntax_Subst.subst subst t  in
          mk
            (FStar_Syntax_Syntax.Tm_refine
               ((let uu___101_1678 = x  in
                 {
                   FStar_Syntax_Syntax.ppname =
                     (uu___101_1678.FStar_Syntax_Syntax.ppname);
                   FStar_Syntax_Syntax.index =
                     (uu___101_1678.FStar_Syntax_Syntax.index);
                   FStar_Syntax_Syntax.sort = sort
                 }), t))
      | FStar_Syntax_Syntax.Tm_meta (t,m) ->
          mk
            (FStar_Syntax_Syntax.Tm_meta
               (let _0_475 = star_type' env t  in (_0_475, m)))
      | FStar_Syntax_Syntax.Tm_ascribed (e,FStar_Util.Inl t,something) ->
          mk
            (FStar_Syntax_Syntax.Tm_ascribed
               (let _0_477 = star_type' env e  in
                let _0_476 = FStar_Util.Inl (star_type' env t)  in
                (_0_477, _0_476, something)))
      | FStar_Syntax_Syntax.Tm_ascribed uu____1713 ->
          Prims.raise
            (FStar_Errors.Err
               (let _0_478 = FStar_Syntax_Print.term_to_string t  in
                FStar_Util.format1
                  "Tm_ascribed is outside of the definition language: %s"
                  _0_478))
      | FStar_Syntax_Syntax.Tm_refine uu____1726 ->
          Prims.raise
            (FStar_Errors.Err
               (let _0_479 = FStar_Syntax_Print.term_to_string t  in
                FStar_Util.format1
                  "Tm_refine is outside of the definition language: %s"
                  _0_479))
      | FStar_Syntax_Syntax.Tm_uinst uu____1731 ->
          Prims.raise
            (FStar_Errors.Err
               (let _0_480 = FStar_Syntax_Print.term_to_string t  in
                FStar_Util.format1
                  "Tm_uinst is outside of the definition language: %s" _0_480))
      | FStar_Syntax_Syntax.Tm_constant uu____1736 ->
          Prims.raise
            (FStar_Errors.Err
               (let _0_481 = FStar_Syntax_Print.term_to_string t  in
                FStar_Util.format1
                  "Tm_constant is outside of the definition language: %s"
                  _0_481))
      | FStar_Syntax_Syntax.Tm_match uu____1737 ->
          Prims.raise
            (FStar_Errors.Err
               (let _0_482 = FStar_Syntax_Print.term_to_string t  in
                FStar_Util.format1
                  "Tm_match is outside of the definition language: %s" _0_482))
      | FStar_Syntax_Syntax.Tm_let uu____1753 ->
          Prims.raise
            (FStar_Errors.Err
               (let _0_483 = FStar_Syntax_Print.term_to_string t  in
                FStar_Util.format1
                  "Tm_let is outside of the definition language: %s" _0_483))
      | FStar_Syntax_Syntax.Tm_uvar uu____1761 ->
          Prims.raise
            (FStar_Errors.Err
               (let _0_484 = FStar_Syntax_Print.term_to_string t  in
                FStar_Util.format1
                  "Tm_uvar is outside of the definition language: %s" _0_484))
      | FStar_Syntax_Syntax.Tm_unknown  ->
          Prims.raise
            (FStar_Errors.Err
               (let _0_485 = FStar_Syntax_Print.term_to_string t  in
                FStar_Util.format1
                  "Tm_unknown is outside of the definition language: %s"
                  _0_485))
      | FStar_Syntax_Syntax.Tm_delayed uu____1770 -> failwith "impossible"

let is_monadic uu___86_1803 =
  match uu___86_1803 with
  | None  -> failwith "un-annotated lambda?!"
  | Some (FStar_Util.Inl
    { FStar_Syntax_Syntax.eff_name = _; FStar_Syntax_Syntax.res_typ = _;
      FStar_Syntax_Syntax.cflags = flags; FStar_Syntax_Syntax.comp = _;_})
    |Some (FStar_Util.Inr (_,flags)) ->
      FStar_All.pipe_right flags
        (FStar_Util.for_some
           (fun uu___85_1840  ->
              match uu___85_1840 with
              | FStar_Syntax_Syntax.CPS  -> true
              | uu____1841 -> false))
  
let rec is_C : FStar_Syntax_Syntax.typ -> Prims.bool =
  fun t  ->
    let uu____1845 = (FStar_Syntax_Subst.compress t).FStar_Syntax_Syntax.n
       in
    match uu____1845 with
    | FStar_Syntax_Syntax.Tm_app (head,args) when
        FStar_Syntax_Util.is_tuple_constructor head ->
        let r = is_C (Prims.fst (FStar_List.hd args))  in
        if r
        then
          ((let uu____1870 =
              Prims.op_Negation
                (FStar_List.for_all
                   (fun uu____1873  ->
                      match uu____1873 with | (h,uu____1877) -> is_C h) args)
               in
            if uu____1870 then failwith "not a C (A * C)" else ());
           true)
        else
          ((let uu____1881 =
              Prims.op_Negation
                (FStar_List.for_all
                   (fun uu____1884  ->
                      match uu____1884 with
                      | (h,uu____1888) -> Prims.op_Negation (is_C h)) args)
               in
            if uu____1881 then failwith "not a C (C * A)" else ());
           false)
    | FStar_Syntax_Syntax.Tm_arrow (binders,comp) ->
        let uu____1902 = nm_of_comp comp.FStar_Syntax_Syntax.n  in
        (match uu____1902 with
         | M t ->
             ((let uu____1905 = is_C t  in
               if uu____1905 then failwith "not a C (C -> C)" else ());
              true)
         | N t -> is_C t)
    | FStar_Syntax_Syntax.Tm_meta (t,_)
      |FStar_Syntax_Syntax.Tm_uinst (t,_)|FStar_Syntax_Syntax.Tm_ascribed
       (t,_,_) -> is_C t
    | uu____1932 -> false
  
let mk_return :
  env ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun env  ->
    fun t  ->
      fun e  ->
        let mk x = (FStar_Syntax_Syntax.mk x) None e.FStar_Syntax_Syntax.pos
           in
        let p_type = mk_star_to_type mk env t  in
        let p = FStar_Syntax_Syntax.gen_bv "p'" None p_type  in
        let body =
          mk
            (FStar_Syntax_Syntax.Tm_app
               (let _0_489 = FStar_Syntax_Syntax.bv_to_name p  in
                let _0_488 =
                  let _0_487 =
                    let _0_486 = FStar_Syntax_Syntax.as_implicit false  in
                    (e, _0_486)  in
                  [_0_487]  in
                (_0_489, _0_488)))
           in
        let _0_492 =
          let _0_490 = FStar_Syntax_Syntax.mk_binder p  in [_0_490]  in
        let _0_491 =
          Some
            (FStar_Util.Inl
               (FStar_Syntax_Util.lcomp_of_comp
                  (FStar_Syntax_Syntax.mk_Total FStar_Syntax_Util.ktype0)))
           in
        FStar_Syntax_Util.abs _0_492 body _0_491
  
let is_unknown : FStar_Syntax_Syntax.term' -> Prims.bool =
  fun uu___87_1980  ->
    match uu___87_1980 with
    | FStar_Syntax_Syntax.Tm_unknown  -> true
    | uu____1981 -> false
  
let rec check :
  env ->
    FStar_Syntax_Syntax.term ->
      nm -> (nm * FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun e  ->
      fun context_nm  ->
        let mk x = FStar_Syntax_Syntax.mk x None e.FStar_Syntax_Syntax.pos
           in
        let return_if uu____2125 =
          match uu____2125 with
          | (rec_nm,s_e,u_e) ->
              let check t1 t2 =
                let uu____2146 =
                  (Prims.op_Negation (is_unknown t2.FStar_Syntax_Syntax.n))
                    &&
                    (Prims.op_Negation
                       (FStar_TypeChecker_Rel.is_trivial
                          (FStar_TypeChecker_Rel.teq env.env t1 t2)))
                   in
                if uu____2146
                then
                  Prims.raise
                    (FStar_Errors.Err
                       (let _0_495 = FStar_Syntax_Print.term_to_string e  in
                        let _0_494 = FStar_Syntax_Print.term_to_string t1  in
                        let _0_493 = FStar_Syntax_Print.term_to_string t2  in
                        FStar_Util.format3
                          "[check]: the expression [%s] has type [%s] but should have type [%s]"
                          _0_495 _0_494 _0_493))
                else ()  in
              (match (rec_nm, context_nm) with
               | (N t1,N t2)|(M t1,M t2) -> (check t1 t2; (rec_nm, s_e, u_e))
               | (N t1,M t2) ->
                   (check t1 t2;
                    (let _0_496 = mk_return env t1 s_e  in
                     ((M t1), _0_496, u_e)))
               | (M t1,N t2) ->
                   Prims.raise
                     (FStar_Errors.Err
                        (let _0_499 = FStar_Syntax_Print.term_to_string e  in
                         let _0_498 = FStar_Syntax_Print.term_to_string t1
                            in
                         let _0_497 = FStar_Syntax_Print.term_to_string t2
                            in
                         FStar_Util.format3
                           "[check %s]: got an effectful computation [%s] in lieu of a pure computation [%s]"
                           _0_499 _0_498 _0_497)))
           in
        let ensure_m env e2 =
          let strip_m uu___88_2184 =
            match uu___88_2184 with
            | (M t,s_e,u_e) -> (t, s_e, u_e)
            | uu____2194 -> failwith "impossible"  in
          match context_nm with
          | N t ->
              Prims.raise
                (FStar_Errors.Error
                   (let _0_501 =
                      let _0_500 = FStar_Syntax_Print.term_to_string t  in
                      Prims.strcat
                        "let-bound monadic body has a non-monadic continuation or a branch of a match is monadic and the others aren't : "
                        _0_500
                       in
                    (_0_501, (e2.FStar_Syntax_Syntax.pos))))
          | M uu____2208 -> strip_m (check env e2 context_nm)  in
        let uu____2209 =
          (FStar_Syntax_Subst.compress e).FStar_Syntax_Syntax.n  in
        match uu____2209 with
        | FStar_Syntax_Syntax.Tm_bvar _
          |FStar_Syntax_Syntax.Tm_name _
           |FStar_Syntax_Syntax.Tm_fvar _
            |FStar_Syntax_Syntax.Tm_abs _
             |FStar_Syntax_Syntax.Tm_constant _|FStar_Syntax_Syntax.Tm_app _
            -> return_if (infer env e)
        | FStar_Syntax_Syntax.Tm_let ((false ,binding::[]),e2) ->
            mk_let env binding e2
              (fun env  -> fun e2  -> check env e2 context_nm) ensure_m
        | FStar_Syntax_Syntax.Tm_match (e0,branches) ->
            mk_match env e0 branches
              (fun env  -> fun body  -> check env body context_nm)
        | FStar_Syntax_Syntax.Tm_meta (e,_)
          |FStar_Syntax_Syntax.Tm_uinst (e,_)|FStar_Syntax_Syntax.Tm_ascribed
           (e,_,_) -> check env e context_nm
        | FStar_Syntax_Syntax.Tm_let uu____2285 ->
            failwith
              (let _0_502 = FStar_Syntax_Print.term_to_string e  in
               FStar_Util.format1 "[check]: Tm_let %s" _0_502)
        | FStar_Syntax_Syntax.Tm_type uu____2296 ->
            failwith "impossible (DM stratification)"
        | FStar_Syntax_Syntax.Tm_arrow uu____2300 ->
            failwith "impossible (DM stratification)"
        | FStar_Syntax_Syntax.Tm_refine uu____2311 ->
            failwith
              (let _0_503 = FStar_Syntax_Print.term_to_string e  in
               FStar_Util.format1 "[check]: Tm_refine %s" _0_503)
        | FStar_Syntax_Syntax.Tm_uvar uu____2319 ->
            failwith
              (let _0_504 = FStar_Syntax_Print.term_to_string e  in
               FStar_Util.format1 "[check]: Tm_uvar %s" _0_504)
        | FStar_Syntax_Syntax.Tm_delayed uu____2331 ->
            failwith "impossible (compressed)"
        | FStar_Syntax_Syntax.Tm_unknown  ->
            failwith
              (let _0_505 = FStar_Syntax_Print.term_to_string e  in
               FStar_Util.format1 "[check]: Tm_unknown %s" _0_505)

and infer :
  env ->
    FStar_Syntax_Syntax.term ->
      (nm * FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun e  ->
      let mk x = FStar_Syntax_Syntax.mk x None e.FStar_Syntax_Syntax.pos  in
      let normalize =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Normalize.Beta;
          FStar_TypeChecker_Normalize.Eager_unfolding;
          FStar_TypeChecker_Normalize.UnfoldUntil
            FStar_Syntax_Syntax.Delta_constant;
          FStar_TypeChecker_Normalize.EraseUniverses] env.env
         in
      let uu____2376 = (FStar_Syntax_Subst.compress e).FStar_Syntax_Syntax.n
         in
      match uu____2376 with
      | FStar_Syntax_Syntax.Tm_bvar bv ->
          failwith "I failed to open a binder... boo"
      | FStar_Syntax_Syntax.Tm_name bv ->
          ((N (bv.FStar_Syntax_Syntax.sort)), e, e)
      | FStar_Syntax_Syntax.Tm_abs (binders,body,what) ->
          let binders = FStar_Syntax_Subst.open_binders binders  in
          let subst = FStar_Syntax_Subst.opening_of_binders binders  in
          let body = FStar_Syntax_Subst.subst subst body  in
          let env =
            let uu___102_2414 = env  in
            let _0_506 = FStar_TypeChecker_Env.push_binders env.env binders
               in
            {
              env = _0_506;
              subst = (uu___102_2414.subst);
              tc_const = (uu___102_2414.tc_const)
            }  in
          let s_binders =
            FStar_List.map
              (fun uu____2423  ->
                 match uu____2423 with
                 | (bv,qual) ->
                     let sort = star_type' env bv.FStar_Syntax_Syntax.sort
                        in
                     ((let uu___103_2431 = bv  in
                       {
                         FStar_Syntax_Syntax.ppname =
                           (uu___103_2431.FStar_Syntax_Syntax.ppname);
                         FStar_Syntax_Syntax.index =
                           (uu___103_2431.FStar_Syntax_Syntax.index);
                         FStar_Syntax_Syntax.sort = sort
                       }), qual)) binders
             in
          let uu____2432 =
            FStar_List.fold_left
              (fun uu____2441  ->
                 fun uu____2442  ->
                   match (uu____2441, uu____2442) with
                   | ((env,acc),(bv,qual)) ->
                       let c = bv.FStar_Syntax_Syntax.sort  in
                       let uu____2470 = is_C c  in
                       if uu____2470
                       then
                         let xw =
                           let _0_507 = star_type' env c  in
                           FStar_Syntax_Syntax.gen_bv
                             (Prims.strcat
                                (bv.FStar_Syntax_Syntax.ppname).FStar_Ident.idText
                                "^w") None _0_507
                            in
                         let x =
                           let uu___104_2476 = bv  in
                           let _0_509 =
                             let _0_508 = FStar_Syntax_Syntax.bv_to_name xw
                                in
                             trans_F_ env c _0_508  in
                           {
                             FStar_Syntax_Syntax.ppname =
                               (uu___104_2476.FStar_Syntax_Syntax.ppname);
                             FStar_Syntax_Syntax.index =
                               (uu___104_2476.FStar_Syntax_Syntax.index);
                             FStar_Syntax_Syntax.sort = _0_509
                           }  in
                         let env =
                           let uu___105_2478 = env  in
                           let _0_512 =
                             let _0_511 =
                               FStar_Syntax_Syntax.NT
                                 (let _0_510 =
                                    FStar_Syntax_Syntax.bv_to_name xw  in
                                  (bv, _0_510))
                                in
                             _0_511 :: (env.subst)  in
                           {
                             env = (uu___105_2478.env);
                             subst = _0_512;
                             tc_const = (uu___105_2478.tc_const)
                           }  in
                         let _0_516 =
                           let _0_515 = FStar_Syntax_Syntax.mk_binder x  in
                           let _0_514 =
                             let _0_513 = FStar_Syntax_Syntax.mk_binder xw
                                in
                             _0_513 :: acc  in
                           _0_515 :: _0_514  in
                         (env, _0_516)
                       else
                         (let x =
                            let uu___106_2482 = bv  in
                            let _0_517 =
                              star_type' env bv.FStar_Syntax_Syntax.sort  in
                            {
                              FStar_Syntax_Syntax.ppname =
                                (uu___106_2482.FStar_Syntax_Syntax.ppname);
                              FStar_Syntax_Syntax.index =
                                (uu___106_2482.FStar_Syntax_Syntax.index);
                              FStar_Syntax_Syntax.sort = _0_517
                            }  in
                          let _0_519 =
                            let _0_518 = FStar_Syntax_Syntax.mk_binder x  in
                            _0_518 :: acc  in
                          (env, _0_519))) (env, []) binders
             in
          (match uu____2432 with
           | (env,u_binders) ->
               let u_binders = FStar_List.rev u_binders  in
               let uu____2494 =
                 let check_what =
                   let uu____2506 = is_monadic what  in
                   if uu____2506 then check_m else check_n  in
                 let uu____2515 = check_what env body  in
                 match uu____2515 with
                 | (t,s_body,u_body) ->
                     let _0_520 =
                       comp_of_nm
                         (let uu____2525 = is_monadic what  in
                          if uu____2525 then M t else N t)
                        in
                     (_0_520, s_body, u_body)
                  in
               (match uu____2494 with
                | (comp,s_body,u_body) ->
                    let t = FStar_Syntax_Util.arrow binders comp  in
                    let s_what =
                      match what with
                      | None  -> None
                      | Some (FStar_Util.Inl lc) ->
                          let uu____2568 =
                            FStar_All.pipe_right
                              lc.FStar_Syntax_Syntax.cflags
                              (FStar_Util.for_some
                                 (fun uu___89_2570  ->
                                    match uu___89_2570 with
                                    | FStar_Syntax_Syntax.CPS  -> true
                                    | uu____2571 -> false))
                             in
                          if uu____2568
                          then
                            let double_starred_comp =
                              FStar_Syntax_Syntax.mk_Total
                                (let _0_521 =
                                   FStar_Syntax_Util.comp_result
                                     (lc.FStar_Syntax_Syntax.comp ())
                                    in
                                 FStar_All.pipe_left double_star _0_521)
                               in
                            let flags =
                              FStar_List.filter
                                (fun uu___90_2581  ->
                                   match uu___90_2581 with
                                   | FStar_Syntax_Syntax.CPS  -> false
                                   | uu____2582 -> true)
                                lc.FStar_Syntax_Syntax.cflags
                               in
                            Some
                              (FStar_Util.Inl
                                 (FStar_Syntax_Util.lcomp_of_comp
                                    (FStar_Syntax_Util.comp_set_flags
                                       double_starred_comp flags)))
                          else
                            Some
                              (FStar_Util.Inl
                                 ((let uu___107_2600 = lc  in
                                   {
                                     FStar_Syntax_Syntax.eff_name =
                                       (uu___107_2600.FStar_Syntax_Syntax.eff_name);
                                     FStar_Syntax_Syntax.res_typ =
                                       (uu___107_2600.FStar_Syntax_Syntax.res_typ);
                                     FStar_Syntax_Syntax.cflags =
                                       (uu___107_2600.FStar_Syntax_Syntax.cflags);
                                     FStar_Syntax_Syntax.comp =
                                       (fun uu____2601  ->
                                          let c =
                                            lc.FStar_Syntax_Syntax.comp ()
                                             in
                                          let result_typ =
                                            star_type' env
                                              (FStar_Syntax_Util.comp_result
                                                 c)
                                             in
                                          FStar_Syntax_Util.set_result_typ c
                                            result_typ)
                                   })))
                      | Some (FStar_Util.Inr (lid,flags)) ->
                          Some
                            (FStar_Util.Inr
                               (let uu____2626 =
                                  FStar_All.pipe_right flags
                                    (FStar_Util.for_some
                                       (fun uu___91_2628  ->
                                          match uu___91_2628 with
                                          | FStar_Syntax_Syntax.CPS  -> true
                                          | uu____2629 -> false))
                                   in
                                if uu____2626
                                then
                                  let _0_522 =
                                    FStar_List.filter
                                      (fun uu___92_2634  ->
                                         match uu___92_2634 with
                                         | FStar_Syntax_Syntax.CPS  -> false
                                         | uu____2635 -> true) flags
                                     in
                                  (FStar_Syntax_Const.effect_Tot_lid, _0_522)
                                else (lid, flags)))
                       in
                    let uu____2638 =
                      let comp =
                        let _0_524 = is_monadic what  in
                        let _0_523 =
                          FStar_Syntax_Subst.subst env.subst s_body  in
                        trans_G env (FStar_Syntax_Util.comp_result comp)
                          _0_524 _0_523
                         in
                      let _0_525 =
                        FStar_Syntax_Util.ascribe u_body
                          (FStar_Util.Inr comp)
                         in
                      (_0_525,
                        (Some
                           (FStar_Util.Inl
                              (FStar_Syntax_Util.lcomp_of_comp comp))))
                       in
                    (match uu____2638 with
                     | (u_body,u_what) ->
                         let s_body =
                           FStar_Syntax_Subst.close s_binders s_body  in
                         let s_binders =
                           FStar_Syntax_Subst.close_binders s_binders  in
                         let s_term =
                           mk
                             (FStar_Syntax_Syntax.Tm_abs
                                (s_binders, s_body, s_what))
                            in
                         let u_body =
                           FStar_Syntax_Subst.close u_binders u_body  in
                         let u_binders =
                           FStar_Syntax_Subst.close_binders u_binders  in
                         let u_term =
                           mk
                             (FStar_Syntax_Syntax.Tm_abs
                                (u_binders, u_body, u_what))
                            in
                         ((N t), s_term, u_term))))
      | FStar_Syntax_Syntax.Tm_fvar
          {
            FStar_Syntax_Syntax.fv_name =
              { FStar_Syntax_Syntax.v = lid;
                FStar_Syntax_Syntax.ty = uu____2716;
                FStar_Syntax_Syntax.p = uu____2717;_};
            FStar_Syntax_Syntax.fv_delta = uu____2718;
            FStar_Syntax_Syntax.fv_qual = uu____2719;_}
          ->
          let uu____2725 = FStar_TypeChecker_Env.lookup_lid env.env lid  in
          (match uu____2725 with
           | (uu____2731,t) ->
               let _0_526 = N (normalize t)  in (_0_526, e, e))
      | FStar_Syntax_Syntax.Tm_app (head,args) ->
          let uu____2749 = check_n env head  in
          (match uu____2749 with
           | (t_head,s_head,u_head) ->
               let is_arrow t =
                 let uu____2763 =
                   (FStar_Syntax_Subst.compress t).FStar_Syntax_Syntax.n  in
                 match uu____2763 with
                 | FStar_Syntax_Syntax.Tm_arrow uu____2764 -> true
                 | uu____2772 -> false  in
               let rec flatten t =
                 let uu____2784 =
                   (FStar_Syntax_Subst.compress t).FStar_Syntax_Syntax.n  in
                 match uu____2784 with
                 | FStar_Syntax_Syntax.Tm_arrow
                     (binders,{
                                FStar_Syntax_Syntax.n =
                                  FStar_Syntax_Syntax.Total (t,uu____2794);
                                FStar_Syntax_Syntax.tk = uu____2795;
                                FStar_Syntax_Syntax.pos = uu____2796;
                                FStar_Syntax_Syntax.vars = uu____2797;_})
                     when is_arrow t ->
                     let uu____2814 = flatten t  in
                     (match uu____2814 with
                      | (binders',comp) ->
                          ((FStar_List.append binders binders'), comp))
                 | FStar_Syntax_Syntax.Tm_arrow (binders,comp) ->
                     (binders, comp)
                 | FStar_Syntax_Syntax.Tm_ascribed (e,uu____2866,uu____2867)
                     -> flatten e
                 | uu____2886 ->
                     Prims.raise
                       (FStar_Errors.Err
                          (let _0_527 =
                             FStar_Syntax_Print.term_to_string t_head  in
                           FStar_Util.format1 "%s: not a function type"
                             _0_527))
                  in
               let uu____2894 = flatten t_head  in
               (match uu____2894 with
                | (binders,comp) ->
                    let n = FStar_List.length binders  in
                    let n' = FStar_List.length args  in
                    (if
                       (FStar_List.length binders) < (FStar_List.length args)
                     then
                       Prims.raise
                         (FStar_Errors.Err
                            (let _0_530 = FStar_Util.string_of_int n  in
                             let _0_529 = FStar_Util.string_of_int (n' - n)
                                in
                             let _0_528 = FStar_Util.string_of_int n  in
                             FStar_Util.format3
                               "The head of this application, after being applied to %s arguments, is an effectful computation (leaving %s arguments to be applied). Please let-bind the head applied to the %s first arguments."
                               _0_530 _0_529 _0_528))
                     else ();
                     (let uu____2951 =
                        FStar_Syntax_Subst.open_comp binders comp  in
                      match uu____2951 with
                      | (binders,comp) ->
                          let rec final_type subst uu____2978 args =
                            match uu____2978 with
                            | (binders,comp) ->
                                (match (binders, args) with
                                 | ([],[]) ->
                                     nm_of_comp
                                       (FStar_Syntax_Subst.subst_comp subst
                                          comp).FStar_Syntax_Syntax.n
                                 | (binders,[]) ->
                                     let uu____3037 =
                                       (FStar_Syntax_Subst.compress
                                          (let _0_531 =
                                             mk
                                               (FStar_Syntax_Syntax.Tm_arrow
                                                  (binders, comp))
                                              in
                                           FStar_Syntax_Subst.subst subst
                                             _0_531)).FStar_Syntax_Syntax.n
                                        in
                                     (match uu____3037 with
                                      | FStar_Syntax_Syntax.Tm_arrow
                                          (binders,comp) ->
                                          N
                                            (mk
                                               (FStar_Syntax_Syntax.Tm_arrow
                                                  (let _0_532 =
                                                     FStar_Syntax_Subst.close_comp
                                                       binders comp
                                                      in
                                                   (binders, _0_532))))
                                      | uu____3056 -> failwith "wat?")
                                 | ([],uu____3057::uu____3058) ->
                                     failwith "just checked that?!"
                                 | ((bv,uu____3083)::binders,(arg,uu____3086)::args)
                                     ->
                                     final_type
                                       ((FStar_Syntax_Syntax.NT (bv, arg)) ::
                                       subst) (binders, comp) args)
                             in
                          let final_type = final_type [] (binders, comp) args
                             in
                          let uu____3120 = FStar_List.splitAt n' binders  in
                          (match uu____3120 with
                           | (binders,uu____3137) ->
                               let uu____3150 =
                                 FStar_List.split
                                   (FStar_List.map2
                                      (fun uu____3176  ->
                                         fun uu____3177  ->
                                           match (uu____3176, uu____3177)
                                           with
                                           | ((bv,uu____3194),(arg,q)) ->
                                               let uu____3201 =
                                                 (FStar_Syntax_Subst.compress
                                                    bv.FStar_Syntax_Syntax.sort).FStar_Syntax_Syntax.n
                                                  in
                                               (match uu____3201 with
                                                | FStar_Syntax_Syntax.Tm_type
                                                    uu____3209 ->
                                                    let arg = (arg, q)  in
                                                    (arg, [arg])
                                                | uu____3222 ->
                                                    let uu____3223 =
                                                      check_n env arg  in
                                                    (match uu____3223 with
                                                     | (uu____3234,s_arg,u_arg)
                                                         ->
                                                         let _0_535 =
                                                           let uu____3242 =
                                                             is_C
                                                               bv.FStar_Syntax_Syntax.sort
                                                              in
                                                           if uu____3242
                                                           then
                                                             let _0_534 =
                                                               let _0_533 =
                                                                 FStar_Syntax_Subst.subst
                                                                   env.subst
                                                                   s_arg
                                                                  in
                                                               (_0_533, q)
                                                                in
                                                             [_0_534;
                                                             (u_arg, q)]
                                                           else [(u_arg, q)]
                                                            in
                                                         ((s_arg, q), _0_535))))
                                      binders args)
                                  in
                               (match uu____3150 with
                                | (s_args,u_args) ->
                                    let u_args = FStar_List.flatten u_args
                                       in
                                    let _0_537 =
                                      mk
                                        (FStar_Syntax_Syntax.Tm_app
                                           (s_head, s_args))
                                       in
                                    let _0_536 =
                                      mk
                                        (FStar_Syntax_Syntax.Tm_app
                                           (u_head, u_args))
                                       in
                                    (final_type, _0_537, _0_536)))))))
      | FStar_Syntax_Syntax.Tm_let ((false ,binding::[]),e2) ->
          mk_let env binding e2 infer check_m
      | FStar_Syntax_Syntax.Tm_match (e0,branches) ->
          mk_match env e0 branches infer
      | FStar_Syntax_Syntax.Tm_uinst (e,_)
        |FStar_Syntax_Syntax.Tm_meta (e,_)|FStar_Syntax_Syntax.Tm_ascribed
         (e,_,_) -> infer env e
      | FStar_Syntax_Syntax.Tm_constant c ->
          let _0_538 = N (env.tc_const c)  in (_0_538, e, e)
      | FStar_Syntax_Syntax.Tm_let uu____3355 ->
          failwith
            (let _0_539 = FStar_Syntax_Print.term_to_string e  in
             FStar_Util.format1 "[infer]: Tm_let %s" _0_539)
      | FStar_Syntax_Syntax.Tm_type uu____3366 ->
          failwith "impossible (DM stratification)"
      | FStar_Syntax_Syntax.Tm_arrow uu____3370 ->
          failwith "impossible (DM stratification)"
      | FStar_Syntax_Syntax.Tm_refine uu____3381 ->
          failwith
            (let _0_540 = FStar_Syntax_Print.term_to_string e  in
             FStar_Util.format1 "[infer]: Tm_refine %s" _0_540)
      | FStar_Syntax_Syntax.Tm_uvar uu____3389 ->
          failwith
            (let _0_541 = FStar_Syntax_Print.term_to_string e  in
             FStar_Util.format1 "[infer]: Tm_uvar %s" _0_541)
      | FStar_Syntax_Syntax.Tm_delayed uu____3401 ->
          failwith "impossible (compressed)"
      | FStar_Syntax_Syntax.Tm_unknown  ->
          failwith
            (let _0_542 = FStar_Syntax_Print.term_to_string e  in
             FStar_Util.format1 "[infer]: Tm_unknown %s" _0_542)

and mk_match :
  env ->
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax ->
      ((FStar_Syntax_Syntax.pat',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.withinfo_t *
        (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax Prims.option *
        (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax) Prims.list ->
        (env ->
           FStar_Syntax_Syntax.term ->
             (nm * FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.term))
          -> (nm * FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun e0  ->
      fun branches  ->
        fun f  ->
          let mk x = FStar_Syntax_Syntax.mk x None e0.FStar_Syntax_Syntax.pos
             in
          let uu____3462 = check_n env e0  in
          match uu____3462 with
          | (uu____3469,s_e0,u_e0) ->
              let uu____3472 =
                FStar_List.split
                  (FStar_List.map
                     (fun b  ->
                        let uu____3519 = FStar_Syntax_Subst.open_branch b  in
                        match uu____3519 with
                        | (pat,None ,body) ->
                            let env =
                              let uu___108_3551 = env  in
                              let _0_544 =
                                let _0_543 = FStar_Syntax_Syntax.pat_bvs pat
                                   in
                                FStar_List.fold_left
                                  FStar_TypeChecker_Env.push_bv env.env
                                  _0_543
                                 in
                              {
                                env = _0_544;
                                subst = (uu___108_3551.subst);
                                tc_const = (uu___108_3551.tc_const)
                              }  in
                            let uu____3552 = f env body  in
                            (match uu____3552 with
                             | (nm,s_body,u_body) ->
                                 (nm, (pat, None, (s_body, u_body, body))))
                        | uu____3601 ->
                            Prims.raise
                              (FStar_Errors.Err
                                 "No when clauses in the definition language"))
                     branches)
                 in
              (match uu____3472 with
               | (nms,branches) ->
                   let t1 =
                     let uu____3653 = FStar_List.hd nms  in
                     match uu____3653 with | M t1|N t1 -> t1  in
                   let has_m =
                     FStar_List.existsb
                       (fun uu___93_3656  ->
                          match uu___93_3656 with
                          | M uu____3657 -> true
                          | uu____3658 -> false) nms
                      in
                   let uu____3659 =
                     FStar_List.unzip3
                       (FStar_List.map2
                          (fun nm  ->
                             fun uu____3729  ->
                               match uu____3729 with
                               | (pat,guard,(s_body,u_body,original_body)) ->
                                   (match (nm, has_m) with
                                    | (N t2,false )|(M t2,true ) ->
                                        (nm, (pat, guard, s_body),
                                          (pat, guard, u_body))
                                    | (N t2,true ) ->
                                        let uu____3825 =
                                          check env original_body (M t2)  in
                                        (match uu____3825 with
                                         | (uu____3848,s_body,u_body) ->
                                             ((M t2), (pat, guard, s_body),
                                               (pat, guard, u_body)))
                                    | (M uu____3877,false ) ->
                                        failwith "impossible")) nms branches)
                      in
                   (match uu____3659 with
                    | (nms,s_branches,u_branches) ->
                        if has_m
                        then
                          let p_type = mk_star_to_type mk env t1  in
                          let p =
                            FStar_Syntax_Syntax.gen_bv "p''" None p_type  in
                          let s_branches =
                            FStar_List.map
                              (fun uu____3980  ->
                                 match uu____3980 with
                                 | (pat,guard,s_body) ->
                                     let s_body =
                                       mk
                                         (FStar_Syntax_Syntax.Tm_app
                                            (let _0_548 =
                                               let _0_547 =
                                                 let _0_546 =
                                                   FStar_Syntax_Syntax.bv_to_name
                                                     p
                                                    in
                                                 let _0_545 =
                                                   FStar_Syntax_Syntax.as_implicit
                                                     false
                                                    in
                                                 (_0_546, _0_545)  in
                                               [_0_547]  in
                                             (s_body, _0_548)))
                                        in
                                     (pat, guard, s_body)) s_branches
                             in
                          let s_branches =
                            FStar_List.map FStar_Syntax_Subst.close_branch
                              s_branches
                             in
                          let u_branches =
                            FStar_List.map FStar_Syntax_Subst.close_branch
                              u_branches
                             in
                          let s_e =
                            let _0_552 =
                              let _0_549 = FStar_Syntax_Syntax.mk_binder p
                                 in
                              [_0_549]  in
                            let _0_551 =
                              mk
                                (FStar_Syntax_Syntax.Tm_match
                                   (s_e0, s_branches))
                               in
                            let _0_550 =
                              Some
                                (FStar_Util.Inl
                                   (FStar_Syntax_Util.lcomp_of_comp
                                      (FStar_Syntax_Syntax.mk_Total
                                         FStar_Syntax_Util.ktype0)))
                               in
                            FStar_Syntax_Util.abs _0_552 _0_551 _0_550  in
                          let t1_star =
                            let _0_556 =
                              let _0_554 =
                                let _0_553 =
                                  FStar_Syntax_Syntax.new_bv None p_type  in
                                FStar_All.pipe_left
                                  FStar_Syntax_Syntax.mk_binder _0_553
                                 in
                              [_0_554]  in
                            let _0_555 =
                              FStar_Syntax_Syntax.mk_Total
                                FStar_Syntax_Util.ktype0
                               in
                            FStar_Syntax_Util.arrow _0_556 _0_555  in
                          let _0_558 =
                            mk
                              (FStar_Syntax_Syntax.Tm_ascribed
                                 (s_e, (FStar_Util.Inl t1_star), None))
                             in
                          let _0_557 =
                            mk
                              (FStar_Syntax_Syntax.Tm_match
                                 (u_e0, u_branches))
                             in
                          ((M t1), _0_558, _0_557)
                        else
                          (let s_branches =
                             FStar_List.map FStar_Syntax_Subst.close_branch
                               s_branches
                              in
                           let u_branches =
                             FStar_List.map FStar_Syntax_Subst.close_branch
                               u_branches
                              in
                           let t1_star = t1  in
                           let _0_561 =
                             mk
                               (FStar_Syntax_Syntax.Tm_ascribed
                                  (let _0_559 =
                                     mk
                                       (FStar_Syntax_Syntax.Tm_match
                                          (s_e0, s_branches))
                                      in
                                   (_0_559, (FStar_Util.Inl t1_star), None)))
                              in
                           let _0_560 =
                             mk
                               (FStar_Syntax_Syntax.Tm_match
                                  (u_e0, u_branches))
                              in
                           ((N t1), _0_561, _0_560))))

and mk_let :
  env_ ->
    FStar_Syntax_Syntax.letbinding ->
      FStar_Syntax_Syntax.term ->
        (env_ ->
           FStar_Syntax_Syntax.term ->
             (nm * FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.term))
          ->
          (env_ ->
             FStar_Syntax_Syntax.term ->
               (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.term *
                 FStar_Syntax_Syntax.term))
            -> (nm * FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun binding  ->
      fun e2  ->
        fun proceed  ->
          fun ensure_m  ->
            let mk x =
              FStar_Syntax_Syntax.mk x None e2.FStar_Syntax_Syntax.pos  in
            let e1 = binding.FStar_Syntax_Syntax.lbdef  in
            let x = FStar_Util.left binding.FStar_Syntax_Syntax.lbname  in
            let x_binders =
              let _0_562 = FStar_Syntax_Syntax.mk_binder x  in [_0_562]  in
            let uu____4126 = FStar_Syntax_Subst.open_term x_binders e2  in
            match uu____4126 with
            | (x_binders,e2) ->
                let uu____4134 = infer env e1  in
                (match uu____4134 with
                 | (N t1,s_e1,u_e1) ->
                     let u_binding =
                       let uu____4145 = is_C t1  in
                       if uu____4145
                       then
                         let uu___109_4146 = binding  in
                         let _0_564 =
                           let _0_563 =
                             FStar_Syntax_Subst.subst env.subst s_e1  in
                           trans_F_ env t1 _0_563  in
                         {
                           FStar_Syntax_Syntax.lbname =
                             (uu___109_4146.FStar_Syntax_Syntax.lbname);
                           FStar_Syntax_Syntax.lbunivs =
                             (uu___109_4146.FStar_Syntax_Syntax.lbunivs);
                           FStar_Syntax_Syntax.lbtyp = _0_564;
                           FStar_Syntax_Syntax.lbeff =
                             (uu___109_4146.FStar_Syntax_Syntax.lbeff);
                           FStar_Syntax_Syntax.lbdef =
                             (uu___109_4146.FStar_Syntax_Syntax.lbdef)
                         }
                       else binding  in
                     let env =
                       let uu___110_4149 = env  in
                       let _0_565 =
                         FStar_TypeChecker_Env.push_bv env.env
                           (let uu___111_4150 = x  in
                            {
                              FStar_Syntax_Syntax.ppname =
                                (uu___111_4150.FStar_Syntax_Syntax.ppname);
                              FStar_Syntax_Syntax.index =
                                (uu___111_4150.FStar_Syntax_Syntax.index);
                              FStar_Syntax_Syntax.sort = t1
                            })
                          in
                       {
                         env = _0_565;
                         subst = (uu___110_4149.subst);
                         tc_const = (uu___110_4149.tc_const)
                       }  in
                     let uu____4151 = proceed env e2  in
                     (match uu____4151 with
                      | (nm_rec,s_e2,u_e2) ->
                          let s_binding =
                            let uu___112_4162 = binding  in
                            let _0_566 =
                              star_type' env
                                binding.FStar_Syntax_Syntax.lbtyp
                               in
                            {
                              FStar_Syntax_Syntax.lbname =
                                (uu___112_4162.FStar_Syntax_Syntax.lbname);
                              FStar_Syntax_Syntax.lbunivs =
                                (uu___112_4162.FStar_Syntax_Syntax.lbunivs);
                              FStar_Syntax_Syntax.lbtyp = _0_566;
                              FStar_Syntax_Syntax.lbeff =
                                (uu___112_4162.FStar_Syntax_Syntax.lbeff);
                              FStar_Syntax_Syntax.lbdef =
                                (uu___112_4162.FStar_Syntax_Syntax.lbdef)
                            }  in
                          let _0_570 =
                            mk
                              (FStar_Syntax_Syntax.Tm_let
                                 (let _0_567 =
                                    FStar_Syntax_Subst.close x_binders s_e2
                                     in
                                  ((false,
                                     [(let uu___113_4171 = s_binding  in
                                       {
                                         FStar_Syntax_Syntax.lbname =
                                           (uu___113_4171.FStar_Syntax_Syntax.lbname);
                                         FStar_Syntax_Syntax.lbunivs =
                                           (uu___113_4171.FStar_Syntax_Syntax.lbunivs);
                                         FStar_Syntax_Syntax.lbtyp =
                                           (uu___113_4171.FStar_Syntax_Syntax.lbtyp);
                                         FStar_Syntax_Syntax.lbeff =
                                           (uu___113_4171.FStar_Syntax_Syntax.lbeff);
                                         FStar_Syntax_Syntax.lbdef = s_e1
                                       })]), _0_567)))
                             in
                          let _0_569 =
                            mk
                              (FStar_Syntax_Syntax.Tm_let
                                 (let _0_568 =
                                    FStar_Syntax_Subst.close x_binders u_e2
                                     in
                                  ((false,
                                     [(let uu___114_4176 = u_binding  in
                                       {
                                         FStar_Syntax_Syntax.lbname =
                                           (uu___114_4176.FStar_Syntax_Syntax.lbname);
                                         FStar_Syntax_Syntax.lbunivs =
                                           (uu___114_4176.FStar_Syntax_Syntax.lbunivs);
                                         FStar_Syntax_Syntax.lbtyp =
                                           (uu___114_4176.FStar_Syntax_Syntax.lbtyp);
                                         FStar_Syntax_Syntax.lbeff =
                                           (uu___114_4176.FStar_Syntax_Syntax.lbeff);
                                         FStar_Syntax_Syntax.lbdef = u_e1
                                       })]), _0_568)))
                             in
                          (nm_rec, _0_570, _0_569))
                 | (M t1,s_e1,u_e1) ->
                     let u_binding =
                       let uu___115_4181 = binding  in
                       {
                         FStar_Syntax_Syntax.lbname =
                           (uu___115_4181.FStar_Syntax_Syntax.lbname);
                         FStar_Syntax_Syntax.lbunivs =
                           (uu___115_4181.FStar_Syntax_Syntax.lbunivs);
                         FStar_Syntax_Syntax.lbtyp = t1;
                         FStar_Syntax_Syntax.lbeff =
                           FStar_Syntax_Const.effect_PURE_lid;
                         FStar_Syntax_Syntax.lbdef =
                           (uu___115_4181.FStar_Syntax_Syntax.lbdef)
                       }  in
                     let env =
                       let uu___116_4183 = env  in
                       let _0_571 =
                         FStar_TypeChecker_Env.push_bv env.env
                           (let uu___117_4184 = x  in
                            {
                              FStar_Syntax_Syntax.ppname =
                                (uu___117_4184.FStar_Syntax_Syntax.ppname);
                              FStar_Syntax_Syntax.index =
                                (uu___117_4184.FStar_Syntax_Syntax.index);
                              FStar_Syntax_Syntax.sort = t1
                            })
                          in
                       {
                         env = _0_571;
                         subst = (uu___116_4183.subst);
                         tc_const = (uu___116_4183.tc_const)
                       }  in
                     let uu____4185 = ensure_m env e2  in
                     (match uu____4185 with
                      | (t2,s_e2,u_e2) ->
                          let p_type = mk_star_to_type mk env t2  in
                          let p =
                            FStar_Syntax_Syntax.gen_bv "p''" None p_type  in
                          let s_e2 =
                            mk
                              (FStar_Syntax_Syntax.Tm_app
                                 (let _0_575 =
                                    let _0_574 =
                                      let _0_573 =
                                        FStar_Syntax_Syntax.bv_to_name p  in
                                      let _0_572 =
                                        FStar_Syntax_Syntax.as_implicit false
                                         in
                                      (_0_573, _0_572)  in
                                    [_0_574]  in
                                  (s_e2, _0_575)))
                             in
                          let s_e2 =
                            let _0_576 =
                              Some
                                (FStar_Util.Inl
                                   (FStar_Syntax_Util.lcomp_of_comp
                                      (FStar_Syntax_Syntax.mk_Total
                                         FStar_Syntax_Util.ktype0)))
                               in
                            FStar_Syntax_Util.abs x_binders s_e2 _0_576  in
                          let body =
                            mk
                              (FStar_Syntax_Syntax.Tm_app
                                 (let _0_579 =
                                    let _0_578 =
                                      let _0_577 =
                                        FStar_Syntax_Syntax.as_implicit false
                                         in
                                      (s_e2, _0_577)  in
                                    [_0_578]  in
                                  (s_e1, _0_579)))
                             in
                          let _0_585 =
                            let _0_582 =
                              let _0_580 = FStar_Syntax_Syntax.mk_binder p
                                 in
                              [_0_580]  in
                            let _0_581 =
                              Some
                                (FStar_Util.Inl
                                   (FStar_Syntax_Util.lcomp_of_comp
                                      (FStar_Syntax_Syntax.mk_Total
                                         FStar_Syntax_Util.ktype0)))
                               in
                            FStar_Syntax_Util.abs _0_582 body _0_581  in
                          let _0_584 =
                            mk
                              (FStar_Syntax_Syntax.Tm_let
                                 (let _0_583 =
                                    FStar_Syntax_Subst.close x_binders u_e2
                                     in
                                  ((false,
                                     [(let uu___118_4242 = u_binding  in
                                       {
                                         FStar_Syntax_Syntax.lbname =
                                           (uu___118_4242.FStar_Syntax_Syntax.lbname);
                                         FStar_Syntax_Syntax.lbunivs =
                                           (uu___118_4242.FStar_Syntax_Syntax.lbunivs);
                                         FStar_Syntax_Syntax.lbtyp =
                                           (uu___118_4242.FStar_Syntax_Syntax.lbtyp);
                                         FStar_Syntax_Syntax.lbeff =
                                           (uu___118_4242.FStar_Syntax_Syntax.lbeff);
                                         FStar_Syntax_Syntax.lbdef = u_e1
                                       })]), _0_583)))
                             in
                          ((M t2), _0_585, _0_584)))

and check_n :
  env_ ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.typ * FStar_Syntax_Syntax.term *
        FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun e  ->
      let mn =
        N
          (FStar_Syntax_Syntax.mk FStar_Syntax_Syntax.Tm_unknown None
             e.FStar_Syntax_Syntax.pos)
         in
      let uu____4261 = check env e mn  in
      match uu____4261 with
      | (N t,s_e,u_e) -> (t, s_e, u_e)
      | uu____4271 -> failwith "[check_n]: impossible"

and check_m :
  env_ ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.typ * FStar_Syntax_Syntax.term *
        FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun e  ->
      let mn =
        M
          (FStar_Syntax_Syntax.mk FStar_Syntax_Syntax.Tm_unknown None
             e.FStar_Syntax_Syntax.pos)
         in
      let uu____4296 = check env e mn  in
      match uu____4296 with
      | (M t,s_e,u_e) -> (t, s_e, u_e)
      | uu____4306 -> failwith "[check_m]: impossible"

and comp_of_nm : nm_ -> FStar_Syntax_Syntax.comp =
  fun nm  ->
    match nm with | N t -> FStar_Syntax_Syntax.mk_Total t | M t -> mk_M t

and mk_M : FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.comp =
  fun t  ->
    FStar_Syntax_Syntax.mk_Comp
      {
        FStar_Syntax_Syntax.comp_univs = [FStar_Syntax_Syntax.U_unknown];
        FStar_Syntax_Syntax.effect_name = FStar_Syntax_Const.monadic_lid;
        FStar_Syntax_Syntax.result_typ = t;
        FStar_Syntax_Syntax.effect_args = [];
        FStar_Syntax_Syntax.flags =
          [FStar_Syntax_Syntax.CPS; FStar_Syntax_Syntax.TOTAL]
      }

and type_of_comp :
  (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax ->
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax
  = fun t  -> FStar_Syntax_Util.comp_result t

and trans_F_ :
  env_ ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun env  ->
    fun c  ->
      fun wp  ->
        (let uu____4328 = Prims.op_Negation (is_C c)  in
         if uu____4328 then failwith "not a C" else ());
        (let mk x = FStar_Syntax_Syntax.mk x None c.FStar_Syntax_Syntax.pos
            in
         let uu____4340 =
           (FStar_Syntax_Subst.compress c).FStar_Syntax_Syntax.n  in
         match uu____4340 with
         | FStar_Syntax_Syntax.Tm_app (head,args) ->
             let uu____4357 = FStar_Syntax_Util.head_and_args wp  in
             (match uu____4357 with
              | (wp_head,wp_args) ->
                  ((let uu____4384 =
                      (Prims.op_Negation
                         ((FStar_List.length wp_args) =
                            (FStar_List.length args)))
                        ||
                        (Prims.op_Negation
                           (let _0_586 =
                              FStar_Syntax_Util.mk_tuple_data_lid
                                (FStar_List.length wp_args)
                                FStar_Range.dummyRange
                               in
                            FStar_Syntax_Util.is_constructor wp_head _0_586))
                       in
                    if uu____4384 then failwith "mismatch" else ());
                   mk
                     (FStar_Syntax_Syntax.Tm_app
                        (let _0_590 =
                           FStar_List.map2
                             (fun uu____4416  ->
                                fun uu____4417  ->
                                  match (uu____4416, uu____4417) with
                                  | ((arg,q),(wp_arg,q')) ->
                                      let print_implicit q =
                                        let uu____4440 =
                                          FStar_Syntax_Syntax.is_implicit q
                                           in
                                        if uu____4440
                                        then "implicit"
                                        else "explicit"  in
                                      (if q <> q'
                                       then
                                         (let _0_588 = print_implicit q  in
                                          let _0_587 = print_implicit q'  in
                                          FStar_Util.print2_warning
                                            "Incoherent implicit qualifiers %b %b"
                                            _0_588 _0_587)
                                       else ();
                                       (let _0_589 = trans_F_ env arg wp_arg
                                           in
                                        (_0_589, q)))) args wp_args
                            in
                         (head, _0_590)))))
         | FStar_Syntax_Syntax.Tm_arrow (binders,comp) ->
             let binders = FStar_Syntax_Util.name_binders binders  in
             let uu____4460 = FStar_Syntax_Subst.open_comp binders comp  in
             (match uu____4460 with
              | (binders_orig,comp) ->
                  let uu____4465 =
                    FStar_List.split
                      (FStar_List.map
                         (fun uu____4483  ->
                            match uu____4483 with
                            | (bv,q) ->
                                let h = bv.FStar_Syntax_Syntax.sort  in
                                let uu____4496 = is_C h  in
                                if uu____4496
                                then
                                  let w' =
                                    let _0_591 = star_type' env h  in
                                    FStar_Syntax_Syntax.gen_bv
                                      (Prims.strcat
                                         (bv.FStar_Syntax_Syntax.ppname).FStar_Ident.idText
                                         "-w'") None _0_591
                                     in
                                  let _0_596 =
                                    let _0_595 =
                                      let _0_594 =
                                        let _0_593 =
                                          FStar_Syntax_Syntax.null_bv
                                            (let _0_592 =
                                               FStar_Syntax_Syntax.bv_to_name
                                                 w'
                                                in
                                             trans_F_ env h _0_592)
                                           in
                                        (_0_593, q)  in
                                      [_0_594]  in
                                    (w', q) :: _0_595  in
                                  (w', _0_596)
                                else
                                  (let x =
                                     let _0_597 = star_type' env h  in
                                     FStar_Syntax_Syntax.gen_bv
                                       (Prims.strcat
                                          (bv.FStar_Syntax_Syntax.ppname).FStar_Ident.idText
                                          "-x") None _0_597
                                      in
                                   (x, [(x, q)]))) binders_orig)
                     in
                  (match uu____4465 with
                   | (bvs,binders) ->
                       let binders = FStar_List.flatten binders  in
                       let comp =
                         let _0_599 =
                           let _0_598 =
                             FStar_Syntax_Syntax.binders_of_list bvs  in
                           FStar_Syntax_Util.rename_binders binders_orig
                             _0_598
                            in
                         FStar_Syntax_Subst.subst_comp _0_599 comp  in
                       let app =
                         mk
                           (FStar_Syntax_Syntax.Tm_app
                              (let _0_602 =
                                 FStar_List.map
                                   (fun bv  ->
                                      let _0_601 =
                                        FStar_Syntax_Syntax.bv_to_name bv  in
                                      let _0_600 =
                                        FStar_Syntax_Syntax.as_implicit false
                                         in
                                      (_0_601, _0_600)) bvs
                                  in
                               (wp, _0_602)))
                          in
                       let comp =
                         let _0_604 = type_of_comp comp  in
                         let _0_603 = is_monadic_comp comp  in
                         trans_G env _0_604 _0_603 app  in
                       FStar_Syntax_Util.arrow binders comp))
         | FStar_Syntax_Syntax.Tm_ascribed (e,uu____4551,uu____4552) ->
             trans_F_ env e wp
         | uu____4571 -> failwith "impossible trans_F_")

and trans_G :
  env_ ->
    FStar_Syntax_Syntax.typ ->
      Prims.bool -> FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.comp
  =
  fun env  ->
    fun h  ->
      fun is_monadic  ->
        fun wp  ->
          let mk x = FStar_Syntax_Syntax.mk x None h.FStar_Syntax_Syntax.pos
             in
          if is_monadic
          then
            FStar_Syntax_Syntax.mk_Comp
              (let _0_608 = star_type' env h  in
               let _0_607 =
                 let _0_606 =
                   let _0_605 = FStar_Syntax_Syntax.as_implicit false  in
                   (wp, _0_605)  in
                 [_0_606]  in
               {
                 FStar_Syntax_Syntax.comp_univs =
                   [FStar_Syntax_Syntax.U_unknown];
                 FStar_Syntax_Syntax.effect_name =
                   FStar_Syntax_Const.effect_PURE_lid;
                 FStar_Syntax_Syntax.result_typ = _0_608;
                 FStar_Syntax_Syntax.effect_args = _0_607;
                 FStar_Syntax_Syntax.flags = []
               })
          else FStar_Syntax_Syntax.mk_Total (trans_F_ env h wp)

let n :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  FStar_TypeChecker_Normalize.normalize
    [FStar_TypeChecker_Normalize.Beta;
    FStar_TypeChecker_Normalize.UnfoldUntil
      FStar_Syntax_Syntax.Delta_constant;
    FStar_TypeChecker_Normalize.NoDeltaSteps;
    FStar_TypeChecker_Normalize.Eager_unfolding;
    FStar_TypeChecker_Normalize.EraseUniverses]
  
let star_type : env -> FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term =
  fun env  -> fun t  -> let _0_609 = n env.env t  in star_type' env _0_609 
let star_expr :
  env ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.typ * FStar_Syntax_Syntax.term *
        FStar_Syntax_Syntax.term)
  = fun env  -> fun t  -> let _0_610 = n env.env t  in check_n env _0_610 
let trans_F :
  env_ ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun env  ->
    fun c  ->
      fun wp  ->
        let _0_612 = n env.env c  in
        let _0_611 = n env.env wp  in trans_F_ env _0_612 _0_611
  