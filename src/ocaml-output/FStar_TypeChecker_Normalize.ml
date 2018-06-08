open Prims
type step =
  | Beta 
  | Iota 
  | Zeta 
  | Exclude of step 
  | Weak 
  | HNF 
  | Primops 
  | Eager_unfolding 
  | Inlining 
  | DoNotUnfoldPureLets 
  | UnfoldUntil of FStar_Syntax_Syntax.delta_depth 
  | UnfoldOnly of FStar_Ident.lid Prims.list 
  | UnfoldFully of FStar_Ident.lid Prims.list 
  | UnfoldAttr of FStar_Syntax_Syntax.attribute 
  | UnfoldTac 
  | PureSubtermsWithinComputations 
  | Simplify 
  | EraseUniverses 
  | AllowUnboundUniverses 
  | Reify 
  | CompressUvars 
  | NoFullNorm 
  | CheckNoUvars 
  | Unmeta 
  | Unascribe 
let (uu___is_Beta : step -> Prims.bool) =
  fun projectee  -> match projectee with | Beta  -> true | uu____35 -> false 
let (uu___is_Iota : step -> Prims.bool) =
  fun projectee  -> match projectee with | Iota  -> true | uu____41 -> false 
let (uu___is_Zeta : step -> Prims.bool) =
  fun projectee  -> match projectee with | Zeta  -> true | uu____47 -> false 
let (uu___is_Exclude : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | Exclude _0 -> true | uu____54 -> false
  
let (__proj__Exclude__item___0 : step -> step) =
  fun projectee  -> match projectee with | Exclude _0 -> _0 
let (uu___is_Weak : step -> Prims.bool) =
  fun projectee  -> match projectee with | Weak  -> true | uu____67 -> false 
let (uu___is_HNF : step -> Prims.bool) =
  fun projectee  -> match projectee with | HNF  -> true | uu____73 -> false 
let (uu___is_Primops : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | Primops  -> true | uu____79 -> false
  
let (uu___is_Eager_unfolding : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | Eager_unfolding  -> true | uu____85 -> false
  
let (uu___is_Inlining : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | Inlining  -> true | uu____91 -> false
  
let (uu___is_DoNotUnfoldPureLets : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | DoNotUnfoldPureLets  -> true | uu____97 -> false
  
let (uu___is_UnfoldUntil : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | UnfoldUntil _0 -> true | uu____104 -> false
  
let (__proj__UnfoldUntil__item___0 : step -> FStar_Syntax_Syntax.delta_depth)
  = fun projectee  -> match projectee with | UnfoldUntil _0 -> _0 
let (uu___is_UnfoldOnly : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | UnfoldOnly _0 -> true | uu____120 -> false
  
let (__proj__UnfoldOnly__item___0 : step -> FStar_Ident.lid Prims.list) =
  fun projectee  -> match projectee with | UnfoldOnly _0 -> _0 
let (uu___is_UnfoldFully : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | UnfoldFully _0 -> true | uu____142 -> false
  
let (__proj__UnfoldFully__item___0 : step -> FStar_Ident.lid Prims.list) =
  fun projectee  -> match projectee with | UnfoldFully _0 -> _0 
let (uu___is_UnfoldAttr : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | UnfoldAttr _0 -> true | uu____162 -> false
  
let (__proj__UnfoldAttr__item___0 : step -> FStar_Syntax_Syntax.attribute) =
  fun projectee  -> match projectee with | UnfoldAttr _0 -> _0 
let (uu___is_UnfoldTac : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | UnfoldTac  -> true | uu____175 -> false
  
let (uu___is_PureSubtermsWithinComputations : step -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | PureSubtermsWithinComputations  -> true
    | uu____181 -> false
  
let (uu___is_Simplify : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | Simplify  -> true | uu____187 -> false
  
let (uu___is_EraseUniverses : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | EraseUniverses  -> true | uu____193 -> false
  
let (uu___is_AllowUnboundUniverses : step -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | AllowUnboundUniverses  -> true
    | uu____199 -> false
  
let (uu___is_Reify : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | Reify  -> true | uu____205 -> false
  
let (uu___is_CompressUvars : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | CompressUvars  -> true | uu____211 -> false
  
let (uu___is_NoFullNorm : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | NoFullNorm  -> true | uu____217 -> false
  
let (uu___is_CheckNoUvars : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | CheckNoUvars  -> true | uu____223 -> false
  
let (uu___is_Unmeta : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | Unmeta  -> true | uu____229 -> false
  
let (uu___is_Unascribe : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | Unascribe  -> true | uu____235 -> false
  
type steps = step Prims.list
let cases :
  'Auu____248 'Auu____249 .
    ('Auu____248 -> 'Auu____249) ->
      'Auu____249 ->
        'Auu____248 FStar_Pervasives_Native.option -> 'Auu____249
  =
  fun f  ->
    fun d  ->
      fun uu___238_269  ->
        match uu___238_269 with
        | FStar_Pervasives_Native.Some x -> f x
        | FStar_Pervasives_Native.None  -> d
  
type fsteps =
  {
  beta: Prims.bool ;
  iota: Prims.bool ;
  zeta: Prims.bool ;
  weak: Prims.bool ;
  hnf: Prims.bool ;
  primops: Prims.bool ;
  do_not_unfold_pure_lets: Prims.bool ;
  unfold_until:
    FStar_Syntax_Syntax.delta_depth FStar_Pervasives_Native.option ;
  unfold_only: FStar_Ident.lid Prims.list FStar_Pervasives_Native.option ;
  unfold_fully: FStar_Ident.lid Prims.list FStar_Pervasives_Native.option ;
  unfold_attr:
    FStar_Syntax_Syntax.attribute Prims.list FStar_Pervasives_Native.option ;
  unfold_tac: Prims.bool ;
  pure_subterms_within_computations: Prims.bool ;
  simplify: Prims.bool ;
  erase_universes: Prims.bool ;
  allow_unbound_universes: Prims.bool ;
  reify_: Prims.bool ;
  compress_uvars: Prims.bool ;
  no_full_norm: Prims.bool ;
  check_no_uvars: Prims.bool ;
  unmeta: Prims.bool ;
  unascribe: Prims.bool ;
  in_full_norm_request: Prims.bool ;
  weakly_reduce_scrutinee: Prims.bool }
let (__proj__Mkfsteps__item__beta : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__beta
  
let (__proj__Mkfsteps__item__iota : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__iota
  
let (__proj__Mkfsteps__item__zeta : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__zeta
  
let (__proj__Mkfsteps__item__weak : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__weak
  
let (__proj__Mkfsteps__item__hnf : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__hnf
  
let (__proj__Mkfsteps__item__primops : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__primops
  
let (__proj__Mkfsteps__item__do_not_unfold_pure_lets : fsteps -> Prims.bool)
  =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__do_not_unfold_pure_lets
  
let (__proj__Mkfsteps__item__unfold_until :
  fsteps -> FStar_Syntax_Syntax.delta_depth FStar_Pervasives_Native.option) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__unfold_until
  
let (__proj__Mkfsteps__item__unfold_only :
  fsteps -> FStar_Ident.lid Prims.list FStar_Pervasives_Native.option) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__unfold_only
  
let (__proj__Mkfsteps__item__unfold_fully :
  fsteps -> FStar_Ident.lid Prims.list FStar_Pervasives_Native.option) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__unfold_fully
  
let (__proj__Mkfsteps__item__unfold_attr :
  fsteps ->
    FStar_Syntax_Syntax.attribute Prims.list FStar_Pervasives_Native.option)
  =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__unfold_attr
  
let (__proj__Mkfsteps__item__unfold_tac : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__unfold_tac
  
let (__proj__Mkfsteps__item__pure_subterms_within_computations :
  fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__pure_subterms_within_computations
  
let (__proj__Mkfsteps__item__simplify : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__simplify
  
let (__proj__Mkfsteps__item__erase_universes : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__erase_universes
  
let (__proj__Mkfsteps__item__allow_unbound_universes : fsteps -> Prims.bool)
  =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__allow_unbound_universes
  
let (__proj__Mkfsteps__item__reify_ : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__reify_
  
let (__proj__Mkfsteps__item__compress_uvars : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__compress_uvars
  
let (__proj__Mkfsteps__item__no_full_norm : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__no_full_norm
  
let (__proj__Mkfsteps__item__check_no_uvars : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__check_no_uvars
  
let (__proj__Mkfsteps__item__unmeta : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__unmeta
  
let (__proj__Mkfsteps__item__unascribe : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__unascribe
  
let (__proj__Mkfsteps__item__in_full_norm_request : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__in_full_norm_request
  
let (__proj__Mkfsteps__item__weakly_reduce_scrutinee : fsteps -> Prims.bool)
  =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__weakly_reduce_scrutinee
  
let (default_steps : fsteps) =
  {
    beta = true;
    iota = true;
    zeta = true;
    weak = false;
    hnf = false;
    primops = false;
    do_not_unfold_pure_lets = false;
    unfold_until = FStar_Pervasives_Native.None;
    unfold_only = FStar_Pervasives_Native.None;
    unfold_fully = FStar_Pervasives_Native.None;
    unfold_attr = FStar_Pervasives_Native.None;
    unfold_tac = false;
    pure_subterms_within_computations = false;
    simplify = false;
    erase_universes = false;
    allow_unbound_universes = false;
    reify_ = false;
    compress_uvars = false;
    no_full_norm = false;
    check_no_uvars = false;
    unmeta = false;
    unascribe = false;
    in_full_norm_request = false;
    weakly_reduce_scrutinee = true
  } 
let (fstep_add_one : step -> fsteps -> fsteps) =
  fun s  ->
    fun fs  ->
      let add_opt x uu___239_1503 =
        match uu___239_1503 with
        | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.Some [x]
        | FStar_Pervasives_Native.Some xs ->
            FStar_Pervasives_Native.Some (x :: xs)
         in
      match s with
      | Beta  ->
          let uu___258_1523 = fs  in
          {
            beta = true;
            iota = (uu___258_1523.iota);
            zeta = (uu___258_1523.zeta);
            weak = (uu___258_1523.weak);
            hnf = (uu___258_1523.hnf);
            primops = (uu___258_1523.primops);
            do_not_unfold_pure_lets = (uu___258_1523.do_not_unfold_pure_lets);
            unfold_until = (uu___258_1523.unfold_until);
            unfold_only = (uu___258_1523.unfold_only);
            unfold_fully = (uu___258_1523.unfold_fully);
            unfold_attr = (uu___258_1523.unfold_attr);
            unfold_tac = (uu___258_1523.unfold_tac);
            pure_subterms_within_computations =
              (uu___258_1523.pure_subterms_within_computations);
            simplify = (uu___258_1523.simplify);
            erase_universes = (uu___258_1523.erase_universes);
            allow_unbound_universes = (uu___258_1523.allow_unbound_universes);
            reify_ = (uu___258_1523.reify_);
            compress_uvars = (uu___258_1523.compress_uvars);
            no_full_norm = (uu___258_1523.no_full_norm);
            check_no_uvars = (uu___258_1523.check_no_uvars);
            unmeta = (uu___258_1523.unmeta);
            unascribe = (uu___258_1523.unascribe);
            in_full_norm_request = (uu___258_1523.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___258_1523.weakly_reduce_scrutinee)
          }
      | Iota  ->
          let uu___259_1524 = fs  in
          {
            beta = (uu___259_1524.beta);
            iota = true;
            zeta = (uu___259_1524.zeta);
            weak = (uu___259_1524.weak);
            hnf = (uu___259_1524.hnf);
            primops = (uu___259_1524.primops);
            do_not_unfold_pure_lets = (uu___259_1524.do_not_unfold_pure_lets);
            unfold_until = (uu___259_1524.unfold_until);
            unfold_only = (uu___259_1524.unfold_only);
            unfold_fully = (uu___259_1524.unfold_fully);
            unfold_attr = (uu___259_1524.unfold_attr);
            unfold_tac = (uu___259_1524.unfold_tac);
            pure_subterms_within_computations =
              (uu___259_1524.pure_subterms_within_computations);
            simplify = (uu___259_1524.simplify);
            erase_universes = (uu___259_1524.erase_universes);
            allow_unbound_universes = (uu___259_1524.allow_unbound_universes);
            reify_ = (uu___259_1524.reify_);
            compress_uvars = (uu___259_1524.compress_uvars);
            no_full_norm = (uu___259_1524.no_full_norm);
            check_no_uvars = (uu___259_1524.check_no_uvars);
            unmeta = (uu___259_1524.unmeta);
            unascribe = (uu___259_1524.unascribe);
            in_full_norm_request = (uu___259_1524.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___259_1524.weakly_reduce_scrutinee)
          }
      | Zeta  ->
          let uu___260_1525 = fs  in
          {
            beta = (uu___260_1525.beta);
            iota = (uu___260_1525.iota);
            zeta = true;
            weak = (uu___260_1525.weak);
            hnf = (uu___260_1525.hnf);
            primops = (uu___260_1525.primops);
            do_not_unfold_pure_lets = (uu___260_1525.do_not_unfold_pure_lets);
            unfold_until = (uu___260_1525.unfold_until);
            unfold_only = (uu___260_1525.unfold_only);
            unfold_fully = (uu___260_1525.unfold_fully);
            unfold_attr = (uu___260_1525.unfold_attr);
            unfold_tac = (uu___260_1525.unfold_tac);
            pure_subterms_within_computations =
              (uu___260_1525.pure_subterms_within_computations);
            simplify = (uu___260_1525.simplify);
            erase_universes = (uu___260_1525.erase_universes);
            allow_unbound_universes = (uu___260_1525.allow_unbound_universes);
            reify_ = (uu___260_1525.reify_);
            compress_uvars = (uu___260_1525.compress_uvars);
            no_full_norm = (uu___260_1525.no_full_norm);
            check_no_uvars = (uu___260_1525.check_no_uvars);
            unmeta = (uu___260_1525.unmeta);
            unascribe = (uu___260_1525.unascribe);
            in_full_norm_request = (uu___260_1525.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___260_1525.weakly_reduce_scrutinee)
          }
      | Exclude (Beta ) ->
          let uu___261_1526 = fs  in
          {
            beta = false;
            iota = (uu___261_1526.iota);
            zeta = (uu___261_1526.zeta);
            weak = (uu___261_1526.weak);
            hnf = (uu___261_1526.hnf);
            primops = (uu___261_1526.primops);
            do_not_unfold_pure_lets = (uu___261_1526.do_not_unfold_pure_lets);
            unfold_until = (uu___261_1526.unfold_until);
            unfold_only = (uu___261_1526.unfold_only);
            unfold_fully = (uu___261_1526.unfold_fully);
            unfold_attr = (uu___261_1526.unfold_attr);
            unfold_tac = (uu___261_1526.unfold_tac);
            pure_subterms_within_computations =
              (uu___261_1526.pure_subterms_within_computations);
            simplify = (uu___261_1526.simplify);
            erase_universes = (uu___261_1526.erase_universes);
            allow_unbound_universes = (uu___261_1526.allow_unbound_universes);
            reify_ = (uu___261_1526.reify_);
            compress_uvars = (uu___261_1526.compress_uvars);
            no_full_norm = (uu___261_1526.no_full_norm);
            check_no_uvars = (uu___261_1526.check_no_uvars);
            unmeta = (uu___261_1526.unmeta);
            unascribe = (uu___261_1526.unascribe);
            in_full_norm_request = (uu___261_1526.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___261_1526.weakly_reduce_scrutinee)
          }
      | Exclude (Iota ) ->
          let uu___262_1527 = fs  in
          {
            beta = (uu___262_1527.beta);
            iota = false;
            zeta = (uu___262_1527.zeta);
            weak = (uu___262_1527.weak);
            hnf = (uu___262_1527.hnf);
            primops = (uu___262_1527.primops);
            do_not_unfold_pure_lets = (uu___262_1527.do_not_unfold_pure_lets);
            unfold_until = (uu___262_1527.unfold_until);
            unfold_only = (uu___262_1527.unfold_only);
            unfold_fully = (uu___262_1527.unfold_fully);
            unfold_attr = (uu___262_1527.unfold_attr);
            unfold_tac = (uu___262_1527.unfold_tac);
            pure_subterms_within_computations =
              (uu___262_1527.pure_subterms_within_computations);
            simplify = (uu___262_1527.simplify);
            erase_universes = (uu___262_1527.erase_universes);
            allow_unbound_universes = (uu___262_1527.allow_unbound_universes);
            reify_ = (uu___262_1527.reify_);
            compress_uvars = (uu___262_1527.compress_uvars);
            no_full_norm = (uu___262_1527.no_full_norm);
            check_no_uvars = (uu___262_1527.check_no_uvars);
            unmeta = (uu___262_1527.unmeta);
            unascribe = (uu___262_1527.unascribe);
            in_full_norm_request = (uu___262_1527.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___262_1527.weakly_reduce_scrutinee)
          }
      | Exclude (Zeta ) ->
          let uu___263_1528 = fs  in
          {
            beta = (uu___263_1528.beta);
            iota = (uu___263_1528.iota);
            zeta = false;
            weak = (uu___263_1528.weak);
            hnf = (uu___263_1528.hnf);
            primops = (uu___263_1528.primops);
            do_not_unfold_pure_lets = (uu___263_1528.do_not_unfold_pure_lets);
            unfold_until = (uu___263_1528.unfold_until);
            unfold_only = (uu___263_1528.unfold_only);
            unfold_fully = (uu___263_1528.unfold_fully);
            unfold_attr = (uu___263_1528.unfold_attr);
            unfold_tac = (uu___263_1528.unfold_tac);
            pure_subterms_within_computations =
              (uu___263_1528.pure_subterms_within_computations);
            simplify = (uu___263_1528.simplify);
            erase_universes = (uu___263_1528.erase_universes);
            allow_unbound_universes = (uu___263_1528.allow_unbound_universes);
            reify_ = (uu___263_1528.reify_);
            compress_uvars = (uu___263_1528.compress_uvars);
            no_full_norm = (uu___263_1528.no_full_norm);
            check_no_uvars = (uu___263_1528.check_no_uvars);
            unmeta = (uu___263_1528.unmeta);
            unascribe = (uu___263_1528.unascribe);
            in_full_norm_request = (uu___263_1528.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___263_1528.weakly_reduce_scrutinee)
          }
      | Exclude uu____1529 -> failwith "Bad exclude"
      | Weak  ->
          let uu___264_1530 = fs  in
          {
            beta = (uu___264_1530.beta);
            iota = (uu___264_1530.iota);
            zeta = (uu___264_1530.zeta);
            weak = true;
            hnf = (uu___264_1530.hnf);
            primops = (uu___264_1530.primops);
            do_not_unfold_pure_lets = (uu___264_1530.do_not_unfold_pure_lets);
            unfold_until = (uu___264_1530.unfold_until);
            unfold_only = (uu___264_1530.unfold_only);
            unfold_fully = (uu___264_1530.unfold_fully);
            unfold_attr = (uu___264_1530.unfold_attr);
            unfold_tac = (uu___264_1530.unfold_tac);
            pure_subterms_within_computations =
              (uu___264_1530.pure_subterms_within_computations);
            simplify = (uu___264_1530.simplify);
            erase_universes = (uu___264_1530.erase_universes);
            allow_unbound_universes = (uu___264_1530.allow_unbound_universes);
            reify_ = (uu___264_1530.reify_);
            compress_uvars = (uu___264_1530.compress_uvars);
            no_full_norm = (uu___264_1530.no_full_norm);
            check_no_uvars = (uu___264_1530.check_no_uvars);
            unmeta = (uu___264_1530.unmeta);
            unascribe = (uu___264_1530.unascribe);
            in_full_norm_request = (uu___264_1530.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___264_1530.weakly_reduce_scrutinee)
          }
      | HNF  ->
          let uu___265_1531 = fs  in
          {
            beta = (uu___265_1531.beta);
            iota = (uu___265_1531.iota);
            zeta = (uu___265_1531.zeta);
            weak = (uu___265_1531.weak);
            hnf = true;
            primops = (uu___265_1531.primops);
            do_not_unfold_pure_lets = (uu___265_1531.do_not_unfold_pure_lets);
            unfold_until = (uu___265_1531.unfold_until);
            unfold_only = (uu___265_1531.unfold_only);
            unfold_fully = (uu___265_1531.unfold_fully);
            unfold_attr = (uu___265_1531.unfold_attr);
            unfold_tac = (uu___265_1531.unfold_tac);
            pure_subterms_within_computations =
              (uu___265_1531.pure_subterms_within_computations);
            simplify = (uu___265_1531.simplify);
            erase_universes = (uu___265_1531.erase_universes);
            allow_unbound_universes = (uu___265_1531.allow_unbound_universes);
            reify_ = (uu___265_1531.reify_);
            compress_uvars = (uu___265_1531.compress_uvars);
            no_full_norm = (uu___265_1531.no_full_norm);
            check_no_uvars = (uu___265_1531.check_no_uvars);
            unmeta = (uu___265_1531.unmeta);
            unascribe = (uu___265_1531.unascribe);
            in_full_norm_request = (uu___265_1531.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___265_1531.weakly_reduce_scrutinee)
          }
      | Primops  ->
          let uu___266_1532 = fs  in
          {
            beta = (uu___266_1532.beta);
            iota = (uu___266_1532.iota);
            zeta = (uu___266_1532.zeta);
            weak = (uu___266_1532.weak);
            hnf = (uu___266_1532.hnf);
            primops = true;
            do_not_unfold_pure_lets = (uu___266_1532.do_not_unfold_pure_lets);
            unfold_until = (uu___266_1532.unfold_until);
            unfold_only = (uu___266_1532.unfold_only);
            unfold_fully = (uu___266_1532.unfold_fully);
            unfold_attr = (uu___266_1532.unfold_attr);
            unfold_tac = (uu___266_1532.unfold_tac);
            pure_subterms_within_computations =
              (uu___266_1532.pure_subterms_within_computations);
            simplify = (uu___266_1532.simplify);
            erase_universes = (uu___266_1532.erase_universes);
            allow_unbound_universes = (uu___266_1532.allow_unbound_universes);
            reify_ = (uu___266_1532.reify_);
            compress_uvars = (uu___266_1532.compress_uvars);
            no_full_norm = (uu___266_1532.no_full_norm);
            check_no_uvars = (uu___266_1532.check_no_uvars);
            unmeta = (uu___266_1532.unmeta);
            unascribe = (uu___266_1532.unascribe);
            in_full_norm_request = (uu___266_1532.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___266_1532.weakly_reduce_scrutinee)
          }
      | Eager_unfolding  -> fs
      | Inlining  -> fs
      | DoNotUnfoldPureLets  ->
          let uu___267_1533 = fs  in
          {
            beta = (uu___267_1533.beta);
            iota = (uu___267_1533.iota);
            zeta = (uu___267_1533.zeta);
            weak = (uu___267_1533.weak);
            hnf = (uu___267_1533.hnf);
            primops = (uu___267_1533.primops);
            do_not_unfold_pure_lets = true;
            unfold_until = (uu___267_1533.unfold_until);
            unfold_only = (uu___267_1533.unfold_only);
            unfold_fully = (uu___267_1533.unfold_fully);
            unfold_attr = (uu___267_1533.unfold_attr);
            unfold_tac = (uu___267_1533.unfold_tac);
            pure_subterms_within_computations =
              (uu___267_1533.pure_subterms_within_computations);
            simplify = (uu___267_1533.simplify);
            erase_universes = (uu___267_1533.erase_universes);
            allow_unbound_universes = (uu___267_1533.allow_unbound_universes);
            reify_ = (uu___267_1533.reify_);
            compress_uvars = (uu___267_1533.compress_uvars);
            no_full_norm = (uu___267_1533.no_full_norm);
            check_no_uvars = (uu___267_1533.check_no_uvars);
            unmeta = (uu___267_1533.unmeta);
            unascribe = (uu___267_1533.unascribe);
            in_full_norm_request = (uu___267_1533.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___267_1533.weakly_reduce_scrutinee)
          }
      | UnfoldUntil d ->
          let uu___268_1535 = fs  in
          {
            beta = (uu___268_1535.beta);
            iota = (uu___268_1535.iota);
            zeta = (uu___268_1535.zeta);
            weak = (uu___268_1535.weak);
            hnf = (uu___268_1535.hnf);
            primops = (uu___268_1535.primops);
            do_not_unfold_pure_lets = (uu___268_1535.do_not_unfold_pure_lets);
            unfold_until = (FStar_Pervasives_Native.Some d);
            unfold_only = (uu___268_1535.unfold_only);
            unfold_fully = (uu___268_1535.unfold_fully);
            unfold_attr = (uu___268_1535.unfold_attr);
            unfold_tac = (uu___268_1535.unfold_tac);
            pure_subterms_within_computations =
              (uu___268_1535.pure_subterms_within_computations);
            simplify = (uu___268_1535.simplify);
            erase_universes = (uu___268_1535.erase_universes);
            allow_unbound_universes = (uu___268_1535.allow_unbound_universes);
            reify_ = (uu___268_1535.reify_);
            compress_uvars = (uu___268_1535.compress_uvars);
            no_full_norm = (uu___268_1535.no_full_norm);
            check_no_uvars = (uu___268_1535.check_no_uvars);
            unmeta = (uu___268_1535.unmeta);
            unascribe = (uu___268_1535.unascribe);
            in_full_norm_request = (uu___268_1535.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___268_1535.weakly_reduce_scrutinee)
          }
      | UnfoldOnly lids ->
          let uu___269_1539 = fs  in
          {
            beta = (uu___269_1539.beta);
            iota = (uu___269_1539.iota);
            zeta = (uu___269_1539.zeta);
            weak = (uu___269_1539.weak);
            hnf = (uu___269_1539.hnf);
            primops = (uu___269_1539.primops);
            do_not_unfold_pure_lets = (uu___269_1539.do_not_unfold_pure_lets);
            unfold_until = (uu___269_1539.unfold_until);
            unfold_only = (FStar_Pervasives_Native.Some lids);
            unfold_fully = (uu___269_1539.unfold_fully);
            unfold_attr = (uu___269_1539.unfold_attr);
            unfold_tac = (uu___269_1539.unfold_tac);
            pure_subterms_within_computations =
              (uu___269_1539.pure_subterms_within_computations);
            simplify = (uu___269_1539.simplify);
            erase_universes = (uu___269_1539.erase_universes);
            allow_unbound_universes = (uu___269_1539.allow_unbound_universes);
            reify_ = (uu___269_1539.reify_);
            compress_uvars = (uu___269_1539.compress_uvars);
            no_full_norm = (uu___269_1539.no_full_norm);
            check_no_uvars = (uu___269_1539.check_no_uvars);
            unmeta = (uu___269_1539.unmeta);
            unascribe = (uu___269_1539.unascribe);
            in_full_norm_request = (uu___269_1539.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___269_1539.weakly_reduce_scrutinee)
          }
      | UnfoldFully lids ->
          let uu___270_1545 = fs  in
          {
            beta = (uu___270_1545.beta);
            iota = (uu___270_1545.iota);
            zeta = (uu___270_1545.zeta);
            weak = (uu___270_1545.weak);
            hnf = (uu___270_1545.hnf);
            primops = (uu___270_1545.primops);
            do_not_unfold_pure_lets = (uu___270_1545.do_not_unfold_pure_lets);
            unfold_until = (uu___270_1545.unfold_until);
            unfold_only = (uu___270_1545.unfold_only);
            unfold_fully = (FStar_Pervasives_Native.Some lids);
            unfold_attr = (uu___270_1545.unfold_attr);
            unfold_tac = (uu___270_1545.unfold_tac);
            pure_subterms_within_computations =
              (uu___270_1545.pure_subterms_within_computations);
            simplify = (uu___270_1545.simplify);
            erase_universes = (uu___270_1545.erase_universes);
            allow_unbound_universes = (uu___270_1545.allow_unbound_universes);
            reify_ = (uu___270_1545.reify_);
            compress_uvars = (uu___270_1545.compress_uvars);
            no_full_norm = (uu___270_1545.no_full_norm);
            check_no_uvars = (uu___270_1545.check_no_uvars);
            unmeta = (uu___270_1545.unmeta);
            unascribe = (uu___270_1545.unascribe);
            in_full_norm_request = (uu___270_1545.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___270_1545.weakly_reduce_scrutinee)
          }
      | UnfoldAttr attr ->
          let uu___271_1549 = fs  in
          {
            beta = (uu___271_1549.beta);
            iota = (uu___271_1549.iota);
            zeta = (uu___271_1549.zeta);
            weak = (uu___271_1549.weak);
            hnf = (uu___271_1549.hnf);
            primops = (uu___271_1549.primops);
            do_not_unfold_pure_lets = (uu___271_1549.do_not_unfold_pure_lets);
            unfold_until = (uu___271_1549.unfold_until);
            unfold_only = (uu___271_1549.unfold_only);
            unfold_fully = (uu___271_1549.unfold_fully);
            unfold_attr = (add_opt attr fs.unfold_attr);
            unfold_tac = (uu___271_1549.unfold_tac);
            pure_subterms_within_computations =
              (uu___271_1549.pure_subterms_within_computations);
            simplify = (uu___271_1549.simplify);
            erase_universes = (uu___271_1549.erase_universes);
            allow_unbound_universes = (uu___271_1549.allow_unbound_universes);
            reify_ = (uu___271_1549.reify_);
            compress_uvars = (uu___271_1549.compress_uvars);
            no_full_norm = (uu___271_1549.no_full_norm);
            check_no_uvars = (uu___271_1549.check_no_uvars);
            unmeta = (uu___271_1549.unmeta);
            unascribe = (uu___271_1549.unascribe);
            in_full_norm_request = (uu___271_1549.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___271_1549.weakly_reduce_scrutinee)
          }
      | UnfoldTac  ->
          let uu___272_1550 = fs  in
          {
            beta = (uu___272_1550.beta);
            iota = (uu___272_1550.iota);
            zeta = (uu___272_1550.zeta);
            weak = (uu___272_1550.weak);
            hnf = (uu___272_1550.hnf);
            primops = (uu___272_1550.primops);
            do_not_unfold_pure_lets = (uu___272_1550.do_not_unfold_pure_lets);
            unfold_until = (uu___272_1550.unfold_until);
            unfold_only = (uu___272_1550.unfold_only);
            unfold_fully = (uu___272_1550.unfold_fully);
            unfold_attr = (uu___272_1550.unfold_attr);
            unfold_tac = true;
            pure_subterms_within_computations =
              (uu___272_1550.pure_subterms_within_computations);
            simplify = (uu___272_1550.simplify);
            erase_universes = (uu___272_1550.erase_universes);
            allow_unbound_universes = (uu___272_1550.allow_unbound_universes);
            reify_ = (uu___272_1550.reify_);
            compress_uvars = (uu___272_1550.compress_uvars);
            no_full_norm = (uu___272_1550.no_full_norm);
            check_no_uvars = (uu___272_1550.check_no_uvars);
            unmeta = (uu___272_1550.unmeta);
            unascribe = (uu___272_1550.unascribe);
            in_full_norm_request = (uu___272_1550.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___272_1550.weakly_reduce_scrutinee)
          }
      | PureSubtermsWithinComputations  ->
          let uu___273_1551 = fs  in
          {
            beta = (uu___273_1551.beta);
            iota = (uu___273_1551.iota);
            zeta = (uu___273_1551.zeta);
            weak = (uu___273_1551.weak);
            hnf = (uu___273_1551.hnf);
            primops = (uu___273_1551.primops);
            do_not_unfold_pure_lets = (uu___273_1551.do_not_unfold_pure_lets);
            unfold_until = (uu___273_1551.unfold_until);
            unfold_only = (uu___273_1551.unfold_only);
            unfold_fully = (uu___273_1551.unfold_fully);
            unfold_attr = (uu___273_1551.unfold_attr);
            unfold_tac = (uu___273_1551.unfold_tac);
            pure_subterms_within_computations = true;
            simplify = (uu___273_1551.simplify);
            erase_universes = (uu___273_1551.erase_universes);
            allow_unbound_universes = (uu___273_1551.allow_unbound_universes);
            reify_ = (uu___273_1551.reify_);
            compress_uvars = (uu___273_1551.compress_uvars);
            no_full_norm = (uu___273_1551.no_full_norm);
            check_no_uvars = (uu___273_1551.check_no_uvars);
            unmeta = (uu___273_1551.unmeta);
            unascribe = (uu___273_1551.unascribe);
            in_full_norm_request = (uu___273_1551.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___273_1551.weakly_reduce_scrutinee)
          }
      | Simplify  ->
          let uu___274_1552 = fs  in
          {
            beta = (uu___274_1552.beta);
            iota = (uu___274_1552.iota);
            zeta = (uu___274_1552.zeta);
            weak = (uu___274_1552.weak);
            hnf = (uu___274_1552.hnf);
            primops = (uu___274_1552.primops);
            do_not_unfold_pure_lets = (uu___274_1552.do_not_unfold_pure_lets);
            unfold_until = (uu___274_1552.unfold_until);
            unfold_only = (uu___274_1552.unfold_only);
            unfold_fully = (uu___274_1552.unfold_fully);
            unfold_attr = (uu___274_1552.unfold_attr);
            unfold_tac = (uu___274_1552.unfold_tac);
            pure_subterms_within_computations =
              (uu___274_1552.pure_subterms_within_computations);
            simplify = true;
            erase_universes = (uu___274_1552.erase_universes);
            allow_unbound_universes = (uu___274_1552.allow_unbound_universes);
            reify_ = (uu___274_1552.reify_);
            compress_uvars = (uu___274_1552.compress_uvars);
            no_full_norm = (uu___274_1552.no_full_norm);
            check_no_uvars = (uu___274_1552.check_no_uvars);
            unmeta = (uu___274_1552.unmeta);
            unascribe = (uu___274_1552.unascribe);
            in_full_norm_request = (uu___274_1552.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___274_1552.weakly_reduce_scrutinee)
          }
      | EraseUniverses  ->
          let uu___275_1553 = fs  in
          {
            beta = (uu___275_1553.beta);
            iota = (uu___275_1553.iota);
            zeta = (uu___275_1553.zeta);
            weak = (uu___275_1553.weak);
            hnf = (uu___275_1553.hnf);
            primops = (uu___275_1553.primops);
            do_not_unfold_pure_lets = (uu___275_1553.do_not_unfold_pure_lets);
            unfold_until = (uu___275_1553.unfold_until);
            unfold_only = (uu___275_1553.unfold_only);
            unfold_fully = (uu___275_1553.unfold_fully);
            unfold_attr = (uu___275_1553.unfold_attr);
            unfold_tac = (uu___275_1553.unfold_tac);
            pure_subterms_within_computations =
              (uu___275_1553.pure_subterms_within_computations);
            simplify = (uu___275_1553.simplify);
            erase_universes = true;
            allow_unbound_universes = (uu___275_1553.allow_unbound_universes);
            reify_ = (uu___275_1553.reify_);
            compress_uvars = (uu___275_1553.compress_uvars);
            no_full_norm = (uu___275_1553.no_full_norm);
            check_no_uvars = (uu___275_1553.check_no_uvars);
            unmeta = (uu___275_1553.unmeta);
            unascribe = (uu___275_1553.unascribe);
            in_full_norm_request = (uu___275_1553.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___275_1553.weakly_reduce_scrutinee)
          }
      | AllowUnboundUniverses  ->
          let uu___276_1554 = fs  in
          {
            beta = (uu___276_1554.beta);
            iota = (uu___276_1554.iota);
            zeta = (uu___276_1554.zeta);
            weak = (uu___276_1554.weak);
            hnf = (uu___276_1554.hnf);
            primops = (uu___276_1554.primops);
            do_not_unfold_pure_lets = (uu___276_1554.do_not_unfold_pure_lets);
            unfold_until = (uu___276_1554.unfold_until);
            unfold_only = (uu___276_1554.unfold_only);
            unfold_fully = (uu___276_1554.unfold_fully);
            unfold_attr = (uu___276_1554.unfold_attr);
            unfold_tac = (uu___276_1554.unfold_tac);
            pure_subterms_within_computations =
              (uu___276_1554.pure_subterms_within_computations);
            simplify = (uu___276_1554.simplify);
            erase_universes = (uu___276_1554.erase_universes);
            allow_unbound_universes = true;
            reify_ = (uu___276_1554.reify_);
            compress_uvars = (uu___276_1554.compress_uvars);
            no_full_norm = (uu___276_1554.no_full_norm);
            check_no_uvars = (uu___276_1554.check_no_uvars);
            unmeta = (uu___276_1554.unmeta);
            unascribe = (uu___276_1554.unascribe);
            in_full_norm_request = (uu___276_1554.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___276_1554.weakly_reduce_scrutinee)
          }
      | Reify  ->
          let uu___277_1555 = fs  in
          {
            beta = (uu___277_1555.beta);
            iota = (uu___277_1555.iota);
            zeta = (uu___277_1555.zeta);
            weak = (uu___277_1555.weak);
            hnf = (uu___277_1555.hnf);
            primops = (uu___277_1555.primops);
            do_not_unfold_pure_lets = (uu___277_1555.do_not_unfold_pure_lets);
            unfold_until = (uu___277_1555.unfold_until);
            unfold_only = (uu___277_1555.unfold_only);
            unfold_fully = (uu___277_1555.unfold_fully);
            unfold_attr = (uu___277_1555.unfold_attr);
            unfold_tac = (uu___277_1555.unfold_tac);
            pure_subterms_within_computations =
              (uu___277_1555.pure_subterms_within_computations);
            simplify = (uu___277_1555.simplify);
            erase_universes = (uu___277_1555.erase_universes);
            allow_unbound_universes = (uu___277_1555.allow_unbound_universes);
            reify_ = true;
            compress_uvars = (uu___277_1555.compress_uvars);
            no_full_norm = (uu___277_1555.no_full_norm);
            check_no_uvars = (uu___277_1555.check_no_uvars);
            unmeta = (uu___277_1555.unmeta);
            unascribe = (uu___277_1555.unascribe);
            in_full_norm_request = (uu___277_1555.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___277_1555.weakly_reduce_scrutinee)
          }
      | CompressUvars  ->
          let uu___278_1556 = fs  in
          {
            beta = (uu___278_1556.beta);
            iota = (uu___278_1556.iota);
            zeta = (uu___278_1556.zeta);
            weak = (uu___278_1556.weak);
            hnf = (uu___278_1556.hnf);
            primops = (uu___278_1556.primops);
            do_not_unfold_pure_lets = (uu___278_1556.do_not_unfold_pure_lets);
            unfold_until = (uu___278_1556.unfold_until);
            unfold_only = (uu___278_1556.unfold_only);
            unfold_fully = (uu___278_1556.unfold_fully);
            unfold_attr = (uu___278_1556.unfold_attr);
            unfold_tac = (uu___278_1556.unfold_tac);
            pure_subterms_within_computations =
              (uu___278_1556.pure_subterms_within_computations);
            simplify = (uu___278_1556.simplify);
            erase_universes = (uu___278_1556.erase_universes);
            allow_unbound_universes = (uu___278_1556.allow_unbound_universes);
            reify_ = (uu___278_1556.reify_);
            compress_uvars = true;
            no_full_norm = (uu___278_1556.no_full_norm);
            check_no_uvars = (uu___278_1556.check_no_uvars);
            unmeta = (uu___278_1556.unmeta);
            unascribe = (uu___278_1556.unascribe);
            in_full_norm_request = (uu___278_1556.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___278_1556.weakly_reduce_scrutinee)
          }
      | NoFullNorm  ->
          let uu___279_1557 = fs  in
          {
            beta = (uu___279_1557.beta);
            iota = (uu___279_1557.iota);
            zeta = (uu___279_1557.zeta);
            weak = (uu___279_1557.weak);
            hnf = (uu___279_1557.hnf);
            primops = (uu___279_1557.primops);
            do_not_unfold_pure_lets = (uu___279_1557.do_not_unfold_pure_lets);
            unfold_until = (uu___279_1557.unfold_until);
            unfold_only = (uu___279_1557.unfold_only);
            unfold_fully = (uu___279_1557.unfold_fully);
            unfold_attr = (uu___279_1557.unfold_attr);
            unfold_tac = (uu___279_1557.unfold_tac);
            pure_subterms_within_computations =
              (uu___279_1557.pure_subterms_within_computations);
            simplify = (uu___279_1557.simplify);
            erase_universes = (uu___279_1557.erase_universes);
            allow_unbound_universes = (uu___279_1557.allow_unbound_universes);
            reify_ = (uu___279_1557.reify_);
            compress_uvars = (uu___279_1557.compress_uvars);
            no_full_norm = true;
            check_no_uvars = (uu___279_1557.check_no_uvars);
            unmeta = (uu___279_1557.unmeta);
            unascribe = (uu___279_1557.unascribe);
            in_full_norm_request = (uu___279_1557.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___279_1557.weakly_reduce_scrutinee)
          }
      | CheckNoUvars  ->
          let uu___280_1558 = fs  in
          {
            beta = (uu___280_1558.beta);
            iota = (uu___280_1558.iota);
            zeta = (uu___280_1558.zeta);
            weak = (uu___280_1558.weak);
            hnf = (uu___280_1558.hnf);
            primops = (uu___280_1558.primops);
            do_not_unfold_pure_lets = (uu___280_1558.do_not_unfold_pure_lets);
            unfold_until = (uu___280_1558.unfold_until);
            unfold_only = (uu___280_1558.unfold_only);
            unfold_fully = (uu___280_1558.unfold_fully);
            unfold_attr = (uu___280_1558.unfold_attr);
            unfold_tac = (uu___280_1558.unfold_tac);
            pure_subterms_within_computations =
              (uu___280_1558.pure_subterms_within_computations);
            simplify = (uu___280_1558.simplify);
            erase_universes = (uu___280_1558.erase_universes);
            allow_unbound_universes = (uu___280_1558.allow_unbound_universes);
            reify_ = (uu___280_1558.reify_);
            compress_uvars = (uu___280_1558.compress_uvars);
            no_full_norm = (uu___280_1558.no_full_norm);
            check_no_uvars = true;
            unmeta = (uu___280_1558.unmeta);
            unascribe = (uu___280_1558.unascribe);
            in_full_norm_request = (uu___280_1558.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___280_1558.weakly_reduce_scrutinee)
          }
      | Unmeta  ->
          let uu___281_1559 = fs  in
          {
            beta = (uu___281_1559.beta);
            iota = (uu___281_1559.iota);
            zeta = (uu___281_1559.zeta);
            weak = (uu___281_1559.weak);
            hnf = (uu___281_1559.hnf);
            primops = (uu___281_1559.primops);
            do_not_unfold_pure_lets = (uu___281_1559.do_not_unfold_pure_lets);
            unfold_until = (uu___281_1559.unfold_until);
            unfold_only = (uu___281_1559.unfold_only);
            unfold_fully = (uu___281_1559.unfold_fully);
            unfold_attr = (uu___281_1559.unfold_attr);
            unfold_tac = (uu___281_1559.unfold_tac);
            pure_subterms_within_computations =
              (uu___281_1559.pure_subterms_within_computations);
            simplify = (uu___281_1559.simplify);
            erase_universes = (uu___281_1559.erase_universes);
            allow_unbound_universes = (uu___281_1559.allow_unbound_universes);
            reify_ = (uu___281_1559.reify_);
            compress_uvars = (uu___281_1559.compress_uvars);
            no_full_norm = (uu___281_1559.no_full_norm);
            check_no_uvars = (uu___281_1559.check_no_uvars);
            unmeta = true;
            unascribe = (uu___281_1559.unascribe);
            in_full_norm_request = (uu___281_1559.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___281_1559.weakly_reduce_scrutinee)
          }
      | Unascribe  ->
          let uu___282_1560 = fs  in
          {
            beta = (uu___282_1560.beta);
            iota = (uu___282_1560.iota);
            zeta = (uu___282_1560.zeta);
            weak = (uu___282_1560.weak);
            hnf = (uu___282_1560.hnf);
            primops = (uu___282_1560.primops);
            do_not_unfold_pure_lets = (uu___282_1560.do_not_unfold_pure_lets);
            unfold_until = (uu___282_1560.unfold_until);
            unfold_only = (uu___282_1560.unfold_only);
            unfold_fully = (uu___282_1560.unfold_fully);
            unfold_attr = (uu___282_1560.unfold_attr);
            unfold_tac = (uu___282_1560.unfold_tac);
            pure_subterms_within_computations =
              (uu___282_1560.pure_subterms_within_computations);
            simplify = (uu___282_1560.simplify);
            erase_universes = (uu___282_1560.erase_universes);
            allow_unbound_universes = (uu___282_1560.allow_unbound_universes);
            reify_ = (uu___282_1560.reify_);
            compress_uvars = (uu___282_1560.compress_uvars);
            no_full_norm = (uu___282_1560.no_full_norm);
            check_no_uvars = (uu___282_1560.check_no_uvars);
            unmeta = (uu___282_1560.unmeta);
            unascribe = true;
            in_full_norm_request = (uu___282_1560.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___282_1560.weakly_reduce_scrutinee)
          }
  
let rec (to_fsteps : step Prims.list -> fsteps) =
  fun s  -> FStar_List.fold_right fstep_add_one s default_steps 
type psc =
  {
  psc_range: FStar_Range.range ;
  psc_subst: unit -> FStar_Syntax_Syntax.subst_t }
let (__proj__Mkpsc__item__psc_range : psc -> FStar_Range.range) =
  fun projectee  ->
    match projectee with
    | { psc_range = __fname__psc_range; psc_subst = __fname__psc_subst;_} ->
        __fname__psc_range
  
let (__proj__Mkpsc__item__psc_subst :
  psc -> unit -> FStar_Syntax_Syntax.subst_t) =
  fun projectee  ->
    match projectee with
    | { psc_range = __fname__psc_range; psc_subst = __fname__psc_subst;_} ->
        __fname__psc_subst
  
let (null_psc : psc) =
  { psc_range = FStar_Range.dummyRange; psc_subst = (fun uu____1613  -> []) } 
let (psc_range : psc -> FStar_Range.range) = fun psc  -> psc.psc_range 
let (psc_subst : psc -> FStar_Syntax_Syntax.subst_t) =
  fun psc  -> psc.psc_subst () 
type primitive_step =
  {
  name: FStar_Ident.lid ;
  arity: Prims.int ;
  auto_reflect: Prims.int FStar_Pervasives_Native.option ;
  strong_reduction_ok: Prims.bool ;
  requires_binder_substitution: Prims.bool ;
  interpretation:
    psc ->
      FStar_Syntax_Syntax.args ->
        FStar_Syntax_Syntax.term FStar_Pervasives_Native.option
    }
let (__proj__Mkprimitive_step__item__name :
  primitive_step -> FStar_Ident.lid) =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;_} -> __fname__name
  
let (__proj__Mkprimitive_step__item__arity : primitive_step -> Prims.int) =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;_} -> __fname__arity
  
let (__proj__Mkprimitive_step__item__auto_reflect :
  primitive_step -> Prims.int FStar_Pervasives_Native.option) =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;_} -> __fname__auto_reflect
  
let (__proj__Mkprimitive_step__item__strong_reduction_ok :
  primitive_step -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;_} ->
        __fname__strong_reduction_ok
  
let (__proj__Mkprimitive_step__item__requires_binder_substitution :
  primitive_step -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;_} ->
        __fname__requires_binder_substitution
  
let (__proj__Mkprimitive_step__item__interpretation :
  primitive_step ->
    psc ->
      FStar_Syntax_Syntax.args ->
        FStar_Syntax_Syntax.term FStar_Pervasives_Native.option)
  =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;_} ->
        __fname__interpretation
  
type closure =
  | Clos of
  ((FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option,closure)
     FStar_Pervasives_Native.tuple2 Prims.list,FStar_Syntax_Syntax.term,
  ((FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option,closure)
     FStar_Pervasives_Native.tuple2 Prims.list,FStar_Syntax_Syntax.term)
    FStar_Pervasives_Native.tuple2 FStar_Syntax_Syntax.memo,Prims.bool)
  FStar_Pervasives_Native.tuple4 
  | Univ of FStar_Syntax_Syntax.universe 
  | Dummy 
let (uu___is_Clos : closure -> Prims.bool) =
  fun projectee  ->
    match projectee with | Clos _0 -> true | uu____1902 -> false
  
let (__proj__Clos__item___0 :
  closure ->
    ((FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option,closure)
       FStar_Pervasives_Native.tuple2 Prims.list,FStar_Syntax_Syntax.term,
      ((FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option,closure)
         FStar_Pervasives_Native.tuple2 Prims.list,FStar_Syntax_Syntax.term)
        FStar_Pervasives_Native.tuple2 FStar_Syntax_Syntax.memo,Prims.bool)
      FStar_Pervasives_Native.tuple4)
  = fun projectee  -> match projectee with | Clos _0 -> _0 
let (uu___is_Univ : closure -> Prims.bool) =
  fun projectee  ->
    match projectee with | Univ _0 -> true | uu____2006 -> false
  
let (__proj__Univ__item___0 : closure -> FStar_Syntax_Syntax.universe) =
  fun projectee  -> match projectee with | Univ _0 -> _0 
let (uu___is_Dummy : closure -> Prims.bool) =
  fun projectee  ->
    match projectee with | Dummy  -> true | uu____2019 -> false
  
type env =
  (FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option,closure)
    FStar_Pervasives_Native.tuple2 Prims.list
let (dummy :
  (FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option,closure)
    FStar_Pervasives_Native.tuple2)
  = (FStar_Pervasives_Native.None, Dummy) 
type debug_switches =
  {
  gen: Prims.bool ;
  primop: Prims.bool ;
  unfolding: Prims.bool ;
  b380: Prims.bool ;
  wpe: Prims.bool ;
  norm_delayed: Prims.bool ;
  print_normalized: Prims.bool }
let (__proj__Mkdebug_switches__item__gen : debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; primop = __fname__primop;
        unfolding = __fname__unfolding; b380 = __fname__b380;
        wpe = __fname__wpe; norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} -> __fname__gen
  
let (__proj__Mkdebug_switches__item__primop : debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; primop = __fname__primop;
        unfolding = __fname__unfolding; b380 = __fname__b380;
        wpe = __fname__wpe; norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} -> __fname__primop
  
let (__proj__Mkdebug_switches__item__unfolding :
  debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; primop = __fname__primop;
        unfolding = __fname__unfolding; b380 = __fname__b380;
        wpe = __fname__wpe; norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} -> __fname__unfolding
  
let (__proj__Mkdebug_switches__item__b380 : debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; primop = __fname__primop;
        unfolding = __fname__unfolding; b380 = __fname__b380;
        wpe = __fname__wpe; norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} -> __fname__b380
  
let (__proj__Mkdebug_switches__item__wpe : debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; primop = __fname__primop;
        unfolding = __fname__unfolding; b380 = __fname__b380;
        wpe = __fname__wpe; norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} -> __fname__wpe
  
let (__proj__Mkdebug_switches__item__norm_delayed :
  debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; primop = __fname__primop;
        unfolding = __fname__unfolding; b380 = __fname__b380;
        wpe = __fname__wpe; norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} ->
        __fname__norm_delayed
  
let (__proj__Mkdebug_switches__item__print_normalized :
  debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; primop = __fname__primop;
        unfolding = __fname__unfolding; b380 = __fname__b380;
        wpe = __fname__wpe; norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} ->
        __fname__print_normalized
  
type cfg =
  {
  steps: fsteps ;
  tcenv: FStar_TypeChecker_Env.env ;
  debug: debug_switches ;
  delta_level: FStar_TypeChecker_Env.delta_level Prims.list ;
  primitive_steps: primitive_step FStar_Util.psmap ;
  strong: Prims.bool ;
  memoize_lazy: Prims.bool ;
  normalize_pure_lets: Prims.bool }
let (__proj__Mkcfg__item__steps : cfg -> fsteps) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;_} ->
        __fname__steps
  
let (__proj__Mkcfg__item__tcenv : cfg -> FStar_TypeChecker_Env.env) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;_} ->
        __fname__tcenv
  
let (__proj__Mkcfg__item__debug : cfg -> debug_switches) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;_} ->
        __fname__debug
  
let (__proj__Mkcfg__item__delta_level :
  cfg -> FStar_TypeChecker_Env.delta_level Prims.list) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;_} ->
        __fname__delta_level
  
let (__proj__Mkcfg__item__primitive_steps :
  cfg -> primitive_step FStar_Util.psmap) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;_} ->
        __fname__primitive_steps
  
let (__proj__Mkcfg__item__strong : cfg -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;_} ->
        __fname__strong
  
let (__proj__Mkcfg__item__memoize_lazy : cfg -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;_} ->
        __fname__memoize_lazy
  
let (__proj__Mkcfg__item__normalize_pure_lets : cfg -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;_} ->
        __fname__normalize_pure_lets
  
let (cfg_env : cfg -> FStar_TypeChecker_Env.env) = fun cfg  -> cfg.tcenv 
let (add_steps :
  primitive_step FStar_Util.psmap ->
    primitive_step Prims.list -> primitive_step FStar_Util.psmap)
  =
  fun m  ->
    fun l  ->
      FStar_List.fold_right
        (fun p  ->
           fun m1  ->
             let uu____2379 = FStar_Ident.text_of_lid p.name  in
             FStar_Util.psmap_add m1 uu____2379 p) l m
  
let (prim_from_list :
  primitive_step Prims.list -> primitive_step FStar_Util.psmap) =
  fun l  ->
    let uu____2393 = FStar_Util.psmap_empty ()  in add_steps uu____2393 l
  
let (find_prim_step :
  cfg ->
    FStar_Syntax_Syntax.fv -> primitive_step FStar_Pervasives_Native.option)
  =
  fun cfg  ->
    fun fv  ->
      let uu____2408 =
        FStar_Ident.text_of_lid
          (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
         in
      FStar_Util.psmap_try_find cfg.primitive_steps uu____2408
  
type branches =
  (FStar_Syntax_Syntax.pat,FStar_Syntax_Syntax.term
                             FStar_Pervasives_Native.option,FStar_Syntax_Syntax.term)
    FStar_Pervasives_Native.tuple3 Prims.list
type stack_elt =
  | Arg of (closure,FStar_Syntax_Syntax.aqual,FStar_Range.range)
  FStar_Pervasives_Native.tuple3 
  | UnivArgs of (FStar_Syntax_Syntax.universe Prims.list,FStar_Range.range)
  FStar_Pervasives_Native.tuple2 
  | MemoLazy of (env,FStar_Syntax_Syntax.term) FStar_Pervasives_Native.tuple2
  FStar_Syntax_Syntax.memo 
  | Match of (env,branches,cfg,FStar_Range.range)
  FStar_Pervasives_Native.tuple4 
  | Abs of
  (env,FStar_Syntax_Syntax.binders,env,FStar_Syntax_Syntax.residual_comp
                                         FStar_Pervasives_Native.option,
  FStar_Range.range) FStar_Pervasives_Native.tuple5 
  | App of
  (env,FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.aqual,FStar_Range.range)
  FStar_Pervasives_Native.tuple4 
  | Meta of (env,FStar_Syntax_Syntax.metadata,FStar_Range.range)
  FStar_Pervasives_Native.tuple3 
  | Let of
  (env,FStar_Syntax_Syntax.binders,FStar_Syntax_Syntax.letbinding,FStar_Range.range)
  FStar_Pervasives_Native.tuple4 
  | Cfg of cfg 
  | Debug of (FStar_Syntax_Syntax.term,FStar_Util.time)
  FStar_Pervasives_Native.tuple2 
let (uu___is_Arg : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Arg _0 -> true | uu____2566 -> false
  
let (__proj__Arg__item___0 :
  stack_elt ->
    (closure,FStar_Syntax_Syntax.aqual,FStar_Range.range)
      FStar_Pervasives_Native.tuple3)
  = fun projectee  -> match projectee with | Arg _0 -> _0 
let (uu___is_UnivArgs : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | UnivArgs _0 -> true | uu____2604 -> false
  
let (__proj__UnivArgs__item___0 :
  stack_elt ->
    (FStar_Syntax_Syntax.universe Prims.list,FStar_Range.range)
      FStar_Pervasives_Native.tuple2)
  = fun projectee  -> match projectee with | UnivArgs _0 -> _0 
let (uu___is_MemoLazy : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | MemoLazy _0 -> true | uu____2642 -> false
  
let (__proj__MemoLazy__item___0 :
  stack_elt ->
    (env,FStar_Syntax_Syntax.term) FStar_Pervasives_Native.tuple2
      FStar_Syntax_Syntax.memo)
  = fun projectee  -> match projectee with | MemoLazy _0 -> _0 
let (uu___is_Match : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Match _0 -> true | uu____2715 -> false
  
let (__proj__Match__item___0 :
  stack_elt ->
    (env,branches,cfg,FStar_Range.range) FStar_Pervasives_Native.tuple4)
  = fun projectee  -> match projectee with | Match _0 -> _0 
let (uu___is_Abs : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Abs _0 -> true | uu____2765 -> false
  
let (__proj__Abs__item___0 :
  stack_elt ->
    (env,FStar_Syntax_Syntax.binders,env,FStar_Syntax_Syntax.residual_comp
                                           FStar_Pervasives_Native.option,
      FStar_Range.range) FStar_Pervasives_Native.tuple5)
  = fun projectee  -> match projectee with | Abs _0 -> _0 
let (uu___is_App : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | App _0 -> true | uu____2823 -> false
  
let (__proj__App__item___0 :
  stack_elt ->
    (env,FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.aqual,FStar_Range.range)
      FStar_Pervasives_Native.tuple4)
  = fun projectee  -> match projectee with | App _0 -> _0 
let (uu___is_Meta : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Meta _0 -> true | uu____2867 -> false
  
let (__proj__Meta__item___0 :
  stack_elt ->
    (env,FStar_Syntax_Syntax.metadata,FStar_Range.range)
      FStar_Pervasives_Native.tuple3)
  = fun projectee  -> match projectee with | Meta _0 -> _0 
let (uu___is_Let : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Let _0 -> true | uu____2907 -> false
  
let (__proj__Let__item___0 :
  stack_elt ->
    (env,FStar_Syntax_Syntax.binders,FStar_Syntax_Syntax.letbinding,FStar_Range.range)
      FStar_Pervasives_Native.tuple4)
  = fun projectee  -> match projectee with | Let _0 -> _0 
let (uu___is_Cfg : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Cfg _0 -> true | uu____2945 -> false
  
let (__proj__Cfg__item___0 : stack_elt -> cfg) =
  fun projectee  -> match projectee with | Cfg _0 -> _0 
let (uu___is_Debug : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Debug _0 -> true | uu____2963 -> false
  
let (__proj__Debug__item___0 :
  stack_elt ->
    (FStar_Syntax_Syntax.term,FStar_Util.time) FStar_Pervasives_Native.tuple2)
  = fun projectee  -> match projectee with | Debug _0 -> _0 
type stack = stack_elt Prims.list
let (head_of : FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun t  ->
    let uu____2990 = FStar_Syntax_Util.head_and_args' t  in
    match uu____2990 with | (hd1,uu____3004) -> hd1
  
let mk :
  'Auu____3027 .
    'Auu____3027 ->
      FStar_Range.range -> 'Auu____3027 FStar_Syntax_Syntax.syntax
  =
  fun t  -> fun r  -> FStar_Syntax_Syntax.mk t FStar_Pervasives_Native.None r 
let set_memo : 'a . cfg -> 'a FStar_Syntax_Syntax.memo -> 'a -> unit =
  fun cfg  ->
    fun r  ->
      fun t  ->
        if cfg.memoize_lazy
        then
          let uu____3090 = FStar_ST.op_Bang r  in
          match uu____3090 with
          | FStar_Pervasives_Native.Some uu____3142 ->
              failwith "Unexpected set_memo: thunk already evaluated"
          | FStar_Pervasives_Native.None  ->
              FStar_ST.op_Colon_Equals r (FStar_Pervasives_Native.Some t)
        else ()
  
let rec (env_to_string :
  (FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option,closure)
    FStar_Pervasives_Native.tuple2 Prims.list -> Prims.string)
  =
  fun env  ->
    let uu____3218 =
      FStar_List.map
        (fun uu____3232  ->
           match uu____3232 with
           | (bopt,c) ->
               let uu____3245 =
                 match bopt with
                 | FStar_Pervasives_Native.None  -> "."
                 | FStar_Pervasives_Native.Some x ->
                     FStar_Syntax_Print.binder_to_string x
                  in
               let uu____3247 = closure_to_string c  in
               FStar_Util.format2 "(%s, %s)" uu____3245 uu____3247) env
       in
    FStar_All.pipe_right uu____3218 (FStar_String.concat "; ")

and (closure_to_string : closure -> Prims.string) =
  fun uu___240_3250  ->
    match uu___240_3250 with
    | Clos (env,t,uu____3253,uu____3254) ->
        let uu____3299 =
          FStar_All.pipe_right (FStar_List.length env)
            FStar_Util.string_of_int
           in
        let uu____3306 = FStar_Syntax_Print.term_to_string t  in
        FStar_Util.format2 "(env=%s elts; %s)" uu____3299 uu____3306
    | Univ uu____3307 -> "Univ"
    | Dummy  -> "dummy"

let (stack_elt_to_string : stack_elt -> Prims.string) =
  fun uu___241_3312  ->
    match uu___241_3312 with
    | Arg (c,uu____3314,uu____3315) ->
        let uu____3316 = closure_to_string c  in
        FStar_Util.format1 "Closure %s" uu____3316
    | MemoLazy uu____3317 -> "MemoLazy"
    | Abs (uu____3324,bs,uu____3326,uu____3327,uu____3328) ->
        let uu____3333 =
          FStar_All.pipe_left FStar_Util.string_of_int (FStar_List.length bs)
           in
        FStar_Util.format1 "Abs %s" uu____3333
    | UnivArgs uu____3338 -> "UnivArgs"
    | Match uu____3345 -> "Match"
    | App (uu____3354,t,uu____3356,uu____3357) ->
        let uu____3358 = FStar_Syntax_Print.term_to_string t  in
        FStar_Util.format1 "App %s" uu____3358
    | Meta (uu____3359,m,uu____3361) -> "Meta"
    | Let uu____3362 -> "Let"
    | Cfg uu____3371 -> "Cfg"
    | Debug (t,uu____3373) ->
        let uu____3374 = FStar_Syntax_Print.term_to_string t  in
        FStar_Util.format1 "Debug %s" uu____3374
  
let (stack_to_string : stack_elt Prims.list -> Prims.string) =
  fun s  ->
    let uu____3384 = FStar_List.map stack_elt_to_string s  in
    FStar_All.pipe_right uu____3384 (FStar_String.concat "; ")
  
let (log : cfg -> (unit -> unit) -> unit) =
  fun cfg  -> fun f  -> if (cfg.debug).gen then f () else () 
let (log_primops : cfg -> (unit -> unit) -> unit) =
  fun cfg  -> fun f  -> if (cfg.debug).primop then f () else () 
let (log_unfolding : cfg -> (unit -> unit) -> unit) =
  fun cfg  -> fun f  -> if (cfg.debug).unfolding then f () else () 
let is_empty : 'Auu____3441 . 'Auu____3441 Prims.list -> Prims.bool =
  fun uu___242_3448  ->
    match uu___242_3448 with | [] -> true | uu____3451 -> false
  
let (lookup_bvar :
  (FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option,closure)
    FStar_Pervasives_Native.tuple2 Prims.list ->
    FStar_Syntax_Syntax.bv -> closure)
  =
  fun env  ->
    fun x  ->
      try
        let uu____3483 = FStar_List.nth env x.FStar_Syntax_Syntax.index  in
        FStar_Pervasives_Native.snd uu____3483
      with
      | uu____3502 ->
          let uu____3503 =
            let uu____3504 = FStar_Syntax_Print.db_to_string x  in
            let uu____3505 = env_to_string env  in
            FStar_Util.format2 "Failed to find %s\nEnv is %s\n" uu____3504
              uu____3505
             in
          failwith uu____3503
  
let (downgrade_ghost_effect_name :
  FStar_Ident.lident -> FStar_Ident.lident FStar_Pervasives_Native.option) =
  fun l  ->
    let uu____3513 =
      FStar_Ident.lid_equals l FStar_Parser_Const.effect_Ghost_lid  in
    if uu____3513
    then FStar_Pervasives_Native.Some FStar_Parser_Const.effect_Pure_lid
    else
      (let uu____3517 =
         FStar_Ident.lid_equals l FStar_Parser_Const.effect_GTot_lid  in
       if uu____3517
       then FStar_Pervasives_Native.Some FStar_Parser_Const.effect_Tot_lid
       else
         (let uu____3521 =
            FStar_Ident.lid_equals l FStar_Parser_Const.effect_GHOST_lid  in
          if uu____3521
          then
            FStar_Pervasives_Native.Some FStar_Parser_Const.effect_PURE_lid
          else FStar_Pervasives_Native.None))
  
let (norm_universe :
  cfg -> env -> FStar_Syntax_Syntax.universe -> FStar_Syntax_Syntax.universe)
  =
  fun cfg  ->
    fun env  ->
      fun u  ->
        let norm_univs us =
          let us1 = FStar_Util.sort_with FStar_Syntax_Util.compare_univs us
             in
          let uu____3555 =
            FStar_List.fold_left
              (fun uu____3581  ->
                 fun u1  ->
                   match uu____3581 with
                   | (cur_kernel,cur_max,out) ->
                       let uu____3606 = FStar_Syntax_Util.univ_kernel u1  in
                       (match uu____3606 with
                        | (k_u,n1) ->
                            let uu____3621 =
                              FStar_Syntax_Util.eq_univs cur_kernel k_u  in
                            if uu____3621
                            then (cur_kernel, u1, out)
                            else (k_u, u1, (cur_max :: out))))
              (FStar_Syntax_Syntax.U_zero, FStar_Syntax_Syntax.U_zero, [])
              us1
             in
          match uu____3555 with
          | (uu____3639,u1,out) -> FStar_List.rev (u1 :: out)  in
        let rec aux u1 =
          let u2 = FStar_Syntax_Subst.compress_univ u1  in
          match u2 with
          | FStar_Syntax_Syntax.U_bvar x ->
              (try
                 let uu____3667 =
                   let uu____3668 = FStar_List.nth env x  in
                   FStar_Pervasives_Native.snd uu____3668  in
                 match uu____3667 with
                 | Univ u3 ->
                     ((let uu____3687 =
                         FStar_All.pipe_left
                           (FStar_TypeChecker_Env.debug cfg.tcenv)
                           (FStar_Options.Other "univ_norm")
                          in
                       if uu____3687
                       then
                         let uu____3688 =
                           FStar_Syntax_Print.univ_to_string u3  in
                         FStar_Util.print1 "Univ (in norm_universe): %s\n"
                           uu____3688
                       else ());
                      aux u3)
                 | Dummy  -> [u2]
                 | uu____3690 ->
                     failwith "Impossible: universe variable bound to a term"
               with
               | uu____3698 ->
                   if (cfg.steps).allow_unbound_universes
                   then [FStar_Syntax_Syntax.U_unknown]
                   else failwith "Universe variable not found")
          | FStar_Syntax_Syntax.U_unif uu____3704 when
              (cfg.steps).check_no_uvars -> [FStar_Syntax_Syntax.U_zero]
          | FStar_Syntax_Syntax.U_zero  -> [u2]
          | FStar_Syntax_Syntax.U_unif uu____3713 -> [u2]
          | FStar_Syntax_Syntax.U_name uu____3722 -> [u2]
          | FStar_Syntax_Syntax.U_unknown  -> [u2]
          | FStar_Syntax_Syntax.U_max [] -> [FStar_Syntax_Syntax.U_zero]
          | FStar_Syntax_Syntax.U_max us ->
              let us1 =
                let uu____3729 = FStar_List.collect aux us  in
                FStar_All.pipe_right uu____3729 norm_univs  in
              (match us1 with
               | u_k::hd1::rest ->
                   let rest1 = hd1 :: rest  in
                   let uu____3746 = FStar_Syntax_Util.univ_kernel u_k  in
                   (match uu____3746 with
                    | (FStar_Syntax_Syntax.U_zero ,n1) ->
                        let uu____3754 =
                          FStar_All.pipe_right rest1
                            (FStar_List.for_all
                               (fun u3  ->
                                  let uu____3762 =
                                    FStar_Syntax_Util.univ_kernel u3  in
                                  match uu____3762 with
                                  | (uu____3767,m) -> n1 <= m))
                           in
                        if uu____3754 then rest1 else us1
                    | uu____3772 -> us1)
               | uu____3777 -> us1)
          | FStar_Syntax_Syntax.U_succ u3 ->
              let uu____3781 = aux u3  in
              FStar_List.map (fun _0_16  -> FStar_Syntax_Syntax.U_succ _0_16)
                uu____3781
           in
        if (cfg.steps).erase_universes
        then FStar_Syntax_Syntax.U_unknown
        else
          (let uu____3785 = aux u  in
           match uu____3785 with
           | [] -> FStar_Syntax_Syntax.U_zero
           | (FStar_Syntax_Syntax.U_zero )::[] -> FStar_Syntax_Syntax.U_zero
           | (FStar_Syntax_Syntax.U_zero )::u1::[] -> u1
           | (FStar_Syntax_Syntax.U_zero )::us ->
               FStar_Syntax_Syntax.U_max us
           | u1::[] -> u1
           | us -> FStar_Syntax_Syntax.U_max us)
  
let rec (inline_closure_env :
  cfg ->
    env ->
      stack_elt Prims.list ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun t  ->
          log cfg
            (fun uu____3933  ->
               let uu____3934 = FStar_Syntax_Print.tag_of_term t  in
               let uu____3935 = env_to_string env  in
               let uu____3936 = FStar_Syntax_Print.term_to_string t  in
               FStar_Util.print3 "\n>>> %s (env=%s) Closure_as_term %s\n"
                 uu____3934 uu____3935 uu____3936);
          (match env with
           | [] when
               FStar_All.pipe_left Prims.op_Negation
                 (cfg.steps).compress_uvars
               -> rebuild_closure cfg env stack t
           | uu____3945 ->
               (match t.FStar_Syntax_Syntax.n with
                | FStar_Syntax_Syntax.Tm_delayed uu____3948 ->
                    let uu____3971 = FStar_Syntax_Subst.compress t  in
                    inline_closure_env cfg env stack uu____3971
                | FStar_Syntax_Syntax.Tm_unknown  ->
                    rebuild_closure cfg env stack t
                | FStar_Syntax_Syntax.Tm_constant uu____3972 ->
                    rebuild_closure cfg env stack t
                | FStar_Syntax_Syntax.Tm_name uu____3973 ->
                    rebuild_closure cfg env stack t
                | FStar_Syntax_Syntax.Tm_lazy uu____3974 ->
                    rebuild_closure cfg env stack t
                | FStar_Syntax_Syntax.Tm_fvar uu____3975 ->
                    rebuild_closure cfg env stack t
                | FStar_Syntax_Syntax.Tm_uvar (uv,s) ->
                    if (cfg.steps).check_no_uvars
                    then
                      let t1 = FStar_Syntax_Subst.compress t  in
                      (match t1.FStar_Syntax_Syntax.n with
                       | FStar_Syntax_Syntax.Tm_uvar uu____3999 ->
                           let uu____4012 =
                             let uu____4013 =
                               FStar_Range.string_of_range
                                 t1.FStar_Syntax_Syntax.pos
                                in
                             let uu____4014 =
                               FStar_Syntax_Print.term_to_string t1  in
                             FStar_Util.format2
                               "(%s): CheckNoUvars: Unexpected unification variable remains: %s"
                               uu____4013 uu____4014
                              in
                           failwith uu____4012
                       | uu____4017 -> inline_closure_env cfg env stack t1)
                    else
                      (let s' =
                         FStar_All.pipe_right (FStar_Pervasives_Native.fst s)
                           (FStar_List.map
                              (fun s1  ->
                                 FStar_All.pipe_right s1
                                   (FStar_List.map
                                      (fun uu___243_4052  ->
                                         match uu___243_4052 with
                                         | FStar_Syntax_Syntax.NT (x,t1) ->
                                             let uu____4059 =
                                               let uu____4066 =
                                                 inline_closure_env cfg env
                                                   [] t1
                                                  in
                                               (x, uu____4066)  in
                                             FStar_Syntax_Syntax.NT
                                               uu____4059
                                         | FStar_Syntax_Syntax.NM (x,i) ->
                                             let x_i =
                                               FStar_Syntax_Syntax.bv_to_tm
                                                 (let uu___287_4076 = x  in
                                                  {
                                                    FStar_Syntax_Syntax.ppname
                                                      =
                                                      (uu___287_4076.FStar_Syntax_Syntax.ppname);
                                                    FStar_Syntax_Syntax.index
                                                      = i;
                                                    FStar_Syntax_Syntax.sort
                                                      =
                                                      (uu___287_4076.FStar_Syntax_Syntax.sort)
                                                  })
                                                in
                                             let t1 =
                                               inline_closure_env cfg env []
                                                 x_i
                                                in
                                             (match t1.FStar_Syntax_Syntax.n
                                              with
                                              | FStar_Syntax_Syntax.Tm_bvar
                                                  x_j ->
                                                  FStar_Syntax_Syntax.NM
                                                    (x,
                                                      (x_j.FStar_Syntax_Syntax.index))
                                              | uu____4081 ->
                                                  FStar_Syntax_Syntax.NT
                                                    (x, t1))
                                         | uu____4084 ->
                                             failwith
                                               "Impossible: subst invariant of uvar nodes"))))
                          in
                       let t1 =
                         let uu___288_4088 = t  in
                         {
                           FStar_Syntax_Syntax.n =
                             (FStar_Syntax_Syntax.Tm_uvar
                                (uv, (s', (FStar_Pervasives_Native.snd s))));
                           FStar_Syntax_Syntax.pos =
                             (uu___288_4088.FStar_Syntax_Syntax.pos);
                           FStar_Syntax_Syntax.vars =
                             (uu___288_4088.FStar_Syntax_Syntax.vars)
                         }  in
                       rebuild_closure cfg env stack t1)
                | FStar_Syntax_Syntax.Tm_type u ->
                    let t1 =
                      let uu____4109 =
                        let uu____4110 = norm_universe cfg env u  in
                        FStar_Syntax_Syntax.Tm_type uu____4110  in
                      mk uu____4109 t.FStar_Syntax_Syntax.pos  in
                    rebuild_closure cfg env stack t1
                | FStar_Syntax_Syntax.Tm_uinst (t',us) ->
                    let t1 =
                      let uu____4118 =
                        FStar_List.map (norm_universe cfg env) us  in
                      FStar_Syntax_Syntax.mk_Tm_uinst t' uu____4118  in
                    rebuild_closure cfg env stack t1
                | FStar_Syntax_Syntax.Tm_bvar x ->
                    let uu____4120 = lookup_bvar env x  in
                    (match uu____4120 with
                     | Univ uu____4123 ->
                         failwith
                           "Impossible: term variable is bound to a universe"
                     | Dummy  ->
                         let x1 =
                           let uu___289_4127 = x  in
                           {
                             FStar_Syntax_Syntax.ppname =
                               (uu___289_4127.FStar_Syntax_Syntax.ppname);
                             FStar_Syntax_Syntax.index =
                               (uu___289_4127.FStar_Syntax_Syntax.index);
                             FStar_Syntax_Syntax.sort =
                               FStar_Syntax_Syntax.tun
                           }  in
                         let t1 =
                           mk (FStar_Syntax_Syntax.Tm_bvar x1)
                             t.FStar_Syntax_Syntax.pos
                            in
                         rebuild_closure cfg env stack t1
                     | Clos (env1,t0,uu____4133,uu____4134) ->
                         inline_closure_env cfg env1 stack t0)
                | FStar_Syntax_Syntax.Tm_app (head1,args) ->
                    let stack1 =
                      FStar_All.pipe_right stack
                        (FStar_List.fold_right
                           (fun uu____4219  ->
                              fun stack1  ->
                                match uu____4219 with
                                | (a,aq) ->
                                    let uu____4231 =
                                      let uu____4232 =
                                        let uu____4239 =
                                          let uu____4240 =
                                            let uu____4271 =
                                              FStar_Util.mk_ref
                                                FStar_Pervasives_Native.None
                                               in
                                            (env, a, uu____4271, false)  in
                                          Clos uu____4240  in
                                        (uu____4239, aq,
                                          (t.FStar_Syntax_Syntax.pos))
                                         in
                                      Arg uu____4232  in
                                    uu____4231 :: stack1) args)
                       in
                    inline_closure_env cfg env stack1 head1
                | FStar_Syntax_Syntax.Tm_abs (bs,body,lopt) ->
                    let env' =
                      FStar_All.pipe_right env
                        (FStar_List.fold_right
                           (fun _b  ->
                              fun env1  ->
                                (FStar_Pervasives_Native.None, Dummy) :: env1)
                           bs)
                       in
                    let stack1 =
                      (Abs (env, bs, env', lopt, (t.FStar_Syntax_Syntax.pos)))
                      :: stack  in
                    inline_closure_env cfg env' stack1 body
                | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
                    let uu____4447 = close_binders cfg env bs  in
                    (match uu____4447 with
                     | (bs1,env') ->
                         let c1 = close_comp cfg env' c  in
                         let t1 =
                           mk (FStar_Syntax_Syntax.Tm_arrow (bs1, c1))
                             t.FStar_Syntax_Syntax.pos
                            in
                         rebuild_closure cfg env stack t1)
                | FStar_Syntax_Syntax.Tm_refine (x,phi) ->
                    let uu____4494 =
                      let uu____4505 =
                        let uu____4512 = FStar_Syntax_Syntax.mk_binder x  in
                        [uu____4512]  in
                      close_binders cfg env uu____4505  in
                    (match uu____4494 with
                     | (x1,env1) ->
                         let phi1 = non_tail_inline_closure_env cfg env1 phi
                            in
                         let t1 =
                           let uu____4547 =
                             let uu____4548 =
                               let uu____4555 =
                                 let uu____4556 = FStar_List.hd x1  in
                                 FStar_All.pipe_right uu____4556
                                   FStar_Pervasives_Native.fst
                                  in
                               (uu____4555, phi1)  in
                             FStar_Syntax_Syntax.Tm_refine uu____4548  in
                           mk uu____4547 t.FStar_Syntax_Syntax.pos  in
                         rebuild_closure cfg env1 stack t1)
                | FStar_Syntax_Syntax.Tm_ascribed (t1,(annot,tacopt),lopt) ->
                    let annot1 =
                      match annot with
                      | FStar_Util.Inl t2 ->
                          let uu____4647 =
                            non_tail_inline_closure_env cfg env t2  in
                          FStar_Util.Inl uu____4647
                      | FStar_Util.Inr c ->
                          let uu____4661 = close_comp cfg env c  in
                          FStar_Util.Inr uu____4661
                       in
                    let tacopt1 =
                      FStar_Util.map_opt tacopt
                        (non_tail_inline_closure_env cfg env)
                       in
                    let t2 =
                      let uu____4680 =
                        let uu____4681 =
                          let uu____4708 =
                            non_tail_inline_closure_env cfg env t1  in
                          (uu____4708, (annot1, tacopt1), lopt)  in
                        FStar_Syntax_Syntax.Tm_ascribed uu____4681  in
                      mk uu____4680 t.FStar_Syntax_Syntax.pos  in
                    rebuild_closure cfg env stack t2
                | FStar_Syntax_Syntax.Tm_quoted (t',qi) ->
                    let t1 =
                      match qi.FStar_Syntax_Syntax.qkind with
                      | FStar_Syntax_Syntax.Quote_dynamic  ->
                          let uu____4754 =
                            let uu____4755 =
                              let uu____4762 =
                                non_tail_inline_closure_env cfg env t'  in
                              (uu____4762, qi)  in
                            FStar_Syntax_Syntax.Tm_quoted uu____4755  in
                          mk uu____4754 t.FStar_Syntax_Syntax.pos
                      | FStar_Syntax_Syntax.Quote_static  ->
                          let qi1 =
                            FStar_Syntax_Syntax.on_antiquoted
                              (non_tail_inline_closure_env cfg env) qi
                             in
                          mk (FStar_Syntax_Syntax.Tm_quoted (t', qi1))
                            t.FStar_Syntax_Syntax.pos
                       in
                    rebuild_closure cfg env stack t1
                | FStar_Syntax_Syntax.Tm_meta (t',m) ->
                    let stack1 = (Meta (env, m, (t.FStar_Syntax_Syntax.pos)))
                      :: stack  in
                    inline_closure_env cfg env stack1 t'
                | FStar_Syntax_Syntax.Tm_let ((false ,lb::[]),body) ->
                    let env0 = env  in
                    let env1 =
                      FStar_List.fold_left
                        (fun env1  -> fun uu____4814  -> dummy :: env1) env
                        lb.FStar_Syntax_Syntax.lbunivs
                       in
                    let typ =
                      non_tail_inline_closure_env cfg env1
                        lb.FStar_Syntax_Syntax.lbtyp
                       in
                    let def =
                      non_tail_inline_closure_env cfg env1
                        lb.FStar_Syntax_Syntax.lbdef
                       in
                    let uu____4835 =
                      let uu____4846 = FStar_Syntax_Syntax.is_top_level [lb]
                         in
                      if uu____4846
                      then ((lb.FStar_Syntax_Syntax.lbname), body)
                      else
                        (let x =
                           FStar_Util.left lb.FStar_Syntax_Syntax.lbname  in
                         let uu____4865 =
                           non_tail_inline_closure_env cfg (dummy :: env0)
                             body
                            in
                         ((FStar_Util.Inl
                             (let uu___290_4881 = x  in
                              {
                                FStar_Syntax_Syntax.ppname =
                                  (uu___290_4881.FStar_Syntax_Syntax.ppname);
                                FStar_Syntax_Syntax.index =
                                  (uu___290_4881.FStar_Syntax_Syntax.index);
                                FStar_Syntax_Syntax.sort = typ
                              })), uu____4865))
                       in
                    (match uu____4835 with
                     | (nm,body1) ->
                         let lb1 =
                           let uu___291_4899 = lb  in
                           {
                             FStar_Syntax_Syntax.lbname = nm;
                             FStar_Syntax_Syntax.lbunivs =
                               (uu___291_4899.FStar_Syntax_Syntax.lbunivs);
                             FStar_Syntax_Syntax.lbtyp = typ;
                             FStar_Syntax_Syntax.lbeff =
                               (uu___291_4899.FStar_Syntax_Syntax.lbeff);
                             FStar_Syntax_Syntax.lbdef = def;
                             FStar_Syntax_Syntax.lbattrs =
                               (uu___291_4899.FStar_Syntax_Syntax.lbattrs);
                             FStar_Syntax_Syntax.lbpos =
                               (uu___291_4899.FStar_Syntax_Syntax.lbpos)
                           }  in
                         let t1 =
                           mk
                             (FStar_Syntax_Syntax.Tm_let
                                ((false, [lb1]), body1))
                             t.FStar_Syntax_Syntax.pos
                            in
                         rebuild_closure cfg env0 stack t1)
                | FStar_Syntax_Syntax.Tm_let ((uu____4913,lbs),body) ->
                    let norm_one_lb env1 lb =
                      let env_univs =
                        FStar_List.fold_right
                          (fun uu____4976  -> fun env2  -> dummy :: env2)
                          lb.FStar_Syntax_Syntax.lbunivs env1
                         in
                      let env2 =
                        let uu____4993 = FStar_Syntax_Syntax.is_top_level lbs
                           in
                        if uu____4993
                        then env_univs
                        else
                          FStar_List.fold_right
                            (fun uu____5005  -> fun env2  -> dummy :: env2)
                            lbs env_univs
                         in
                      let ty =
                        non_tail_inline_closure_env cfg env_univs
                          lb.FStar_Syntax_Syntax.lbtyp
                         in
                      let nm =
                        let uu____5029 = FStar_Syntax_Syntax.is_top_level lbs
                           in
                        if uu____5029
                        then lb.FStar_Syntax_Syntax.lbname
                        else
                          (let x =
                             FStar_Util.left lb.FStar_Syntax_Syntax.lbname
                              in
                           FStar_Util.Inl
                             (let uu___292_5037 = x  in
                              {
                                FStar_Syntax_Syntax.ppname =
                                  (uu___292_5037.FStar_Syntax_Syntax.ppname);
                                FStar_Syntax_Syntax.index =
                                  (uu___292_5037.FStar_Syntax_Syntax.index);
                                FStar_Syntax_Syntax.sort = ty
                              }))
                         in
                      let uu___293_5038 = lb  in
                      let uu____5039 =
                        non_tail_inline_closure_env cfg env2
                          lb.FStar_Syntax_Syntax.lbdef
                         in
                      {
                        FStar_Syntax_Syntax.lbname = nm;
                        FStar_Syntax_Syntax.lbunivs =
                          (uu___293_5038.FStar_Syntax_Syntax.lbunivs);
                        FStar_Syntax_Syntax.lbtyp = ty;
                        FStar_Syntax_Syntax.lbeff =
                          (uu___293_5038.FStar_Syntax_Syntax.lbeff);
                        FStar_Syntax_Syntax.lbdef = uu____5039;
                        FStar_Syntax_Syntax.lbattrs =
                          (uu___293_5038.FStar_Syntax_Syntax.lbattrs);
                        FStar_Syntax_Syntax.lbpos =
                          (uu___293_5038.FStar_Syntax_Syntax.lbpos)
                      }  in
                    let lbs1 =
                      FStar_All.pipe_right lbs
                        (FStar_List.map (norm_one_lb env))
                       in
                    let body1 =
                      let body_env =
                        FStar_List.fold_right
                          (fun uu____5071  -> fun env1  -> dummy :: env1)
                          lbs1 env
                         in
                      non_tail_inline_closure_env cfg body_env body  in
                    let t1 =
                      mk (FStar_Syntax_Syntax.Tm_let ((true, lbs1), body1))
                        t.FStar_Syntax_Syntax.pos
                       in
                    rebuild_closure cfg env stack t1
                | FStar_Syntax_Syntax.Tm_match (head1,branches) ->
                    let stack1 =
                      (Match
                         (env, branches, cfg, (t.FStar_Syntax_Syntax.pos)))
                      :: stack  in
                    inline_closure_env cfg env stack1 head1))

and (non_tail_inline_closure_env :
  cfg ->
    env ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  = fun cfg  -> fun env  -> fun t  -> inline_closure_env cfg env [] t

and (rebuild_closure :
  cfg ->
    env ->
      stack_elt Prims.list ->
        FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
          FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun t  ->
          log cfg
            (fun uu____5160  ->
               let uu____5161 = FStar_Syntax_Print.tag_of_term t  in
               let uu____5162 = env_to_string env  in
               let uu____5163 = stack_to_string stack  in
               let uu____5164 = FStar_Syntax_Print.term_to_string t  in
               FStar_Util.print4
                 "\n>>> %s (env=%s, stack=%s) Rebuild closure_as_term %s\n"
                 uu____5161 uu____5162 uu____5163 uu____5164);
          (match stack with
           | [] -> t
           | (Arg (Clos (env_arg,tm,uu____5169,uu____5170),aq,r))::stack1 ->
               let stack2 = (App (env, t, aq, r)) :: stack1  in
               inline_closure_env cfg env_arg stack2 tm
           | (App (env1,head1,aq,r))::stack1 ->
               let t1 =
                 FStar_Syntax_Syntax.extend_app head1 (t, aq)
                   FStar_Pervasives_Native.None r
                  in
               rebuild_closure cfg env1 stack1 t1
           | (Abs (env',bs,env'',lopt,r))::stack1 ->
               let uu____5247 = close_binders cfg env' bs  in
               (match uu____5247 with
                | (bs1,uu____5261) ->
                    let lopt1 = close_lcomp_opt cfg env'' lopt  in
                    let uu____5277 =
                      let uu___294_5280 = FStar_Syntax_Util.abs bs1 t lopt1
                         in
                      {
                        FStar_Syntax_Syntax.n =
                          (uu___294_5280.FStar_Syntax_Syntax.n);
                        FStar_Syntax_Syntax.pos = r;
                        FStar_Syntax_Syntax.vars =
                          (uu___294_5280.FStar_Syntax_Syntax.vars)
                      }  in
                    rebuild_closure cfg env stack1 uu____5277)
           | (Match (env1,branches,cfg1,r))::stack1 ->
               let close_one_branch env2 uu____5336 =
                 match uu____5336 with
                 | (pat,w_opt,tm) ->
                     let rec norm_pat env3 p =
                       match p.FStar_Syntax_Syntax.v with
                       | FStar_Syntax_Syntax.Pat_constant uu____5451 ->
                           (p, env3)
                       | FStar_Syntax_Syntax.Pat_cons (fv,pats) ->
                           let uu____5480 =
                             FStar_All.pipe_right pats
                               (FStar_List.fold_left
                                  (fun uu____5564  ->
                                     fun uu____5565  ->
                                       match (uu____5564, uu____5565) with
                                       | ((pats1,env4),(p1,b)) ->
                                           let uu____5704 = norm_pat env4 p1
                                              in
                                           (match uu____5704 with
                                            | (p2,env5) ->
                                                (((p2, b) :: pats1), env5)))
                                  ([], env3))
                              in
                           (match uu____5480 with
                            | (pats1,env4) ->
                                ((let uu___295_5866 = p  in
                                  {
                                    FStar_Syntax_Syntax.v =
                                      (FStar_Syntax_Syntax.Pat_cons
                                         (fv, (FStar_List.rev pats1)));
                                    FStar_Syntax_Syntax.p =
                                      (uu___295_5866.FStar_Syntax_Syntax.p)
                                  }), env4))
                       | FStar_Syntax_Syntax.Pat_var x ->
                           let x1 =
                             let uu___296_5885 = x  in
                             let uu____5886 =
                               non_tail_inline_closure_env cfg1 env3
                                 x.FStar_Syntax_Syntax.sort
                                in
                             {
                               FStar_Syntax_Syntax.ppname =
                                 (uu___296_5885.FStar_Syntax_Syntax.ppname);
                               FStar_Syntax_Syntax.index =
                                 (uu___296_5885.FStar_Syntax_Syntax.index);
                               FStar_Syntax_Syntax.sort = uu____5886
                             }  in
                           ((let uu___297_5900 = p  in
                             {
                               FStar_Syntax_Syntax.v =
                                 (FStar_Syntax_Syntax.Pat_var x1);
                               FStar_Syntax_Syntax.p =
                                 (uu___297_5900.FStar_Syntax_Syntax.p)
                             }), (dummy :: env3))
                       | FStar_Syntax_Syntax.Pat_wild x ->
                           let x1 =
                             let uu___298_5911 = x  in
                             let uu____5912 =
                               non_tail_inline_closure_env cfg1 env3
                                 x.FStar_Syntax_Syntax.sort
                                in
                             {
                               FStar_Syntax_Syntax.ppname =
                                 (uu___298_5911.FStar_Syntax_Syntax.ppname);
                               FStar_Syntax_Syntax.index =
                                 (uu___298_5911.FStar_Syntax_Syntax.index);
                               FStar_Syntax_Syntax.sort = uu____5912
                             }  in
                           ((let uu___299_5926 = p  in
                             {
                               FStar_Syntax_Syntax.v =
                                 (FStar_Syntax_Syntax.Pat_wild x1);
                               FStar_Syntax_Syntax.p =
                                 (uu___299_5926.FStar_Syntax_Syntax.p)
                             }), (dummy :: env3))
                       | FStar_Syntax_Syntax.Pat_dot_term (x,t1) ->
                           let x1 =
                             let uu___300_5942 = x  in
                             let uu____5943 =
                               non_tail_inline_closure_env cfg1 env3
                                 x.FStar_Syntax_Syntax.sort
                                in
                             {
                               FStar_Syntax_Syntax.ppname =
                                 (uu___300_5942.FStar_Syntax_Syntax.ppname);
                               FStar_Syntax_Syntax.index =
                                 (uu___300_5942.FStar_Syntax_Syntax.index);
                               FStar_Syntax_Syntax.sort = uu____5943
                             }  in
                           let t2 = non_tail_inline_closure_env cfg1 env3 t1
                              in
                           ((let uu___301_5960 = p  in
                             {
                               FStar_Syntax_Syntax.v =
                                 (FStar_Syntax_Syntax.Pat_dot_term (x1, t2));
                               FStar_Syntax_Syntax.p =
                                 (uu___301_5960.FStar_Syntax_Syntax.p)
                             }), env3)
                        in
                     let uu____5965 = norm_pat env2 pat  in
                     (match uu____5965 with
                      | (pat1,env3) ->
                          let w_opt1 =
                            match w_opt with
                            | FStar_Pervasives_Native.None  ->
                                FStar_Pervasives_Native.None
                            | FStar_Pervasives_Native.Some w ->
                                let uu____6034 =
                                  non_tail_inline_closure_env cfg1 env3 w  in
                                FStar_Pervasives_Native.Some uu____6034
                             in
                          let tm1 = non_tail_inline_closure_env cfg1 env3 tm
                             in
                          (pat1, w_opt1, tm1))
                  in
               let t1 =
                 let uu____6053 =
                   let uu____6054 =
                     let uu____6077 =
                       FStar_All.pipe_right branches
                         (FStar_List.map (close_one_branch env1))
                        in
                     (t, uu____6077)  in
                   FStar_Syntax_Syntax.Tm_match uu____6054  in
                 mk uu____6053 t.FStar_Syntax_Syntax.pos  in
               rebuild_closure cfg1 env1 stack1 t1
           | (Meta (env_m,m,r))::stack1 ->
               let m1 =
                 match m with
                 | FStar_Syntax_Syntax.Meta_pattern args ->
                     let uu____6190 =
                       FStar_All.pipe_right args
                         (FStar_List.map
                            (fun args1  ->
                               FStar_All.pipe_right args1
                                 (FStar_List.map
                                    (fun uu____6279  ->
                                       match uu____6279 with
                                       | (a,q) ->
                                           let uu____6298 =
                                             non_tail_inline_closure_env cfg
                                               env_m a
                                              in
                                           (uu____6298, q)))))
                        in
                     FStar_Syntax_Syntax.Meta_pattern uu____6190
                 | FStar_Syntax_Syntax.Meta_monadic (m1,tbody) ->
                     let uu____6309 =
                       let uu____6316 =
                         non_tail_inline_closure_env cfg env_m tbody  in
                       (m1, uu____6316)  in
                     FStar_Syntax_Syntax.Meta_monadic uu____6309
                 | FStar_Syntax_Syntax.Meta_monadic_lift (m1,m2,tbody) ->
                     let uu____6328 =
                       let uu____6337 =
                         non_tail_inline_closure_env cfg env_m tbody  in
                       (m1, m2, uu____6337)  in
                     FStar_Syntax_Syntax.Meta_monadic_lift uu____6328
                 | uu____6342 -> m  in
               let t1 = mk (FStar_Syntax_Syntax.Tm_meta (t, m1)) r  in
               rebuild_closure cfg env stack1 t1
           | uu____6348 -> failwith "Impossible: unexpected stack element")

and (close_binders :
  cfg ->
    env ->
      (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
        FStar_Pervasives_Native.tuple2 Prims.list ->
        ((FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
           FStar_Pervasives_Native.tuple2 Prims.list,env)
          FStar_Pervasives_Native.tuple2)
  =
  fun cfg  ->
    fun env  ->
      fun bs  ->
        let uu____6362 =
          FStar_All.pipe_right bs
            (FStar_List.fold_left
               (fun uu____6435  ->
                  fun uu____6436  ->
                    match (uu____6435, uu____6436) with
                    | ((env1,out),(b,imp)) ->
                        let b1 =
                          let uu___302_6554 = b  in
                          let uu____6555 =
                            inline_closure_env cfg env1 []
                              b.FStar_Syntax_Syntax.sort
                             in
                          {
                            FStar_Syntax_Syntax.ppname =
                              (uu___302_6554.FStar_Syntax_Syntax.ppname);
                            FStar_Syntax_Syntax.index =
                              (uu___302_6554.FStar_Syntax_Syntax.index);
                            FStar_Syntax_Syntax.sort = uu____6555
                          }  in
                        let env2 = dummy :: env1  in
                        (env2, ((b1, imp) :: out))) (env, []))
           in
        match uu____6362 with | (env1,bs1) -> ((FStar_List.rev bs1), env1)

and (close_comp :
  cfg ->
    env ->
      FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax)
  =
  fun cfg  ->
    fun env  ->
      fun c  ->
        match env with
        | [] when
            FStar_All.pipe_left Prims.op_Negation (cfg.steps).compress_uvars
            -> c
        | uu____6672 ->
            (match c.FStar_Syntax_Syntax.n with
             | FStar_Syntax_Syntax.Total (t,uopt) ->
                 let uu____6685 = inline_closure_env cfg env [] t  in
                 let uu____6686 =
                   FStar_Option.map (norm_universe cfg env) uopt  in
                 FStar_Syntax_Syntax.mk_Total' uu____6685 uu____6686
             | FStar_Syntax_Syntax.GTotal (t,uopt) ->
                 let uu____6699 = inline_closure_env cfg env [] t  in
                 let uu____6700 =
                   FStar_Option.map (norm_universe cfg env) uopt  in
                 FStar_Syntax_Syntax.mk_GTotal' uu____6699 uu____6700
             | FStar_Syntax_Syntax.Comp c1 ->
                 let rt =
                   inline_closure_env cfg env []
                     c1.FStar_Syntax_Syntax.result_typ
                    in
                 let args =
                   FStar_All.pipe_right c1.FStar_Syntax_Syntax.effect_args
                     (FStar_List.map
                        (fun uu____6744  ->
                           match uu____6744 with
                           | (a,q) ->
                               let uu____6757 =
                                 inline_closure_env cfg env [] a  in
                               (uu____6757, q)))
                    in
                 let flags1 =
                   FStar_All.pipe_right c1.FStar_Syntax_Syntax.flags
                     (FStar_List.map
                        (fun uu___244_6772  ->
                           match uu___244_6772 with
                           | FStar_Syntax_Syntax.DECREASES t ->
                               let uu____6776 =
                                 inline_closure_env cfg env [] t  in
                               FStar_Syntax_Syntax.DECREASES uu____6776
                           | f -> f))
                    in
                 let uu____6780 =
                   let uu___303_6781 = c1  in
                   let uu____6782 =
                     FStar_List.map (norm_universe cfg env)
                       c1.FStar_Syntax_Syntax.comp_univs
                      in
                   {
                     FStar_Syntax_Syntax.comp_univs = uu____6782;
                     FStar_Syntax_Syntax.effect_name =
                       (uu___303_6781.FStar_Syntax_Syntax.effect_name);
                     FStar_Syntax_Syntax.result_typ = rt;
                     FStar_Syntax_Syntax.effect_args = args;
                     FStar_Syntax_Syntax.flags = flags1
                   }  in
                 FStar_Syntax_Syntax.mk_Comp uu____6780)

and (filter_out_lcomp_cflags :
  FStar_Syntax_Syntax.cflags Prims.list ->
    FStar_Syntax_Syntax.cflags Prims.list)
  =
  fun flags1  ->
    FStar_All.pipe_right flags1
      (FStar_List.filter
         (fun uu___245_6792  ->
            match uu___245_6792 with
            | FStar_Syntax_Syntax.DECREASES uu____6793 -> false
            | uu____6796 -> true))

and (close_lcomp_opt :
  cfg ->
    env ->
      FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option ->
        FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option)
  =
  fun cfg  ->
    fun env  ->
      fun lopt  ->
        match lopt with
        | FStar_Pervasives_Native.Some rc ->
            let flags1 =
              FStar_All.pipe_right rc.FStar_Syntax_Syntax.residual_flags
                (FStar_List.filter
                   (fun uu___246_6814  ->
                      match uu___246_6814 with
                      | FStar_Syntax_Syntax.DECREASES uu____6815 -> false
                      | uu____6818 -> true))
               in
            let rc1 =
              let uu___304_6820 = rc  in
              let uu____6821 =
                FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ
                  (inline_closure_env cfg env [])
                 in
              {
                FStar_Syntax_Syntax.residual_effect =
                  (uu___304_6820.FStar_Syntax_Syntax.residual_effect);
                FStar_Syntax_Syntax.residual_typ = uu____6821;
                FStar_Syntax_Syntax.residual_flags = flags1
              }  in
            FStar_Pervasives_Native.Some rc1
        | uu____6830 -> lopt

let (closure_as_term :
  cfg -> env -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun cfg  -> fun env  -> fun t  -> non_tail_inline_closure_env cfg env t 
let (built_in_primitive_steps : primitive_step FStar_Util.psmap) =
  let arg_as_int a =
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (FStar_Syntax_Embeddings.try_unembed FStar_Syntax_Embeddings.e_int)
     in
  let arg_as_bool a =
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (FStar_Syntax_Embeddings.try_unembed FStar_Syntax_Embeddings.e_bool)
     in
  let arg_as_char a =
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (FStar_Syntax_Embeddings.try_unembed FStar_Syntax_Embeddings.e_char)
     in
  let arg_as_string a =
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (FStar_Syntax_Embeddings.try_unembed FStar_Syntax_Embeddings.e_string)
     in
  let arg_as_list e a =
    let uu____6935 =
      let uu____6944 = FStar_Syntax_Embeddings.e_list e  in
      FStar_Syntax_Embeddings.try_unembed uu____6944  in
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a) uu____6935  in
  let arg_as_bounded_int uu____6970 =
    match uu____6970 with
    | (a,uu____6982) ->
        let uu____6989 =
          let uu____6990 = FStar_Syntax_Subst.compress a  in
          uu____6990.FStar_Syntax_Syntax.n  in
        (match uu____6989 with
         | FStar_Syntax_Syntax.Tm_app
             ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv1;
                FStar_Syntax_Syntax.pos = uu____7000;
                FStar_Syntax_Syntax.vars = uu____7001;_},({
                                                            FStar_Syntax_Syntax.n
                                                              =
                                                              FStar_Syntax_Syntax.Tm_constant
                                                              (FStar_Const.Const_int
                                                              (i,FStar_Pervasives_Native.None
                                                               ));
                                                            FStar_Syntax_Syntax.pos
                                                              = uu____7003;
                                                            FStar_Syntax_Syntax.vars
                                                              = uu____7004;_},uu____7005)::[])
             when
             let uu____7044 =
               FStar_Ident.text_of_lid
                 (fv1.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                in
             FStar_Util.ends_with uu____7044 "int_to_t" ->
             let uu____7045 =
               let uu____7050 = FStar_BigInt.big_int_of_string i  in
               (fv1, uu____7050)  in
             FStar_Pervasives_Native.Some uu____7045
         | uu____7055 -> FStar_Pervasives_Native.None)
     in
  let lift_unary f aopts =
    match aopts with
    | (FStar_Pervasives_Native.Some a)::[] ->
        let uu____7103 = f a  in FStar_Pervasives_Native.Some uu____7103
    | uu____7104 -> FStar_Pervasives_Native.None  in
  let lift_binary f aopts =
    match aopts with
    | (FStar_Pervasives_Native.Some a0)::(FStar_Pervasives_Native.Some
        a1)::[] ->
        let uu____7160 = f a0 a1  in FStar_Pervasives_Native.Some uu____7160
    | uu____7161 -> FStar_Pervasives_Native.None  in
  let unary_op as_a f res args =
    let uu____7219 = FStar_List.map as_a args  in
    lift_unary (f res.psc_range) uu____7219  in
  let binary_op as_a f res args =
    let uu____7290 = FStar_List.map as_a args  in
    lift_binary (f res.psc_range) uu____7290  in
  let as_primitive_step is_strong uu____7327 =
    match uu____7327 with
    | (l,arity,f) ->
        {
          name = l;
          arity;
          auto_reflect = FStar_Pervasives_Native.None;
          strong_reduction_ok = is_strong;
          requires_binder_substitution = false;
          interpretation = f
        }
     in
  let unary_int_op f =
    unary_op arg_as_int
      (fun r  ->
         fun x  ->
           let uu____7387 = f x  in
           FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_int r
             uu____7387)
     in
  let binary_int_op f =
    binary_op arg_as_int
      (fun r  ->
         fun x  ->
           fun y  ->
             let uu____7423 = f x y  in
             FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_int r
               uu____7423)
     in
  let unary_bool_op f =
    unary_op arg_as_bool
      (fun r  ->
         fun x  ->
           let uu____7452 = f x  in
           FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_bool r
             uu____7452)
     in
  let binary_bool_op f =
    binary_op arg_as_bool
      (fun r  ->
         fun x  ->
           fun y  ->
             let uu____7488 = f x y  in
             FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_bool r
               uu____7488)
     in
  let binary_string_op f =
    binary_op arg_as_string
      (fun r  ->
         fun x  ->
           fun y  ->
             let uu____7524 = f x y  in
             FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_string r
               uu____7524)
     in
  let mixed_binary_op as_a as_b embed_c f res args =
    match args with
    | a::b::[] ->
        let uu____7656 =
          let uu____7665 = as_a a  in
          let uu____7668 = as_b b  in (uu____7665, uu____7668)  in
        (match uu____7656 with
         | (FStar_Pervasives_Native.Some a1,FStar_Pervasives_Native.Some b1)
             ->
             let uu____7683 =
               let uu____7684 = f res.psc_range a1 b1  in
               embed_c res.psc_range uu____7684  in
             FStar_Pervasives_Native.Some uu____7683
         | uu____7685 -> FStar_Pervasives_Native.None)
    | uu____7694 -> FStar_Pervasives_Native.None  in
  let list_of_string' rng s =
    let name l =
      let uu____7714 =
        let uu____7715 =
          FStar_Syntax_Syntax.lid_as_fv l FStar_Syntax_Syntax.delta_constant
            FStar_Pervasives_Native.None
           in
        FStar_Syntax_Syntax.Tm_fvar uu____7715  in
      mk uu____7714 rng  in
    let char_t = name FStar_Parser_Const.char_lid  in
    let charterm c =
      mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_char c)) rng  in
    let uu____7729 =
      let uu____7732 = FStar_String.list_of_string s  in
      FStar_List.map charterm uu____7732  in
    FStar_All.pipe_left (FStar_Syntax_Util.mk_list char_t rng) uu____7729  in
  let string_of_list' rng l =
    let s = FStar_String.string_of_list l  in FStar_Syntax_Util.exp_string s
     in
  let string_compare' rng s1 s2 =
    let r = FStar_String.compare s1 s2  in
    let uu____7774 =
      let uu____7775 = FStar_Util.string_of_int r  in
      FStar_BigInt.big_int_of_string uu____7775  in
    FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_int rng
      uu____7774
     in
  let string_concat' psc args =
    match args with
    | a1::a2::[] ->
        let uu____7839 = arg_as_string a1  in
        (match uu____7839 with
         | FStar_Pervasives_Native.Some s1 ->
             let uu____7845 = arg_as_list FStar_Syntax_Embeddings.e_string a2
                in
             (match uu____7845 with
              | FStar_Pervasives_Native.Some s2 ->
                  let r = FStar_String.concat s1 s2  in
                  let uu____7858 =
                    FStar_Syntax_Embeddings.embed
                      FStar_Syntax_Embeddings.e_string psc.psc_range r
                     in
                  FStar_Pervasives_Native.Some uu____7858
              | uu____7859 -> FStar_Pervasives_Native.None)
         | uu____7864 -> FStar_Pervasives_Native.None)
    | uu____7867 -> FStar_Pervasives_Native.None  in
  let string_of_int1 rng i =
    let uu____7887 = FStar_BigInt.string_of_big_int i  in
    FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_string rng
      uu____7887
     in
  let string_of_bool1 rng b =
    FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_string rng
      (if b then "true" else "false")
     in
  let mk_range1 psc args =
    match args with
    | fn::from_line::from_col::to_line::to_col::[] ->
        let uu____7924 =
          let uu____7945 = arg_as_string fn  in
          let uu____7948 = arg_as_int from_line  in
          let uu____7951 = arg_as_int from_col  in
          let uu____7954 = arg_as_int to_line  in
          let uu____7957 = arg_as_int to_col  in
          (uu____7945, uu____7948, uu____7951, uu____7954, uu____7957)  in
        (match uu____7924 with
         | (FStar_Pervasives_Native.Some fn1,FStar_Pervasives_Native.Some
            from_l,FStar_Pervasives_Native.Some
            from_c,FStar_Pervasives_Native.Some
            to_l,FStar_Pervasives_Native.Some to_c) ->
             let r =
               let uu____7988 =
                 let uu____7989 = FStar_BigInt.to_int_fs from_l  in
                 let uu____7990 = FStar_BigInt.to_int_fs from_c  in
                 FStar_Range.mk_pos uu____7989 uu____7990  in
               let uu____7991 =
                 let uu____7992 = FStar_BigInt.to_int_fs to_l  in
                 let uu____7993 = FStar_BigInt.to_int_fs to_c  in
                 FStar_Range.mk_pos uu____7992 uu____7993  in
               FStar_Range.mk_range fn1 uu____7988 uu____7991  in
             let uu____7994 =
               FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_range
                 psc.psc_range r
                in
             FStar_Pervasives_Native.Some uu____7994
         | uu____7995 -> FStar_Pervasives_Native.None)
    | uu____8016 -> FStar_Pervasives_Native.None  in
  let decidable_eq neg psc args =
    let r = psc.psc_range  in
    let tru =
      mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool true)) r
       in
    let fal =
      mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool false)) r
       in
    match args with
    | (_typ,uu____8049)::(a1,uu____8051)::(a2,uu____8053)::[] ->
        let uu____8090 = FStar_Syntax_Util.eq_tm a1 a2  in
        (match uu____8090 with
         | FStar_Syntax_Util.Equal  ->
             FStar_Pervasives_Native.Some (if neg then fal else tru)
         | FStar_Syntax_Util.NotEqual  ->
             FStar_Pervasives_Native.Some (if neg then tru else fal)
         | uu____8095 -> FStar_Pervasives_Native.None)
    | uu____8096 -> failwith "Unexpected number of arguments"  in
  let prims_to_fstar_range_step psc args =
    match args with
    | (a1,uu____8127)::[] ->
        let uu____8136 =
          FStar_Syntax_Embeddings.try_unembed FStar_Syntax_Embeddings.e_range
            a1
           in
        (match uu____8136 with
         | FStar_Pervasives_Native.Some r ->
             let uu____8142 =
               FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_range
                 psc.psc_range r
                in
             FStar_Pervasives_Native.Some uu____8142
         | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None)
    | uu____8143 -> failwith "Unexpected number of arguments"  in
  let basic_ops =
    let uu____8169 =
      let uu____8186 =
        let uu____8203 =
          let uu____8220 =
            let uu____8237 =
              let uu____8254 =
                let uu____8271 =
                  let uu____8288 =
                    let uu____8305 =
                      let uu____8322 =
                        let uu____8339 =
                          let uu____8356 =
                            let uu____8373 =
                              let uu____8390 =
                                let uu____8407 =
                                  let uu____8424 =
                                    let uu____8441 =
                                      let uu____8458 =
                                        let uu____8475 =
                                          let uu____8492 =
                                            let uu____8509 =
                                              let uu____8526 =
                                                let uu____8541 =
                                                  FStar_Parser_Const.p2l
                                                    ["FStar";
                                                    "String";
                                                    "list_of_string"]
                                                   in
                                                (uu____8541,
                                                  (Prims.parse_int "1"),
                                                  (unary_op arg_as_string
                                                     list_of_string'))
                                                 in
                                              let uu____8550 =
                                                let uu____8567 =
                                                  let uu____8582 =
                                                    FStar_Parser_Const.p2l
                                                      ["FStar";
                                                      "String";
                                                      "string_of_list"]
                                                     in
                                                  (uu____8582,
                                                    (Prims.parse_int "1"),
                                                    (unary_op
                                                       (arg_as_list
                                                          FStar_Syntax_Embeddings.e_char)
                                                       string_of_list'))
                                                   in
                                                let uu____8595 =
                                                  let uu____8612 =
                                                    let uu____8627 =
                                                      FStar_Parser_Const.p2l
                                                        ["FStar";
                                                        "String";
                                                        "concat"]
                                                       in
                                                    (uu____8627,
                                                      (Prims.parse_int "2"),
                                                      string_concat')
                                                     in
                                                  let uu____8636 =
                                                    let uu____8653 =
                                                      let uu____8668 =
                                                        FStar_Parser_Const.p2l
                                                          ["Prims";
                                                          "mk_range"]
                                                         in
                                                      (uu____8668,
                                                        (Prims.parse_int "5"),
                                                        mk_range1)
                                                       in
                                                    [uu____8653]  in
                                                  uu____8612 :: uu____8636
                                                   in
                                                uu____8567 :: uu____8595  in
                                              uu____8526 :: uu____8550  in
                                            (FStar_Parser_Const.op_notEq,
                                              (Prims.parse_int "3"),
                                              (decidable_eq true)) ::
                                              uu____8509
                                             in
                                          (FStar_Parser_Const.op_Eq,
                                            (Prims.parse_int "3"),
                                            (decidable_eq false)) ::
                                            uu____8492
                                           in
                                        (FStar_Parser_Const.string_compare,
                                          (Prims.parse_int "2"),
                                          (binary_op arg_as_string
                                             string_compare'))
                                          :: uu____8475
                                         in
                                      (FStar_Parser_Const.string_of_bool_lid,
                                        (Prims.parse_int "1"),
                                        (unary_op arg_as_bool string_of_bool1))
                                        :: uu____8458
                                       in
                                    (FStar_Parser_Const.string_of_int_lid,
                                      (Prims.parse_int "1"),
                                      (unary_op arg_as_int string_of_int1))
                                      :: uu____8441
                                     in
                                  (FStar_Parser_Const.str_make_lid,
                                    (Prims.parse_int "2"),
                                    (mixed_binary_op arg_as_int arg_as_char
                                       (FStar_Syntax_Embeddings.embed
                                          FStar_Syntax_Embeddings.e_string)
                                       (fun r  ->
                                          fun x  ->
                                            fun y  ->
                                              let uu____8888 =
                                                FStar_BigInt.to_int_fs x  in
                                              FStar_String.make uu____8888 y)))
                                    :: uu____8424
                                   in
                                (FStar_Parser_Const.strcat_lid',
                                  (Prims.parse_int "2"),
                                  (binary_string_op
                                     (fun x  -> fun y  -> Prims.strcat x y)))
                                  :: uu____8407
                                 in
                              (FStar_Parser_Const.strcat_lid,
                                (Prims.parse_int "2"),
                                (binary_string_op
                                   (fun x  -> fun y  -> Prims.strcat x y)))
                                :: uu____8390
                               in
                            (FStar_Parser_Const.op_Or, (Prims.parse_int "2"),
                              (binary_bool_op (fun x  -> fun y  -> x || y)))
                              :: uu____8373
                             in
                          (FStar_Parser_Const.op_And, (Prims.parse_int "2"),
                            (binary_bool_op (fun x  -> fun y  -> x && y))) ::
                            uu____8356
                           in
                        (FStar_Parser_Const.op_Negation,
                          (Prims.parse_int "1"),
                          (unary_bool_op (fun x  -> Prims.op_Negation x))) ::
                          uu____8339
                         in
                      (FStar_Parser_Const.op_Modulus, (Prims.parse_int "2"),
                        (binary_int_op
                           (fun x  -> fun y  -> FStar_BigInt.mod_big_int x y)))
                        :: uu____8322
                       in
                    (FStar_Parser_Const.op_GTE, (Prims.parse_int "2"),
                      (binary_op arg_as_int
                         (fun r  ->
                            fun x  ->
                              fun y  ->
                                let uu____9083 = FStar_BigInt.ge_big_int x y
                                   in
                                FStar_Syntax_Embeddings.embed
                                  FStar_Syntax_Embeddings.e_bool r uu____9083)))
                      :: uu____8305
                     in
                  (FStar_Parser_Const.op_GT, (Prims.parse_int "2"),
                    (binary_op arg_as_int
                       (fun r  ->
                          fun x  ->
                            fun y  ->
                              let uu____9113 = FStar_BigInt.gt_big_int x y
                                 in
                              FStar_Syntax_Embeddings.embed
                                FStar_Syntax_Embeddings.e_bool r uu____9113)))
                    :: uu____8288
                   in
                (FStar_Parser_Const.op_LTE, (Prims.parse_int "2"),
                  (binary_op arg_as_int
                     (fun r  ->
                        fun x  ->
                          fun y  ->
                            let uu____9143 = FStar_BigInt.le_big_int x y  in
                            FStar_Syntax_Embeddings.embed
                              FStar_Syntax_Embeddings.e_bool r uu____9143)))
                  :: uu____8271
                 in
              (FStar_Parser_Const.op_LT, (Prims.parse_int "2"),
                (binary_op arg_as_int
                   (fun r  ->
                      fun x  ->
                        fun y  ->
                          let uu____9173 = FStar_BigInt.lt_big_int x y  in
                          FStar_Syntax_Embeddings.embed
                            FStar_Syntax_Embeddings.e_bool r uu____9173)))
                :: uu____8254
               in
            (FStar_Parser_Const.op_Division, (Prims.parse_int "2"),
              (binary_int_op
                 (fun x  -> fun y  -> FStar_BigInt.div_big_int x y)))
              :: uu____8237
             in
          (FStar_Parser_Const.op_Multiply, (Prims.parse_int "2"),
            (binary_int_op
               (fun x  -> fun y  -> FStar_BigInt.mult_big_int x y)))
            :: uu____8220
           in
        (FStar_Parser_Const.op_Subtraction, (Prims.parse_int "2"),
          (binary_int_op (fun x  -> fun y  -> FStar_BigInt.sub_big_int x y)))
          :: uu____8203
         in
      (FStar_Parser_Const.op_Addition, (Prims.parse_int "2"),
        (binary_int_op (fun x  -> fun y  -> FStar_BigInt.add_big_int x y)))
        :: uu____8186
       in
    (FStar_Parser_Const.op_Minus, (Prims.parse_int "1"),
      (unary_int_op (fun x  -> FStar_BigInt.minus_big_int x))) :: uu____8169
     in
  let weak_ops =
    let uu____9328 =
      let uu____9343 =
        FStar_Parser_Const.p2l ["FStar"; "Range"; "prims_to_fstar_range"]  in
      (uu____9343, (Prims.parse_int "1"), prims_to_fstar_range_step)  in
    [uu____9328]  in
  let bounded_arith_ops =
    let bounded_signed_int_types = ["Int8"; "Int16"; "Int32"; "Int64"]  in
    let bounded_unsigned_int_types =
      ["UInt8"; "UInt16"; "UInt32"; "UInt64"; "UInt128"]  in
    let int_as_bounded r int_to_t1 n1 =
      let c =
        FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_int r n1  in
      let int_to_t2 = FStar_Syntax_Syntax.fv_to_tm int_to_t1  in
      let uu____9423 =
        let uu____9428 =
          let uu____9429 = FStar_Syntax_Syntax.as_arg c  in [uu____9429]  in
        FStar_Syntax_Syntax.mk_Tm_app int_to_t2 uu____9428  in
      uu____9423 FStar_Pervasives_Native.None r  in
    let add_sub_mul_v =
      FStar_All.pipe_right
        (FStar_List.append bounded_signed_int_types
           bounded_unsigned_int_types)
        (FStar_List.collect
           (fun m  ->
              let uu____9503 =
                let uu____9518 = FStar_Parser_Const.p2l ["FStar"; m; "add"]
                   in
                (uu____9518, (Prims.parse_int "2"),
                  (binary_op arg_as_bounded_int
                     (fun r  ->
                        fun uu____9540  ->
                          fun uu____9541  ->
                            match (uu____9540, uu____9541) with
                            | ((int_to_t1,x),(uu____9560,y)) ->
                                let uu____9570 = FStar_BigInt.add_big_int x y
                                   in
                                int_as_bounded r int_to_t1 uu____9570)))
                 in
              let uu____9571 =
                let uu____9588 =
                  let uu____9603 = FStar_Parser_Const.p2l ["FStar"; m; "sub"]
                     in
                  (uu____9603, (Prims.parse_int "2"),
                    (binary_op arg_as_bounded_int
                       (fun r  ->
                          fun uu____9625  ->
                            fun uu____9626  ->
                              match (uu____9625, uu____9626) with
                              | ((int_to_t1,x),(uu____9645,y)) ->
                                  let uu____9655 =
                                    FStar_BigInt.sub_big_int x y  in
                                  int_as_bounded r int_to_t1 uu____9655)))
                   in
                let uu____9656 =
                  let uu____9673 =
                    let uu____9688 =
                      FStar_Parser_Const.p2l ["FStar"; m; "mul"]  in
                    (uu____9688, (Prims.parse_int "2"),
                      (binary_op arg_as_bounded_int
                         (fun r  ->
                            fun uu____9710  ->
                              fun uu____9711  ->
                                match (uu____9710, uu____9711) with
                                | ((int_to_t1,x),(uu____9730,y)) ->
                                    let uu____9740 =
                                      FStar_BigInt.mult_big_int x y  in
                                    int_as_bounded r int_to_t1 uu____9740)))
                     in
                  let uu____9741 =
                    let uu____9758 =
                      let uu____9773 =
                        FStar_Parser_Const.p2l ["FStar"; m; "v"]  in
                      (uu____9773, (Prims.parse_int "1"),
                        (unary_op arg_as_bounded_int
                           (fun r  ->
                              fun uu____9791  ->
                                match uu____9791 with
                                | (int_to_t1,x) ->
                                    FStar_Syntax_Embeddings.embed
                                      FStar_Syntax_Embeddings.e_int r x)))
                       in
                    [uu____9758]  in
                  uu____9673 :: uu____9741  in
                uu____9588 :: uu____9656  in
              uu____9503 :: uu____9571))
       in
    let div_mod_unsigned =
      FStar_All.pipe_right bounded_unsigned_int_types
        (FStar_List.collect
           (fun m  ->
              let uu____9921 =
                let uu____9936 = FStar_Parser_Const.p2l ["FStar"; m; "div"]
                   in
                (uu____9936, (Prims.parse_int "2"),
                  (binary_op arg_as_bounded_int
                     (fun r  ->
                        fun uu____9958  ->
                          fun uu____9959  ->
                            match (uu____9958, uu____9959) with
                            | ((int_to_t1,x),(uu____9978,y)) ->
                                let uu____9988 = FStar_BigInt.div_big_int x y
                                   in
                                int_as_bounded r int_to_t1 uu____9988)))
                 in
              let uu____9989 =
                let uu____10006 =
                  let uu____10021 =
                    FStar_Parser_Const.p2l ["FStar"; m; "rem"]  in
                  (uu____10021, (Prims.parse_int "2"),
                    (binary_op arg_as_bounded_int
                       (fun r  ->
                          fun uu____10043  ->
                            fun uu____10044  ->
                              match (uu____10043, uu____10044) with
                              | ((int_to_t1,x),(uu____10063,y)) ->
                                  let uu____10073 =
                                    FStar_BigInt.mod_big_int x y  in
                                  int_as_bounded r int_to_t1 uu____10073)))
                   in
                [uu____10006]  in
              uu____9921 :: uu____9989))
       in
    FStar_List.append add_sub_mul_v div_mod_unsigned  in
  let strong_steps =
    FStar_List.map (as_primitive_step true)
      (FStar_List.append basic_ops bounded_arith_ops)
     in
  let weak_steps = FStar_List.map (as_primitive_step false) weak_ops  in
  FStar_All.pipe_left prim_from_list
    (FStar_List.append strong_steps weak_steps)
  
let (equality_ops : primitive_step FStar_Util.psmap) =
  let interp_prop psc args =
    let r = psc.psc_range  in
    match args with
    | (_typ,uu____10203)::(a1,uu____10205)::(a2,uu____10207)::[] ->
        let uu____10244 = FStar_Syntax_Util.eq_tm a1 a2  in
        (match uu____10244 with
         | FStar_Syntax_Util.Equal  ->
             FStar_Pervasives_Native.Some
               (let uu___305_10248 = FStar_Syntax_Util.t_true  in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___305_10248.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___305_10248.FStar_Syntax_Syntax.vars)
                })
         | FStar_Syntax_Util.NotEqual  ->
             FStar_Pervasives_Native.Some
               (let uu___306_10250 = FStar_Syntax_Util.t_false  in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___306_10250.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___306_10250.FStar_Syntax_Syntax.vars)
                })
         | uu____10251 -> FStar_Pervasives_Native.None)
    | (_typ,uu____10253)::uu____10254::(a1,uu____10256)::(a2,uu____10258)::[]
        ->
        let uu____10307 = FStar_Syntax_Util.eq_tm a1 a2  in
        (match uu____10307 with
         | FStar_Syntax_Util.Equal  ->
             FStar_Pervasives_Native.Some
               (let uu___305_10311 = FStar_Syntax_Util.t_true  in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___305_10311.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___305_10311.FStar_Syntax_Syntax.vars)
                })
         | FStar_Syntax_Util.NotEqual  ->
             FStar_Pervasives_Native.Some
               (let uu___306_10313 = FStar_Syntax_Util.t_false  in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___306_10313.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___306_10313.FStar_Syntax_Syntax.vars)
                })
         | uu____10314 -> FStar_Pervasives_Native.None)
    | uu____10315 -> failwith "Unexpected number of arguments"  in
  let propositional_equality =
    {
      name = FStar_Parser_Const.eq2_lid;
      arity = (Prims.parse_int "3");
      auto_reflect = FStar_Pervasives_Native.None;
      strong_reduction_ok = true;
      requires_binder_substitution = false;
      interpretation = interp_prop
    }  in
  let hetero_propositional_equality =
    {
      name = FStar_Parser_Const.eq3_lid;
      arity = (Prims.parse_int "4");
      auto_reflect = FStar_Pervasives_Native.None;
      strong_reduction_ok = true;
      requires_binder_substitution = false;
      interpretation = interp_prop
    }  in
  prim_from_list [propositional_equality; hetero_propositional_equality] 
let (unembed_binder_knot :
  FStar_Syntax_Syntax.binder FStar_Syntax_Embeddings.embedding
    FStar_Pervasives_Native.option FStar_ST.ref)
  = FStar_Util.mk_ref FStar_Pervasives_Native.None 
let (unembed_binder :
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option)
  =
  fun t  ->
    let uu____10369 = FStar_ST.op_Bang unembed_binder_knot  in
    match uu____10369 with
    | FStar_Pervasives_Native.Some e -> FStar_Syntax_Embeddings.unembed e t
    | FStar_Pervasives_Native.None  ->
        (FStar_Errors.log_issue t.FStar_Syntax_Syntax.pos
           (FStar_Errors.Warning_UnembedBinderKnot,
             "unembed_binder_knot is unset!");
         FStar_Pervasives_Native.None)
  
let mk_psc_subst :
  'Auu____10421 .
    cfg ->
      ((FStar_Syntax_Syntax.bv,'Auu____10421) FStar_Pervasives_Native.tuple2
         FStar_Pervasives_Native.option,closure)
        FStar_Pervasives_Native.tuple2 Prims.list ->
        FStar_Syntax_Syntax.subst_elt Prims.list
  =
  fun cfg  ->
    fun env  ->
      FStar_List.fold_right
        (fun uu____10483  ->
           fun subst1  ->
             match uu____10483 with
             | (binder_opt,closure) ->
                 (match (binder_opt, closure) with
                  | (FStar_Pervasives_Native.Some b,Clos
                     (env1,term,uu____10524,uu____10525)) ->
                      let uu____10584 = b  in
                      (match uu____10584 with
                       | (bv,uu____10592) ->
                           let uu____10593 =
                             let uu____10594 =
                               FStar_Syntax_Util.is_constructed_typ
                                 bv.FStar_Syntax_Syntax.sort
                                 FStar_Parser_Const.binder_lid
                                in
                             Prims.op_Negation uu____10594  in
                           if uu____10593
                           then subst1
                           else
                             (let term1 = closure_as_term cfg env1 term  in
                              let uu____10599 = unembed_binder term1  in
                              match uu____10599 with
                              | FStar_Pervasives_Native.None  -> subst1
                              | FStar_Pervasives_Native.Some x ->
                                  let b1 =
                                    let uu____10606 =
                                      let uu___307_10607 = bv  in
                                      let uu____10608 =
                                        FStar_Syntax_Subst.subst subst1
                                          (FStar_Pervasives_Native.fst x).FStar_Syntax_Syntax.sort
                                         in
                                      {
                                        FStar_Syntax_Syntax.ppname =
                                          (uu___307_10607.FStar_Syntax_Syntax.ppname);
                                        FStar_Syntax_Syntax.index =
                                          (uu___307_10607.FStar_Syntax_Syntax.index);
                                        FStar_Syntax_Syntax.sort =
                                          uu____10608
                                      }  in
                                    FStar_Syntax_Syntax.freshen_bv
                                      uu____10606
                                     in
                                  let b_for_x =
                                    let uu____10612 =
                                      let uu____10619 =
                                        FStar_Syntax_Syntax.bv_to_name b1  in
                                      ((FStar_Pervasives_Native.fst x),
                                        uu____10619)
                                       in
                                    FStar_Syntax_Syntax.NT uu____10612  in
                                  let subst2 =
                                    FStar_List.filter
                                      (fun uu___247_10633  ->
                                         match uu___247_10633 with
                                         | FStar_Syntax_Syntax.NT
                                             (uu____10634,{
                                                            FStar_Syntax_Syntax.n
                                                              =
                                                              FStar_Syntax_Syntax.Tm_name
                                                              b';
                                                            FStar_Syntax_Syntax.pos
                                                              = uu____10636;
                                                            FStar_Syntax_Syntax.vars
                                                              = uu____10637;_})
                                             ->
                                             let uu____10642 =
                                               FStar_Ident.ident_equals
                                                 b1.FStar_Syntax_Syntax.ppname
                                                 b'.FStar_Syntax_Syntax.ppname
                                                in
                                             Prims.op_Negation uu____10642
                                         | uu____10643 -> true) subst1
                                     in
                                  b_for_x :: subst2))
                  | uu____10644 -> subst1)) env []
  
let reduce_primops :
  'Auu____10667 'Auu____10668 .
    cfg ->
      ((FStar_Syntax_Syntax.bv,'Auu____10667) FStar_Pervasives_Native.tuple2
         FStar_Pervasives_Native.option,closure)
        FStar_Pervasives_Native.tuple2 Prims.list ->
        'Auu____10668 ->
          FStar_Syntax_Syntax.term ->
            FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun tm  ->
          if Prims.op_Negation (cfg.steps).primops
          then tm
          else
            (let uu____10716 = FStar_Syntax_Util.head_and_args tm  in
             match uu____10716 with
             | (head1,args) ->
                 let uu____10755 =
                   let uu____10756 = FStar_Syntax_Util.un_uinst head1  in
                   uu____10756.FStar_Syntax_Syntax.n  in
                 (match uu____10755 with
                  | FStar_Syntax_Syntax.Tm_fvar fv ->
                      let uu____10762 = find_prim_step cfg fv  in
                      (match uu____10762 with
                       | FStar_Pervasives_Native.Some prim_step when
                           prim_step.strong_reduction_ok ||
                             (Prims.op_Negation cfg.strong)
                           ->
                           let l = FStar_List.length args  in
                           if l < prim_step.arity
                           then
                             (log_primops cfg
                                (fun uu____10788  ->
                                   let uu____10789 =
                                     FStar_Syntax_Print.lid_to_string
                                       prim_step.name
                                      in
                                   let uu____10790 =
                                     FStar_Util.string_of_int l  in
                                   let uu____10797 =
                                     FStar_Util.string_of_int prim_step.arity
                                      in
                                   FStar_Util.print3
                                     "primop: found partially applied %s (%s/%s args)\n"
                                     uu____10789 uu____10790 uu____10797);
                              tm)
                           else
                             (let uu____10799 =
                                if l = prim_step.arity
                                then (args, [])
                                else FStar_List.splitAt prim_step.arity args
                                 in
                              match uu____10799 with
                              | (args_1,args_2) ->
                                  (log_primops cfg
                                     (fun uu____10912  ->
                                        let uu____10913 =
                                          FStar_Syntax_Print.term_to_string
                                            tm
                                           in
                                        FStar_Util.print1
                                          "primop: trying to reduce <%s>\n"
                                          uu____10913);
                                   (let psc =
                                      {
                                        psc_range =
                                          (head1.FStar_Syntax_Syntax.pos);
                                        psc_subst =
                                          (fun uu____10916  ->
                                             if
                                               prim_step.requires_binder_substitution
                                             then mk_psc_subst cfg env
                                             else [])
                                      }  in
                                    let uu____10918 =
                                      prim_step.interpretation psc args_1  in
                                    match uu____10918 with
                                    | FStar_Pervasives_Native.None  ->
                                        (log_primops cfg
                                           (fun uu____10926  ->
                                              let uu____10927 =
                                                FStar_Syntax_Print.term_to_string
                                                  tm
                                                 in
                                              FStar_Util.print1
                                                "primop: <%s> did not reduce\n"
                                                uu____10927);
                                         tm)
                                    | FStar_Pervasives_Native.Some reduced ->
                                        (log_primops cfg
                                           (fun uu____10933  ->
                                              let uu____10934 =
                                                FStar_Syntax_Print.term_to_string
                                                  tm
                                                 in
                                              let uu____10935 =
                                                FStar_Syntax_Print.term_to_string
                                                  reduced
                                                 in
                                              FStar_Util.print2
                                                "primop: <%s> reduced to <%s>\n"
                                                uu____10934 uu____10935);
                                         FStar_Syntax_Util.mk_app reduced
                                           args_2))))
                       | FStar_Pervasives_Native.Some uu____10936 ->
                           (log_primops cfg
                              (fun uu____10940  ->
                                 let uu____10941 =
                                   FStar_Syntax_Print.term_to_string tm  in
                                 FStar_Util.print1
                                   "primop: not reducing <%s> since we're doing strong reduction\n"
                                   uu____10941);
                            tm)
                       | FStar_Pervasives_Native.None  -> tm)
                  | FStar_Syntax_Syntax.Tm_constant
                      (FStar_Const.Const_range_of ) when
                      Prims.op_Negation cfg.strong ->
                      (log_primops cfg
                         (fun uu____10945  ->
                            let uu____10946 =
                              FStar_Syntax_Print.term_to_string tm  in
                            FStar_Util.print1 "primop: reducing <%s>\n"
                              uu____10946);
                       (match args with
                        | (a1,uu____10950)::[] ->
                            FStar_Syntax_Embeddings.embed
                              FStar_Syntax_Embeddings.e_range
                              tm.FStar_Syntax_Syntax.pos
                              a1.FStar_Syntax_Syntax.pos
                        | uu____10967 -> tm))
                  | FStar_Syntax_Syntax.Tm_constant
                      (FStar_Const.Const_set_range_of ) when
                      Prims.op_Negation cfg.strong ->
                      (log_primops cfg
                         (fun uu____10979  ->
                            let uu____10980 =
                              FStar_Syntax_Print.term_to_string tm  in
                            FStar_Util.print1 "primop: reducing <%s>\n"
                              uu____10980);
                       (match args with
                        | (t,uu____10984)::(r,uu____10986)::[] ->
                            let uu____11013 =
                              FStar_Syntax_Embeddings.try_unembed
                                FStar_Syntax_Embeddings.e_range r
                               in
                            (match uu____11013 with
                             | FStar_Pervasives_Native.Some rng ->
                                 FStar_Syntax_Subst.set_use_range rng t
                             | FStar_Pervasives_Native.None  -> tm)
                        | uu____11019 -> tm))
                  | uu____11028 -> tm))
  
let reduce_equality :
  'Auu____11039 'Auu____11040 .
    cfg ->
      ((FStar_Syntax_Syntax.bv,'Auu____11039) FStar_Pervasives_Native.tuple2
         FStar_Pervasives_Native.option,closure)
        FStar_Pervasives_Native.tuple2 Prims.list ->
        'Auu____11040 ->
          FStar_Syntax_Syntax.term ->
            FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax
  =
  fun cfg  ->
    fun tm  ->
      reduce_primops
        (let uu___308_11086 = cfg  in
         {
           steps =
             (let uu___309_11089 = default_steps  in
              {
                beta = (uu___309_11089.beta);
                iota = (uu___309_11089.iota);
                zeta = (uu___309_11089.zeta);
                weak = (uu___309_11089.weak);
                hnf = (uu___309_11089.hnf);
                primops = true;
                do_not_unfold_pure_lets =
                  (uu___309_11089.do_not_unfold_pure_lets);
                unfold_until = (uu___309_11089.unfold_until);
                unfold_only = (uu___309_11089.unfold_only);
                unfold_fully = (uu___309_11089.unfold_fully);
                unfold_attr = (uu___309_11089.unfold_attr);
                unfold_tac = (uu___309_11089.unfold_tac);
                pure_subterms_within_computations =
                  (uu___309_11089.pure_subterms_within_computations);
                simplify = (uu___309_11089.simplify);
                erase_universes = (uu___309_11089.erase_universes);
                allow_unbound_universes =
                  (uu___309_11089.allow_unbound_universes);
                reify_ = (uu___309_11089.reify_);
                compress_uvars = (uu___309_11089.compress_uvars);
                no_full_norm = (uu___309_11089.no_full_norm);
                check_no_uvars = (uu___309_11089.check_no_uvars);
                unmeta = (uu___309_11089.unmeta);
                unascribe = (uu___309_11089.unascribe);
                in_full_norm_request = (uu___309_11089.in_full_norm_request);
                weakly_reduce_scrutinee =
                  (uu___309_11089.weakly_reduce_scrutinee)
              });
           tcenv = (uu___308_11086.tcenv);
           debug = (uu___308_11086.debug);
           delta_level = (uu___308_11086.delta_level);
           primitive_steps = equality_ops;
           strong = (uu___308_11086.strong);
           memoize_lazy = (uu___308_11086.memoize_lazy);
           normalize_pure_lets = (uu___308_11086.normalize_pure_lets)
         }) tm
  
let is_norm_request :
  'Auu____11096 .
    FStar_Syntax_Syntax.term -> 'Auu____11096 Prims.list -> Prims.bool
  =
  fun hd1  ->
    fun args  ->
      let uu____11111 =
        let uu____11118 =
          let uu____11119 = FStar_Syntax_Util.un_uinst hd1  in
          uu____11119.FStar_Syntax_Syntax.n  in
        (uu____11118, args)  in
      match uu____11111 with
      | (FStar_Syntax_Syntax.Tm_fvar fv,uu____11125::uu____11126::[]) ->
          FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.normalize_term
      | (FStar_Syntax_Syntax.Tm_fvar fv,uu____11130::[]) ->
          FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.normalize
      | (FStar_Syntax_Syntax.Tm_fvar fv,steps::uu____11135::uu____11136::[])
          -> FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.norm
      | uu____11139 -> false
  
let (tr_norm_step : FStar_Syntax_Embeddings.norm_step -> step Prims.list) =
  fun uu___248_11152  ->
    match uu___248_11152 with
    | FStar_Syntax_Embeddings.Zeta  -> [Zeta]
    | FStar_Syntax_Embeddings.Iota  -> [Iota]
    | FStar_Syntax_Embeddings.Delta  ->
        [UnfoldUntil FStar_Syntax_Syntax.delta_constant]
    | FStar_Syntax_Embeddings.Simpl  -> [Simplify]
    | FStar_Syntax_Embeddings.Weak  -> [Weak]
    | FStar_Syntax_Embeddings.HNF  -> [HNF]
    | FStar_Syntax_Embeddings.Primops  -> [Primops]
    | FStar_Syntax_Embeddings.UnfoldOnly names1 ->
        let uu____11158 =
          let uu____11161 =
            let uu____11162 = FStar_List.map FStar_Ident.lid_of_str names1
               in
            UnfoldOnly uu____11162  in
          [uu____11161]  in
        (UnfoldUntil FStar_Syntax_Syntax.delta_constant) :: uu____11158
    | FStar_Syntax_Embeddings.UnfoldFully names1 ->
        let uu____11168 =
          let uu____11171 =
            let uu____11172 = FStar_List.map FStar_Ident.lid_of_str names1
               in
            UnfoldFully uu____11172  in
          [uu____11171]  in
        (UnfoldUntil FStar_Syntax_Syntax.delta_constant) :: uu____11168
    | FStar_Syntax_Embeddings.UnfoldAttr t ->
        [UnfoldUntil FStar_Syntax_Syntax.delta_constant; UnfoldAttr t]
  
let (tr_norm_steps :
  FStar_Syntax_Embeddings.norm_step Prims.list -> step Prims.list) =
  fun s  -> FStar_List.concatMap tr_norm_step s 
let get_norm_request :
  'Auu____11195 .
    cfg ->
      (FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) ->
        (FStar_Syntax_Syntax.term,'Auu____11195)
          FStar_Pervasives_Native.tuple2 Prims.list ->
          (step Prims.list,FStar_Syntax_Syntax.term)
            FStar_Pervasives_Native.tuple2 FStar_Pervasives_Native.option
  =
  fun cfg  ->
    fun full_norm  ->
      fun args  ->
        let parse_steps s =
          let uu____11246 =
            let uu____11251 =
              FStar_Syntax_Embeddings.e_list
                FStar_Syntax_Embeddings.e_norm_step
               in
            FStar_Syntax_Embeddings.try_unembed uu____11251 s  in
          match uu____11246 with
          | FStar_Pervasives_Native.Some steps ->
              let uu____11267 = tr_norm_steps steps  in
              FStar_Pervasives_Native.Some uu____11267
          | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None  in
        let inherited_steps =
          FStar_List.append
            (if (cfg.steps).erase_universes then [EraseUniverses] else [])
            (if (cfg.steps).allow_unbound_universes
             then [AllowUnboundUniverses]
             else [])
           in
        match args with
        | uu____11293::(tm,uu____11295)::[] ->
            let s =
              [Beta;
              Zeta;
              Iota;
              Primops;
              UnfoldUntil FStar_Syntax_Syntax.delta_constant;
              Reify]  in
            FStar_Pervasives_Native.Some
              ((FStar_List.append inherited_steps s), tm)
        | (tm,uu____11324)::[] ->
            let s =
              [Beta;
              Zeta;
              Iota;
              Primops;
              UnfoldUntil FStar_Syntax_Syntax.delta_constant;
              Reify]  in
            FStar_Pervasives_Native.Some
              ((FStar_List.append inherited_steps s), tm)
        | (steps,uu____11345)::uu____11346::(tm,uu____11348)::[] ->
            let add_exclude s z =
              if FStar_List.contains z s then s else (Exclude z) :: s  in
            let uu____11389 =
              let uu____11394 = full_norm steps  in parse_steps uu____11394
               in
            (match uu____11389 with
             | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
             | FStar_Pervasives_Native.Some s ->
                 let s1 = Beta :: s  in
                 let s2 = add_exclude s1 Zeta  in
                 let s3 = add_exclude s2 Iota  in
                 FStar_Pervasives_Native.Some
                   ((FStar_List.append inherited_steps s3), tm))
        | uu____11433 -> FStar_Pervasives_Native.None
  
let (is_reify_head : stack_elt Prims.list -> Prims.bool) =
  fun uu___249_11452  ->
    match uu___249_11452 with
    | (App
        (uu____11455,{
                       FStar_Syntax_Syntax.n =
                         FStar_Syntax_Syntax.Tm_constant
                         (FStar_Const.Const_reify );
                       FStar_Syntax_Syntax.pos = uu____11456;
                       FStar_Syntax_Syntax.vars = uu____11457;_},uu____11458,uu____11459))::uu____11460
        -> true
    | uu____11465 -> false
  
let firstn :
  'Auu____11474 .
    Prims.int ->
      'Auu____11474 Prims.list ->
        ('Auu____11474 Prims.list,'Auu____11474 Prims.list)
          FStar_Pervasives_Native.tuple2
  =
  fun k  ->
    fun l  ->
      if (FStar_List.length l) < k then (l, []) else FStar_Util.first_N k l
  
let (should_reify : cfg -> stack_elt Prims.list -> Prims.bool) =
  fun cfg  ->
    fun stack  ->
      match stack with
      | (App
          (uu____11516,{
                         FStar_Syntax_Syntax.n =
                           FStar_Syntax_Syntax.Tm_constant
                           (FStar_Const.Const_reify );
                         FStar_Syntax_Syntax.pos = uu____11517;
                         FStar_Syntax_Syntax.vars = uu____11518;_},uu____11519,uu____11520))::uu____11521
          -> (cfg.steps).reify_
      | uu____11526 -> false
  
let rec (maybe_weakly_reduced :
  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax -> Prims.bool) =
  fun tm  ->
    let aux_comp c =
      match c.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.GTotal (t,uu____11549) -> maybe_weakly_reduced t
      | FStar_Syntax_Syntax.Total (t,uu____11559) -> maybe_weakly_reduced t
      | FStar_Syntax_Syntax.Comp ct ->
          (maybe_weakly_reduced ct.FStar_Syntax_Syntax.result_typ) ||
            (FStar_Util.for_some
               (fun uu____11578  ->
                  match uu____11578 with
                  | (a,uu____11586) -> maybe_weakly_reduced a)
               ct.FStar_Syntax_Syntax.effect_args)
       in
    let t = FStar_Syntax_Subst.compress tm  in
    match t.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_delayed uu____11592 -> failwith "Impossible"
    | FStar_Syntax_Syntax.Tm_name uu____11615 -> false
    | FStar_Syntax_Syntax.Tm_uvar uu____11616 -> false
    | FStar_Syntax_Syntax.Tm_type uu____11629 -> false
    | FStar_Syntax_Syntax.Tm_bvar uu____11630 -> false
    | FStar_Syntax_Syntax.Tm_fvar uu____11631 -> false
    | FStar_Syntax_Syntax.Tm_constant uu____11632 -> false
    | FStar_Syntax_Syntax.Tm_lazy uu____11633 -> false
    | FStar_Syntax_Syntax.Tm_unknown  -> false
    | FStar_Syntax_Syntax.Tm_uinst uu____11634 -> false
    | FStar_Syntax_Syntax.Tm_quoted uu____11641 -> false
    | FStar_Syntax_Syntax.Tm_let uu____11648 -> true
    | FStar_Syntax_Syntax.Tm_abs uu____11661 -> true
    | FStar_Syntax_Syntax.Tm_arrow uu____11678 -> true
    | FStar_Syntax_Syntax.Tm_refine uu____11691 -> true
    | FStar_Syntax_Syntax.Tm_match uu____11698 -> true
    | FStar_Syntax_Syntax.Tm_app (t1,args) ->
        (maybe_weakly_reduced t1) ||
          (FStar_All.pipe_right args
             (FStar_Util.for_some
                (fun uu____11760  ->
                   match uu____11760 with
                   | (a,uu____11768) -> maybe_weakly_reduced a)))
    | FStar_Syntax_Syntax.Tm_ascribed (t1,asc,uu____11775) ->
        ((maybe_weakly_reduced t1) ||
           (match FStar_Pervasives_Native.fst asc with
            | FStar_Util.Inl t2 -> maybe_weakly_reduced t2
            | FStar_Util.Inr c2 -> aux_comp c2))
          ||
          ((match FStar_Pervasives_Native.snd asc with
            | FStar_Pervasives_Native.None  -> false
            | FStar_Pervasives_Native.Some tac -> maybe_weakly_reduced tac))
    | FStar_Syntax_Syntax.Tm_meta (t1,m) ->
        (maybe_weakly_reduced t1) ||
          ((match m with
            | FStar_Syntax_Syntax.Meta_pattern args ->
                FStar_Util.for_some
                  (FStar_Util.for_some
                     (fun uu____11897  ->
                        match uu____11897 with
                        | (a,uu____11905) -> maybe_weakly_reduced a)) args
            | FStar_Syntax_Syntax.Meta_monadic_lift
                (uu____11910,uu____11911,t') -> maybe_weakly_reduced t'
            | FStar_Syntax_Syntax.Meta_monadic (uu____11917,t') ->
                maybe_weakly_reduced t'
            | FStar_Syntax_Syntax.Meta_labeled uu____11923 -> false
            | FStar_Syntax_Syntax.Meta_desugared uu____11930 -> false
            | FStar_Syntax_Syntax.Meta_named uu____11931 -> false))
  
type should_unfold_res =
  | Should_unfold_no 
  | Should_unfold_yes 
  | Should_unfold_fully 
  | Should_unfold_reify 
let (uu___is_Should_unfold_no : should_unfold_res -> Prims.bool) =
  fun projectee  ->
    match projectee with | Should_unfold_no  -> true | uu____11937 -> false
  
let (uu___is_Should_unfold_yes : should_unfold_res -> Prims.bool) =
  fun projectee  ->
    match projectee with | Should_unfold_yes  -> true | uu____11943 -> false
  
let (uu___is_Should_unfold_fully : should_unfold_res -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | Should_unfold_fully  -> true
    | uu____11949 -> false
  
let (uu___is_Should_unfold_reify : should_unfold_res -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | Should_unfold_reify  -> true
    | uu____11955 -> false
  
let (should_unfold :
  cfg ->
    (cfg -> Prims.bool) ->
      FStar_Syntax_Syntax.fv ->
        FStar_TypeChecker_Env.qninfo -> should_unfold_res)
  =
  fun cfg  ->
    fun should_reify1  ->
      fun fv  ->
        fun qninfo  ->
          let attrs =
            let uu____11984 = FStar_TypeChecker_Env.attrs_of_qninfo qninfo
               in
            match uu____11984 with
            | FStar_Pervasives_Native.None  -> []
            | FStar_Pervasives_Native.Some ats -> ats  in
          let yes = (true, false, false)  in
          let no = (false, false, false)  in
          let fully = (true, true, false)  in
          let reif = (true, false, true)  in
          let yesno b = if b then yes else no  in
          let fullyno b = if b then fully else no  in
          let comb_or l =
            FStar_List.fold_right
              (fun uu____12112  ->
                 fun uu____12113  ->
                   match (uu____12112, uu____12113) with
                   | ((a,b,c),(x,y,z)) -> ((a || x), (b || y), (c || z))) l
              (false, false, false)
             in
          let string_of_res uu____12173 =
            match uu____12173 with
            | (x,y,z) ->
                let uu____12183 = FStar_Util.string_of_bool x  in
                let uu____12184 = FStar_Util.string_of_bool y  in
                let uu____12185 = FStar_Util.string_of_bool z  in
                FStar_Util.format3 "(%s,%s,%s)" uu____12183 uu____12184
                  uu____12185
             in
          let res =
            match (qninfo, ((cfg.steps).unfold_only),
                    ((cfg.steps).unfold_fully), ((cfg.steps).unfold_attr))
            with
            | uu____12231 when FStar_TypeChecker_Env.qninfo_is_action qninfo
                ->
                let b = should_reify1 cfg  in
                (log_unfolding cfg
                   (fun uu____12277  ->
                      let uu____12278 = FStar_Syntax_Print.fv_to_string fv
                         in
                      let uu____12279 = FStar_Util.string_of_bool b  in
                      FStar_Util.print2
                        " >> For DM4F action %s, should_reify = %s\n"
                        uu____12278 uu____12279);
                 if b then reif else no)
            | uu____12287 when
                let uu____12328 = find_prim_step cfg fv  in
                FStar_Option.isSome uu____12328 -> no
            | (FStar_Pervasives_Native.Some
               (FStar_Util.Inr
                ({
                   FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_let
                     ((is_rec,uu____12332),uu____12333);
                   FStar_Syntax_Syntax.sigrng = uu____12334;
                   FStar_Syntax_Syntax.sigquals = qs;
                   FStar_Syntax_Syntax.sigmeta = uu____12336;
                   FStar_Syntax_Syntax.sigattrs = uu____12337;_},uu____12338),uu____12339),uu____12340,uu____12341,uu____12342)
                when
                FStar_List.contains FStar_Syntax_Syntax.HasMaskedEffect qs ->
                no
            | (uu____12445,uu____12446,uu____12447,uu____12448) when
                (cfg.steps).unfold_tac &&
                  (FStar_Util.for_some
                     (FStar_Syntax_Util.attr_eq
                        FStar_Syntax_Util.tac_opaque_attr) attrs)
                -> no
            | (FStar_Pervasives_Native.Some
               (FStar_Util.Inr
                ({
                   FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_let
                     ((is_rec,uu____12514),uu____12515);
                   FStar_Syntax_Syntax.sigrng = uu____12516;
                   FStar_Syntax_Syntax.sigquals = qs;
                   FStar_Syntax_Syntax.sigmeta = uu____12518;
                   FStar_Syntax_Syntax.sigattrs = uu____12519;_},uu____12520),uu____12521),uu____12522,uu____12523,uu____12524)
                when is_rec && (Prims.op_Negation (cfg.steps).zeta) -> no
            | (uu____12627,FStar_Pervasives_Native.Some
               uu____12628,uu____12629,uu____12630) ->
                (log_unfolding cfg
                   (fun uu____12698  ->
                      let uu____12699 = FStar_Syntax_Print.fv_to_string fv
                         in
                      FStar_Util.print1
                        " >> Reached a %s with selective unfolding\n"
                        uu____12699);
                 (let uu____12700 =
                    let uu____12709 =
                      match (cfg.steps).unfold_only with
                      | FStar_Pervasives_Native.None  -> no
                      | FStar_Pervasives_Native.Some lids ->
                          let uu____12729 =
                            FStar_Util.for_some
                              (FStar_Syntax_Syntax.fv_eq_lid fv) lids
                             in
                          FStar_All.pipe_left yesno uu____12729
                       in
                    let uu____12736 =
                      let uu____12745 =
                        match (cfg.steps).unfold_attr with
                        | FStar_Pervasives_Native.None  -> no
                        | FStar_Pervasives_Native.Some ats ->
                            let uu____12765 =
                              FStar_Util.for_some
                                (fun at  ->
                                   FStar_Util.for_some
                                     (FStar_Syntax_Util.attr_eq at) ats)
                                attrs
                               in
                            FStar_All.pipe_left yesno uu____12765
                         in
                      let uu____12774 =
                        let uu____12783 =
                          match (cfg.steps).unfold_fully with
                          | FStar_Pervasives_Native.None  -> no
                          | FStar_Pervasives_Native.Some lids ->
                              let uu____12803 =
                                FStar_Util.for_some
                                  (FStar_Syntax_Syntax.fv_eq_lid fv) lids
                                 in
                              FStar_All.pipe_left fullyno uu____12803
                           in
                        [uu____12783]  in
                      uu____12745 :: uu____12774  in
                    uu____12709 :: uu____12736  in
                  comb_or uu____12700))
            | (uu____12834,uu____12835,FStar_Pervasives_Native.Some
               uu____12836,uu____12837) ->
                (log_unfolding cfg
                   (fun uu____12905  ->
                      let uu____12906 = FStar_Syntax_Print.fv_to_string fv
                         in
                      FStar_Util.print1
                        " >> Reached a %s with selective unfolding\n"
                        uu____12906);
                 (let uu____12907 =
                    let uu____12916 =
                      match (cfg.steps).unfold_only with
                      | FStar_Pervasives_Native.None  -> no
                      | FStar_Pervasives_Native.Some lids ->
                          let uu____12936 =
                            FStar_Util.for_some
                              (FStar_Syntax_Syntax.fv_eq_lid fv) lids
                             in
                          FStar_All.pipe_left yesno uu____12936
                       in
                    let uu____12943 =
                      let uu____12952 =
                        match (cfg.steps).unfold_attr with
                        | FStar_Pervasives_Native.None  -> no
                        | FStar_Pervasives_Native.Some ats ->
                            let uu____12972 =
                              FStar_Util.for_some
                                (fun at  ->
                                   FStar_Util.for_some
                                     (FStar_Syntax_Util.attr_eq at) ats)
                                attrs
                               in
                            FStar_All.pipe_left yesno uu____12972
                         in
                      let uu____12981 =
                        let uu____12990 =
                          match (cfg.steps).unfold_fully with
                          | FStar_Pervasives_Native.None  -> no
                          | FStar_Pervasives_Native.Some lids ->
                              let uu____13010 =
                                FStar_Util.for_some
                                  (FStar_Syntax_Syntax.fv_eq_lid fv) lids
                                 in
                              FStar_All.pipe_left fullyno uu____13010
                           in
                        [uu____12990]  in
                      uu____12952 :: uu____12981  in
                    uu____12916 :: uu____12943  in
                  comb_or uu____12907))
            | (uu____13041,uu____13042,uu____13043,FStar_Pervasives_Native.Some
               uu____13044) ->
                (log_unfolding cfg
                   (fun uu____13112  ->
                      let uu____13113 = FStar_Syntax_Print.fv_to_string fv
                         in
                      FStar_Util.print1
                        " >> Reached a %s with selective unfolding\n"
                        uu____13113);
                 (let uu____13114 =
                    let uu____13123 =
                      match (cfg.steps).unfold_only with
                      | FStar_Pervasives_Native.None  -> no
                      | FStar_Pervasives_Native.Some lids ->
                          let uu____13143 =
                            FStar_Util.for_some
                              (FStar_Syntax_Syntax.fv_eq_lid fv) lids
                             in
                          FStar_All.pipe_left yesno uu____13143
                       in
                    let uu____13150 =
                      let uu____13159 =
                        match (cfg.steps).unfold_attr with
                        | FStar_Pervasives_Native.None  -> no
                        | FStar_Pervasives_Native.Some ats ->
                            let uu____13179 =
                              FStar_Util.for_some
                                (fun at  ->
                                   FStar_Util.for_some
                                     (FStar_Syntax_Util.attr_eq at) ats)
                                attrs
                               in
                            FStar_All.pipe_left yesno uu____13179
                         in
                      let uu____13188 =
                        let uu____13197 =
                          match (cfg.steps).unfold_fully with
                          | FStar_Pervasives_Native.None  -> no
                          | FStar_Pervasives_Native.Some lids ->
                              let uu____13217 =
                                FStar_Util.for_some
                                  (FStar_Syntax_Syntax.fv_eq_lid fv) lids
                                 in
                              FStar_All.pipe_left fullyno uu____13217
                           in
                        [uu____13197]  in
                      uu____13159 :: uu____13188  in
                    uu____13123 :: uu____13150  in
                  comb_or uu____13114))
            | uu____13248 ->
                (log_unfolding cfg
                   (fun uu____13294  ->
                      let uu____13295 = FStar_Syntax_Print.fv_to_string fv
                         in
                      let uu____13296 =
                        FStar_Syntax_Print.delta_depth_to_string
                          fv.FStar_Syntax_Syntax.fv_delta
                         in
                      let uu____13297 =
                        FStar_Common.string_of_list
                          FStar_TypeChecker_Env.string_of_delta_level
                          cfg.delta_level
                         in
                      FStar_Util.print3
                        " >> Reached a %s with delta_depth = %s\n >> Our delta_level is %s\n"
                        uu____13295 uu____13296 uu____13297);
                 (let uu____13298 =
                    FStar_All.pipe_right cfg.delta_level
                      (FStar_Util.for_some
                         (fun uu___250_13302  ->
                            match uu___250_13302 with
                            | FStar_TypeChecker_Env.UnfoldTac  -> false
                            | FStar_TypeChecker_Env.NoDelta  -> false
                            | FStar_TypeChecker_Env.Inlining  -> true
                            | FStar_TypeChecker_Env.Eager_unfolding_only  ->
                                true
                            | FStar_TypeChecker_Env.Unfold l ->
                                FStar_TypeChecker_Common.delta_depth_greater_than
                                  fv.FStar_Syntax_Syntax.fv_delta l))
                     in
                  FStar_All.pipe_left yesno uu____13298))
             in
          log_unfolding cfg
            (fun uu____13315  ->
               let uu____13316 = FStar_Syntax_Print.fv_to_string fv  in
               let uu____13317 =
                 let uu____13318 = FStar_Syntax_Syntax.range_of_fv fv  in
                 FStar_Range.string_of_range uu____13318  in
               let uu____13319 = string_of_res res  in
               FStar_Util.print3 " >> For %s (%s), unfolding res = %s\n"
                 uu____13316 uu____13317 uu____13319);
          (match res with
           | (false ,uu____13320,uu____13321) -> Should_unfold_no
           | (true ,false ,false ) -> Should_unfold_yes
           | (true ,true ,false ) -> Should_unfold_fully
           | (true ,false ,true ) -> Should_unfold_reify
           | uu____13322 ->
               let uu____13329 =
                 let uu____13330 = string_of_res res  in
                 FStar_Util.format1 "Unexpected unfolding result: %s"
                   uu____13330
                  in
               FStar_All.pipe_left failwith uu____13329)
  
let decide_unfolding :
  'Auu____13347 'Auu____13348 .
    cfg ->
      'Auu____13347 ->
        stack_elt Prims.list ->
          'Auu____13348 ->
            FStar_Syntax_Syntax.fv ->
              FStar_TypeChecker_Env.qninfo ->
                (cfg,stack_elt Prims.list) FStar_Pervasives_Native.tuple2
                  FStar_Pervasives_Native.option
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun rng  ->
          fun fv  ->
            fun qninfo  ->
              let res =
                should_unfold cfg (fun cfg1  -> should_reify cfg1 stack) fv
                  qninfo
                 in
              match res with
              | Should_unfold_no  -> FStar_Pervasives_Native.None
              | Should_unfold_yes  ->
                  FStar_Pervasives_Native.Some (cfg, stack)
              | Should_unfold_fully  ->
                  let cfg' =
                    let uu___310_13417 = cfg  in
                    {
                      steps =
                        (let uu___311_13420 = cfg.steps  in
                         {
                           beta = (uu___311_13420.beta);
                           iota = (uu___311_13420.iota);
                           zeta = (uu___311_13420.zeta);
                           weak = (uu___311_13420.weak);
                           hnf = (uu___311_13420.hnf);
                           primops = (uu___311_13420.primops);
                           do_not_unfold_pure_lets =
                             (uu___311_13420.do_not_unfold_pure_lets);
                           unfold_until =
                             (FStar_Pervasives_Native.Some
                                FStar_Syntax_Syntax.delta_constant);
                           unfold_only = FStar_Pervasives_Native.None;
                           unfold_fully = FStar_Pervasives_Native.None;
                           unfold_attr = FStar_Pervasives_Native.None;
                           unfold_tac = (uu___311_13420.unfold_tac);
                           pure_subterms_within_computations =
                             (uu___311_13420.pure_subterms_within_computations);
                           simplify = (uu___311_13420.simplify);
                           erase_universes = (uu___311_13420.erase_universes);
                           allow_unbound_universes =
                             (uu___311_13420.allow_unbound_universes);
                           reify_ = (uu___311_13420.reify_);
                           compress_uvars = (uu___311_13420.compress_uvars);
                           no_full_norm = (uu___311_13420.no_full_norm);
                           check_no_uvars = (uu___311_13420.check_no_uvars);
                           unmeta = (uu___311_13420.unmeta);
                           unascribe = (uu___311_13420.unascribe);
                           in_full_norm_request =
                             (uu___311_13420.in_full_norm_request);
                           weakly_reduce_scrutinee =
                             (uu___311_13420.weakly_reduce_scrutinee)
                         });
                      tcenv = (uu___310_13417.tcenv);
                      debug = (uu___310_13417.debug);
                      delta_level = (uu___310_13417.delta_level);
                      primitive_steps = (uu___310_13417.primitive_steps);
                      strong = (uu___310_13417.strong);
                      memoize_lazy = (uu___310_13417.memoize_lazy);
                      normalize_pure_lets =
                        (uu___310_13417.normalize_pure_lets)
                    }  in
                  let stack' = (Cfg cfg) :: stack  in
                  FStar_Pervasives_Native.Some (cfg', stack')
              | Should_unfold_reify  ->
                  let uu____13438 =
                    let uu____13445 = FStar_List.tl stack  in
                    (cfg, uu____13445)  in
                  FStar_Pervasives_Native.Some uu____13438
  
let rec (norm :
  cfg -> env -> stack -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun t  ->
          let t1 =
            if (cfg.debug).norm_delayed
            then
              (match t.FStar_Syntax_Syntax.n with
               | FStar_Syntax_Syntax.Tm_delayed uu____13747 ->
                   let uu____13770 = FStar_Syntax_Print.term_to_string t  in
                   FStar_Util.print1 "NORM delayed: %s\n" uu____13770
               | uu____13771 -> ())
            else ();
            FStar_Syntax_Subst.compress t  in
          log cfg
            (fun uu____13779  ->
               let uu____13780 = FStar_Syntax_Print.tag_of_term t1  in
               let uu____13781 = FStar_Syntax_Print.term_to_string t1  in
               let uu____13782 =
                 FStar_Util.string_of_int (FStar_List.length env)  in
               let uu____13789 =
                 let uu____13790 =
                   let uu____13793 = firstn (Prims.parse_int "4") stack  in
                   FStar_All.pipe_left FStar_Pervasives_Native.fst
                     uu____13793
                    in
                 stack_to_string uu____13790  in
               FStar_Util.print4
                 ">>> %s\nNorm %s with with %s env elements top of the stack %s \n"
                 uu____13780 uu____13781 uu____13782 uu____13789);
          (match t1.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Tm_unknown  ->
               (log_unfolding cfg
                  (fun uu____13819  ->
                     let uu____13820 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print1 ">>> Tm_fvar case 0 for %s\n"
                       uu____13820);
                rebuild cfg env stack t1)
           | FStar_Syntax_Syntax.Tm_constant uu____13821 ->
               (log_unfolding cfg
                  (fun uu____13825  ->
                     let uu____13826 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print1 ">>> Tm_fvar case 0 for %s\n"
                       uu____13826);
                rebuild cfg env stack t1)
           | FStar_Syntax_Syntax.Tm_name uu____13827 ->
               (log_unfolding cfg
                  (fun uu____13831  ->
                     let uu____13832 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print1 ">>> Tm_fvar case 0 for %s\n"
                       uu____13832);
                rebuild cfg env stack t1)
           | FStar_Syntax_Syntax.Tm_lazy uu____13833 ->
               (log_unfolding cfg
                  (fun uu____13837  ->
                     let uu____13838 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print1 ">>> Tm_fvar case 0 for %s\n"
                       uu____13838);
                rebuild cfg env stack t1)
           | FStar_Syntax_Syntax.Tm_fvar
               { FStar_Syntax_Syntax.fv_name = uu____13839;
                 FStar_Syntax_Syntax.fv_delta =
                   FStar_Syntax_Syntax.Delta_constant_at_level _0_17;
                 FStar_Syntax_Syntax.fv_qual = uu____13840;_}
               when _0_17 = (Prims.parse_int "0") ->
               (log_unfolding cfg
                  (fun uu____13846  ->
                     let uu____13847 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print1 ">>> Tm_fvar case 0 for %s\n"
                       uu____13847);
                rebuild cfg env stack t1)
           | FStar_Syntax_Syntax.Tm_fvar
               { FStar_Syntax_Syntax.fv_name = uu____13848;
                 FStar_Syntax_Syntax.fv_delta = uu____13849;
                 FStar_Syntax_Syntax.fv_qual = FStar_Pervasives_Native.Some
                   (FStar_Syntax_Syntax.Data_ctor );_}
               ->
               (log_unfolding cfg
                  (fun uu____13853  ->
                     let uu____13854 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print1 ">>> Tm_fvar case 0 for %s\n"
                       uu____13854);
                rebuild cfg env stack t1)
           | FStar_Syntax_Syntax.Tm_fvar
               { FStar_Syntax_Syntax.fv_name = uu____13855;
                 FStar_Syntax_Syntax.fv_delta = uu____13856;
                 FStar_Syntax_Syntax.fv_qual = FStar_Pervasives_Native.Some
                   (FStar_Syntax_Syntax.Record_ctor uu____13857);_}
               ->
               (log_unfolding cfg
                  (fun uu____13867  ->
                     let uu____13868 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print1 ">>> Tm_fvar case 0 for %s\n"
                       uu____13868);
                rebuild cfg env stack t1)
           | FStar_Syntax_Syntax.Tm_fvar fv ->
               let qninfo =
                 let uu____13871 = FStar_Syntax_Syntax.lid_of_fv fv  in
                 FStar_TypeChecker_Env.lookup_qname cfg.tcenv uu____13871  in
               let uu____13872 =
                 decide_unfolding cfg env stack t1.FStar_Syntax_Syntax.pos fv
                   qninfo
                  in
               (match uu____13872 with
                | FStar_Pervasives_Native.Some (cfg1,stack1) ->
                    do_unfold_fv cfg1 env stack1 t1 qninfo fv
                | FStar_Pervasives_Native.None  -> rebuild cfg env stack t1)
           | FStar_Syntax_Syntax.Tm_quoted uu____13899 ->
               let uu____13906 = closure_as_term cfg env t1  in
               rebuild cfg env stack uu____13906
           | FStar_Syntax_Syntax.Tm_app (hd1,args) when
               ((Prims.op_Negation (cfg.steps).no_full_norm) &&
                  (is_norm_request hd1 args))
                 &&
                 (let uu____13936 =
                    FStar_Ident.lid_equals
                      (cfg.tcenv).FStar_TypeChecker_Env.curmodule
                      FStar_Parser_Const.prims_lid
                     in
                  Prims.op_Negation uu____13936)
               ->
               let cfg' =
                 let uu___312_13938 = cfg  in
                 {
                   steps =
                     (let uu___313_13941 = cfg.steps  in
                      {
                        beta = (uu___313_13941.beta);
                        iota = (uu___313_13941.iota);
                        zeta = (uu___313_13941.zeta);
                        weak = (uu___313_13941.weak);
                        hnf = (uu___313_13941.hnf);
                        primops = (uu___313_13941.primops);
                        do_not_unfold_pure_lets = false;
                        unfold_until = (uu___313_13941.unfold_until);
                        unfold_only = FStar_Pervasives_Native.None;
                        unfold_fully = FStar_Pervasives_Native.None;
                        unfold_attr = (uu___313_13941.unfold_attr);
                        unfold_tac = (uu___313_13941.unfold_tac);
                        pure_subterms_within_computations =
                          (uu___313_13941.pure_subterms_within_computations);
                        simplify = (uu___313_13941.simplify);
                        erase_universes = (uu___313_13941.erase_universes);
                        allow_unbound_universes =
                          (uu___313_13941.allow_unbound_universes);
                        reify_ = (uu___313_13941.reify_);
                        compress_uvars = (uu___313_13941.compress_uvars);
                        no_full_norm = (uu___313_13941.no_full_norm);
                        check_no_uvars = (uu___313_13941.check_no_uvars);
                        unmeta = (uu___313_13941.unmeta);
                        unascribe = (uu___313_13941.unascribe);
                        in_full_norm_request =
                          (uu___313_13941.in_full_norm_request);
                        weakly_reduce_scrutinee =
                          (uu___313_13941.weakly_reduce_scrutinee)
                      });
                   tcenv = (uu___312_13938.tcenv);
                   debug = (uu___312_13938.debug);
                   delta_level =
                     [FStar_TypeChecker_Env.Unfold
                        FStar_Syntax_Syntax.delta_constant];
                   primitive_steps = (uu___312_13938.primitive_steps);
                   strong = (uu___312_13938.strong);
                   memoize_lazy = (uu___312_13938.memoize_lazy);
                   normalize_pure_lets = true
                 }  in
               let uu____13946 = get_norm_request cfg (norm cfg' env []) args
                  in
               (match uu____13946 with
                | FStar_Pervasives_Native.None  ->
                    let stack1 =
                      FStar_All.pipe_right stack
                        (FStar_List.fold_right
                           (fun uu____13975  ->
                              fun stack1  ->
                                match uu____13975 with
                                | (a,aq) ->
                                    let uu____13987 =
                                      let uu____13988 =
                                        let uu____13995 =
                                          let uu____13996 =
                                            let uu____14027 =
                                              FStar_Util.mk_ref
                                                FStar_Pervasives_Native.None
                                               in
                                            (env, a, uu____14027, false)  in
                                          Clos uu____13996  in
                                        (uu____13995, aq,
                                          (t1.FStar_Syntax_Syntax.pos))
                                         in
                                      Arg uu____13988  in
                                    uu____13987 :: stack1) args)
                       in
                    (log cfg
                       (fun uu____14115  ->
                          let uu____14116 =
                            FStar_All.pipe_left FStar_Util.string_of_int
                              (FStar_List.length args)
                             in
                          FStar_Util.print1 "\tPushed %s arguments\n"
                            uu____14116);
                     norm cfg env stack1 hd1)
                | FStar_Pervasives_Native.Some (s,tm) ->
                    let delta_level =
                      let uu____14138 =
                        FStar_All.pipe_right s
                          (FStar_Util.for_some
                             (fun uu___251_14143  ->
                                match uu___251_14143 with
                                | UnfoldUntil uu____14144 -> true
                                | UnfoldOnly uu____14145 -> true
                                | UnfoldFully uu____14148 -> true
                                | uu____14151 -> false))
                         in
                      if uu____14138
                      then
                        [FStar_TypeChecker_Env.Unfold
                           FStar_Syntax_Syntax.delta_constant]
                      else [FStar_TypeChecker_Env.NoDelta]  in
                    let cfg'1 =
                      let uu___314_14156 = cfg  in
                      let uu____14157 =
                        let uu___315_14158 = to_fsteps s  in
                        {
                          beta = (uu___315_14158.beta);
                          iota = (uu___315_14158.iota);
                          zeta = (uu___315_14158.zeta);
                          weak = (uu___315_14158.weak);
                          hnf = (uu___315_14158.hnf);
                          primops = (uu___315_14158.primops);
                          do_not_unfold_pure_lets =
                            (uu___315_14158.do_not_unfold_pure_lets);
                          unfold_until = (uu___315_14158.unfold_until);
                          unfold_only = (uu___315_14158.unfold_only);
                          unfold_fully = (uu___315_14158.unfold_fully);
                          unfold_attr = (uu___315_14158.unfold_attr);
                          unfold_tac = (uu___315_14158.unfold_tac);
                          pure_subterms_within_computations =
                            (uu___315_14158.pure_subterms_within_computations);
                          simplify = (uu___315_14158.simplify);
                          erase_universes = (uu___315_14158.erase_universes);
                          allow_unbound_universes =
                            (uu___315_14158.allow_unbound_universes);
                          reify_ = (uu___315_14158.reify_);
                          compress_uvars = (uu___315_14158.compress_uvars);
                          no_full_norm = (uu___315_14158.no_full_norm);
                          check_no_uvars = (uu___315_14158.check_no_uvars);
                          unmeta = (uu___315_14158.unmeta);
                          unascribe = (uu___315_14158.unascribe);
                          in_full_norm_request = true;
                          weakly_reduce_scrutinee =
                            (uu___315_14158.weakly_reduce_scrutinee)
                        }  in
                      {
                        steps = uu____14157;
                        tcenv = (uu___314_14156.tcenv);
                        debug = (uu___314_14156.debug);
                        delta_level;
                        primitive_steps = (uu___314_14156.primitive_steps);
                        strong = (uu___314_14156.strong);
                        memoize_lazy = (uu___314_14156.memoize_lazy);
                        normalize_pure_lets = true
                      }  in
                    let stack' =
                      let tail1 = (Cfg cfg) :: stack  in
                      if (cfg.debug).print_normalized
                      then
                        let uu____14163 =
                          let uu____14164 =
                            let uu____14169 = FStar_Util.now ()  in
                            (t1, uu____14169)  in
                          Debug uu____14164  in
                        uu____14163 :: tail1
                      else tail1  in
                    norm cfg'1 env stack' tm)
           | FStar_Syntax_Syntax.Tm_type u ->
               let u1 = norm_universe cfg env u  in
               let uu____14173 =
                 mk (FStar_Syntax_Syntax.Tm_type u1)
                   t1.FStar_Syntax_Syntax.pos
                  in
               rebuild cfg env stack uu____14173
           | FStar_Syntax_Syntax.Tm_uinst (t',us) ->
               if (cfg.steps).erase_universes
               then norm cfg env stack t'
               else
                 (let us1 =
                    let uu____14182 =
                      let uu____14189 =
                        FStar_List.map (norm_universe cfg env) us  in
                      (uu____14189, (t1.FStar_Syntax_Syntax.pos))  in
                    UnivArgs uu____14182  in
                  let stack1 = us1 :: stack  in norm cfg env stack1 t')
           | FStar_Syntax_Syntax.Tm_bvar x ->
               let uu____14198 = lookup_bvar env x  in
               (match uu____14198 with
                | Univ uu____14199 ->
                    failwith
                      "Impossible: term variable is bound to a universe"
                | Dummy  -> failwith "Term variable not found"
                | Clos (env1,t0,r,fix) ->
                    if (Prims.op_Negation fix) || (cfg.steps).zeta
                    then
                      let uu____14248 = FStar_ST.op_Bang r  in
                      (match uu____14248 with
                       | FStar_Pervasives_Native.Some (env2,t') ->
                           (log cfg
                              (fun uu____14370  ->
                                 let uu____14371 =
                                   FStar_Syntax_Print.term_to_string t1  in
                                 let uu____14372 =
                                   FStar_Syntax_Print.term_to_string t'  in
                                 FStar_Util.print2
                                   "Lazy hit: %s cached to %s\n" uu____14371
                                   uu____14372);
                            (let uu____14373 = maybe_weakly_reduced t'  in
                             if uu____14373
                             then
                               match stack with
                               | [] when
                                   (cfg.steps).weak ||
                                     (cfg.steps).compress_uvars
                                   -> rebuild cfg env2 stack t'
                               | uu____14374 -> norm cfg env2 stack t'
                             else rebuild cfg env2 stack t'))
                       | FStar_Pervasives_Native.None  ->
                           norm cfg env1 ((MemoLazy r) :: stack) t0)
                    else norm cfg env1 stack t0)
           | FStar_Syntax_Syntax.Tm_abs (bs,body,lopt) ->
               (match stack with
                | (UnivArgs uu____14445)::uu____14446 ->
                    failwith
                      "Ill-typed term: universes cannot be applied to term abstraction"
                | (Arg (c,uu____14456,uu____14457))::stack_rest ->
                    (match c with
                     | Univ uu____14461 ->
                         norm cfg ((FStar_Pervasives_Native.None, c) :: env)
                           stack_rest t1
                     | uu____14470 ->
                         (match bs with
                          | [] -> failwith "Impossible"
                          | b::[] ->
                              (log cfg
                                 (fun uu____14491  ->
                                    let uu____14492 = closure_to_string c  in
                                    FStar_Util.print1 "\tShifted %s\n"
                                      uu____14492);
                               norm cfg
                                 (((FStar_Pervasives_Native.Some b), c) ::
                                 env) stack_rest body)
                          | b::tl1 ->
                              (log cfg
                                 (fun uu____14520  ->
                                    let uu____14521 = closure_to_string c  in
                                    FStar_Util.print1 "\tShifted %s\n"
                                      uu____14521);
                               (let body1 =
                                  mk
                                    (FStar_Syntax_Syntax.Tm_abs
                                       (tl1, body, lopt))
                                    t1.FStar_Syntax_Syntax.pos
                                   in
                                norm cfg
                                  (((FStar_Pervasives_Native.Some b), c) ::
                                  env) stack_rest body1))))
                | (Cfg cfg1)::stack1 -> norm cfg1 env stack1 t1
                | (MemoLazy r)::stack1 ->
                    (set_memo cfg r (env, t1);
                     log cfg
                       (fun uu____14587  ->
                          let uu____14588 =
                            FStar_Syntax_Print.term_to_string t1  in
                          FStar_Util.print1 "\tSet memo %s\n" uu____14588);
                     norm cfg env stack1 t1)
                | (Match uu____14589)::uu____14590 ->
                    if (cfg.steps).weak
                    then
                      let t2 =
                        if (cfg.steps).in_full_norm_request
                        then closure_as_term cfg env t1
                        else
                          (let steps' =
                             let uu___316_14604 = cfg.steps  in
                             {
                               beta = (uu___316_14604.beta);
                               iota = false;
                               zeta = false;
                               weak = false;
                               hnf = (uu___316_14604.hnf);
                               primops = false;
                               do_not_unfold_pure_lets = true;
                               unfold_until = (uu___316_14604.unfold_until);
                               unfold_only = (uu___316_14604.unfold_only);
                               unfold_fully = (uu___316_14604.unfold_fully);
                               unfold_attr = (uu___316_14604.unfold_attr);
                               unfold_tac = (uu___316_14604.unfold_tac);
                               pure_subterms_within_computations = false;
                               simplify = false;
                               erase_universes =
                                 (uu___316_14604.erase_universes);
                               allow_unbound_universes =
                                 (uu___316_14604.allow_unbound_universes);
                               reify_ = false;
                               compress_uvars =
                                 (uu___316_14604.compress_uvars);
                               no_full_norm = true;
                               check_no_uvars =
                                 (uu___316_14604.check_no_uvars);
                               unmeta = false;
                               unascribe = false;
                               in_full_norm_request =
                                 (uu___316_14604.in_full_norm_request);
                               weakly_reduce_scrutinee =
                                 (uu___316_14604.weakly_reduce_scrutinee)
                             }  in
                           let cfg' =
                             let uu___317_14606 = cfg  in
                             {
                               steps = steps';
                               tcenv = (uu___317_14606.tcenv);
                               debug = (uu___317_14606.debug);
                               delta_level = [FStar_TypeChecker_Env.NoDelta];
                               primitive_steps =
                                 (uu___317_14606.primitive_steps);
                               strong = (uu___317_14606.strong);
                               memoize_lazy = (uu___317_14606.memoize_lazy);
                               normalize_pure_lets =
                                 (uu___317_14606.normalize_pure_lets)
                             }  in
                           norm cfg' env [] t1)
                         in
                      rebuild cfg env stack t2
                    else
                      (let uu____14608 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____14608 with
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____14640  -> dummy :: env1) env)
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if (cfg.steps).check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
                                          let uu____14681 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____14681)
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
                                   (let uu___318_14688 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___318_14688.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___318_14688.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____14689 -> lopt  in
                           (log cfg
                              (fun uu____14695  ->
                                 let uu____14696 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____14696);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___319_14705 = cfg  in
                               {
                                 steps = (uu___319_14705.steps);
                                 tcenv = (uu___319_14705.tcenv);
                                 debug = (uu___319_14705.debug);
                                 delta_level = (uu___319_14705.delta_level);
                                 primitive_steps =
                                   (uu___319_14705.primitive_steps);
                                 strong = true;
                                 memoize_lazy = (uu___319_14705.memoize_lazy);
                                 normalize_pure_lets =
                                   (uu___319_14705.normalize_pure_lets)
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1)))
                | (Debug uu____14708)::uu____14709 ->
                    if (cfg.steps).weak
                    then
                      let t2 =
                        if (cfg.steps).in_full_norm_request
                        then closure_as_term cfg env t1
                        else
                          (let steps' =
                             let uu___316_14719 = cfg.steps  in
                             {
                               beta = (uu___316_14719.beta);
                               iota = false;
                               zeta = false;
                               weak = false;
                               hnf = (uu___316_14719.hnf);
                               primops = false;
                               do_not_unfold_pure_lets = true;
                               unfold_until = (uu___316_14719.unfold_until);
                               unfold_only = (uu___316_14719.unfold_only);
                               unfold_fully = (uu___316_14719.unfold_fully);
                               unfold_attr = (uu___316_14719.unfold_attr);
                               unfold_tac = (uu___316_14719.unfold_tac);
                               pure_subterms_within_computations = false;
                               simplify = false;
                               erase_universes =
                                 (uu___316_14719.erase_universes);
                               allow_unbound_universes =
                                 (uu___316_14719.allow_unbound_universes);
                               reify_ = false;
                               compress_uvars =
                                 (uu___316_14719.compress_uvars);
                               no_full_norm = true;
                               check_no_uvars =
                                 (uu___316_14719.check_no_uvars);
                               unmeta = false;
                               unascribe = false;
                               in_full_norm_request =
                                 (uu___316_14719.in_full_norm_request);
                               weakly_reduce_scrutinee =
                                 (uu___316_14719.weakly_reduce_scrutinee)
                             }  in
                           let cfg' =
                             let uu___317_14721 = cfg  in
                             {
                               steps = steps';
                               tcenv = (uu___317_14721.tcenv);
                               debug = (uu___317_14721.debug);
                               delta_level = [FStar_TypeChecker_Env.NoDelta];
                               primitive_steps =
                                 (uu___317_14721.primitive_steps);
                               strong = (uu___317_14721.strong);
                               memoize_lazy = (uu___317_14721.memoize_lazy);
                               normalize_pure_lets =
                                 (uu___317_14721.normalize_pure_lets)
                             }  in
                           norm cfg' env [] t1)
                         in
                      rebuild cfg env stack t2
                    else
                      (let uu____14723 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____14723 with
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____14755  -> dummy :: env1) env)
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if (cfg.steps).check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
                                          let uu____14796 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____14796)
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
                                   (let uu___318_14803 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___318_14803.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___318_14803.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____14804 -> lopt  in
                           (log cfg
                              (fun uu____14810  ->
                                 let uu____14811 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____14811);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___319_14820 = cfg  in
                               {
                                 steps = (uu___319_14820.steps);
                                 tcenv = (uu___319_14820.tcenv);
                                 debug = (uu___319_14820.debug);
                                 delta_level = (uu___319_14820.delta_level);
                                 primitive_steps =
                                   (uu___319_14820.primitive_steps);
                                 strong = true;
                                 memoize_lazy = (uu___319_14820.memoize_lazy);
                                 normalize_pure_lets =
                                   (uu___319_14820.normalize_pure_lets)
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1)))
                | (Meta uu____14823)::uu____14824 ->
                    if (cfg.steps).weak
                    then
                      let t2 =
                        if (cfg.steps).in_full_norm_request
                        then closure_as_term cfg env t1
                        else
                          (let steps' =
                             let uu___316_14836 = cfg.steps  in
                             {
                               beta = (uu___316_14836.beta);
                               iota = false;
                               zeta = false;
                               weak = false;
                               hnf = (uu___316_14836.hnf);
                               primops = false;
                               do_not_unfold_pure_lets = true;
                               unfold_until = (uu___316_14836.unfold_until);
                               unfold_only = (uu___316_14836.unfold_only);
                               unfold_fully = (uu___316_14836.unfold_fully);
                               unfold_attr = (uu___316_14836.unfold_attr);
                               unfold_tac = (uu___316_14836.unfold_tac);
                               pure_subterms_within_computations = false;
                               simplify = false;
                               erase_universes =
                                 (uu___316_14836.erase_universes);
                               allow_unbound_universes =
                                 (uu___316_14836.allow_unbound_universes);
                               reify_ = false;
                               compress_uvars =
                                 (uu___316_14836.compress_uvars);
                               no_full_norm = true;
                               check_no_uvars =
                                 (uu___316_14836.check_no_uvars);
                               unmeta = false;
                               unascribe = false;
                               in_full_norm_request =
                                 (uu___316_14836.in_full_norm_request);
                               weakly_reduce_scrutinee =
                                 (uu___316_14836.weakly_reduce_scrutinee)
                             }  in
                           let cfg' =
                             let uu___317_14838 = cfg  in
                             {
                               steps = steps';
                               tcenv = (uu___317_14838.tcenv);
                               debug = (uu___317_14838.debug);
                               delta_level = [FStar_TypeChecker_Env.NoDelta];
                               primitive_steps =
                                 (uu___317_14838.primitive_steps);
                               strong = (uu___317_14838.strong);
                               memoize_lazy = (uu___317_14838.memoize_lazy);
                               normalize_pure_lets =
                                 (uu___317_14838.normalize_pure_lets)
                             }  in
                           norm cfg' env [] t1)
                         in
                      rebuild cfg env stack t2
                    else
                      (let uu____14840 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____14840 with
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____14872  -> dummy :: env1) env)
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if (cfg.steps).check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
                                          let uu____14913 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____14913)
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
                                   (let uu___318_14920 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___318_14920.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___318_14920.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____14921 -> lopt  in
                           (log cfg
                              (fun uu____14927  ->
                                 let uu____14928 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____14928);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___319_14937 = cfg  in
                               {
                                 steps = (uu___319_14937.steps);
                                 tcenv = (uu___319_14937.tcenv);
                                 debug = (uu___319_14937.debug);
                                 delta_level = (uu___319_14937.delta_level);
                                 primitive_steps =
                                   (uu___319_14937.primitive_steps);
                                 strong = true;
                                 memoize_lazy = (uu___319_14937.memoize_lazy);
                                 normalize_pure_lets =
                                   (uu___319_14937.normalize_pure_lets)
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1)))
                | (Let uu____14940)::uu____14941 ->
                    if (cfg.steps).weak
                    then
                      let t2 =
                        if (cfg.steps).in_full_norm_request
                        then closure_as_term cfg env t1
                        else
                          (let steps' =
                             let uu___316_14955 = cfg.steps  in
                             {
                               beta = (uu___316_14955.beta);
                               iota = false;
                               zeta = false;
                               weak = false;
                               hnf = (uu___316_14955.hnf);
                               primops = false;
                               do_not_unfold_pure_lets = true;
                               unfold_until = (uu___316_14955.unfold_until);
                               unfold_only = (uu___316_14955.unfold_only);
                               unfold_fully = (uu___316_14955.unfold_fully);
                               unfold_attr = (uu___316_14955.unfold_attr);
                               unfold_tac = (uu___316_14955.unfold_tac);
                               pure_subterms_within_computations = false;
                               simplify = false;
                               erase_universes =
                                 (uu___316_14955.erase_universes);
                               allow_unbound_universes =
                                 (uu___316_14955.allow_unbound_universes);
                               reify_ = false;
                               compress_uvars =
                                 (uu___316_14955.compress_uvars);
                               no_full_norm = true;
                               check_no_uvars =
                                 (uu___316_14955.check_no_uvars);
                               unmeta = false;
                               unascribe = false;
                               in_full_norm_request =
                                 (uu___316_14955.in_full_norm_request);
                               weakly_reduce_scrutinee =
                                 (uu___316_14955.weakly_reduce_scrutinee)
                             }  in
                           let cfg' =
                             let uu___317_14957 = cfg  in
                             {
                               steps = steps';
                               tcenv = (uu___317_14957.tcenv);
                               debug = (uu___317_14957.debug);
                               delta_level = [FStar_TypeChecker_Env.NoDelta];
                               primitive_steps =
                                 (uu___317_14957.primitive_steps);
                               strong = (uu___317_14957.strong);
                               memoize_lazy = (uu___317_14957.memoize_lazy);
                               normalize_pure_lets =
                                 (uu___317_14957.normalize_pure_lets)
                             }  in
                           norm cfg' env [] t1)
                         in
                      rebuild cfg env stack t2
                    else
                      (let uu____14959 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____14959 with
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____14991  -> dummy :: env1) env)
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if (cfg.steps).check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
                                          let uu____15032 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____15032)
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
                                   (let uu___318_15039 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___318_15039.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___318_15039.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____15040 -> lopt  in
                           (log cfg
                              (fun uu____15046  ->
                                 let uu____15047 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____15047);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___319_15056 = cfg  in
                               {
                                 steps = (uu___319_15056.steps);
                                 tcenv = (uu___319_15056.tcenv);
                                 debug = (uu___319_15056.debug);
                                 delta_level = (uu___319_15056.delta_level);
                                 primitive_steps =
                                   (uu___319_15056.primitive_steps);
                                 strong = true;
                                 memoize_lazy = (uu___319_15056.memoize_lazy);
                                 normalize_pure_lets =
                                   (uu___319_15056.normalize_pure_lets)
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1)))
                | (App uu____15059)::uu____15060 ->
                    if (cfg.steps).weak
                    then
                      let t2 =
                        if (cfg.steps).in_full_norm_request
                        then closure_as_term cfg env t1
                        else
                          (let steps' =
                             let uu___316_15074 = cfg.steps  in
                             {
                               beta = (uu___316_15074.beta);
                               iota = false;
                               zeta = false;
                               weak = false;
                               hnf = (uu___316_15074.hnf);
                               primops = false;
                               do_not_unfold_pure_lets = true;
                               unfold_until = (uu___316_15074.unfold_until);
                               unfold_only = (uu___316_15074.unfold_only);
                               unfold_fully = (uu___316_15074.unfold_fully);
                               unfold_attr = (uu___316_15074.unfold_attr);
                               unfold_tac = (uu___316_15074.unfold_tac);
                               pure_subterms_within_computations = false;
                               simplify = false;
                               erase_universes =
                                 (uu___316_15074.erase_universes);
                               allow_unbound_universes =
                                 (uu___316_15074.allow_unbound_universes);
                               reify_ = false;
                               compress_uvars =
                                 (uu___316_15074.compress_uvars);
                               no_full_norm = true;
                               check_no_uvars =
                                 (uu___316_15074.check_no_uvars);
                               unmeta = false;
                               unascribe = false;
                               in_full_norm_request =
                                 (uu___316_15074.in_full_norm_request);
                               weakly_reduce_scrutinee =
                                 (uu___316_15074.weakly_reduce_scrutinee)
                             }  in
                           let cfg' =
                             let uu___317_15076 = cfg  in
                             {
                               steps = steps';
                               tcenv = (uu___317_15076.tcenv);
                               debug = (uu___317_15076.debug);
                               delta_level = [FStar_TypeChecker_Env.NoDelta];
                               primitive_steps =
                                 (uu___317_15076.primitive_steps);
                               strong = (uu___317_15076.strong);
                               memoize_lazy = (uu___317_15076.memoize_lazy);
                               normalize_pure_lets =
                                 (uu___317_15076.normalize_pure_lets)
                             }  in
                           norm cfg' env [] t1)
                         in
                      rebuild cfg env stack t2
                    else
                      (let uu____15078 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____15078 with
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____15110  -> dummy :: env1) env)
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if (cfg.steps).check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
                                          let uu____15151 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____15151)
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
                                   (let uu___318_15158 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___318_15158.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___318_15158.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____15159 -> lopt  in
                           (log cfg
                              (fun uu____15165  ->
                                 let uu____15166 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____15166);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___319_15175 = cfg  in
                               {
                                 steps = (uu___319_15175.steps);
                                 tcenv = (uu___319_15175.tcenv);
                                 debug = (uu___319_15175.debug);
                                 delta_level = (uu___319_15175.delta_level);
                                 primitive_steps =
                                   (uu___319_15175.primitive_steps);
                                 strong = true;
                                 memoize_lazy = (uu___319_15175.memoize_lazy);
                                 normalize_pure_lets =
                                   (uu___319_15175.normalize_pure_lets)
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1)))
                | (Abs uu____15178)::uu____15179 ->
                    if (cfg.steps).weak
                    then
                      let t2 =
                        if (cfg.steps).in_full_norm_request
                        then closure_as_term cfg env t1
                        else
                          (let steps' =
                             let uu___316_15197 = cfg.steps  in
                             {
                               beta = (uu___316_15197.beta);
                               iota = false;
                               zeta = false;
                               weak = false;
                               hnf = (uu___316_15197.hnf);
                               primops = false;
                               do_not_unfold_pure_lets = true;
                               unfold_until = (uu___316_15197.unfold_until);
                               unfold_only = (uu___316_15197.unfold_only);
                               unfold_fully = (uu___316_15197.unfold_fully);
                               unfold_attr = (uu___316_15197.unfold_attr);
                               unfold_tac = (uu___316_15197.unfold_tac);
                               pure_subterms_within_computations = false;
                               simplify = false;
                               erase_universes =
                                 (uu___316_15197.erase_universes);
                               allow_unbound_universes =
                                 (uu___316_15197.allow_unbound_universes);
                               reify_ = false;
                               compress_uvars =
                                 (uu___316_15197.compress_uvars);
                               no_full_norm = true;
                               check_no_uvars =
                                 (uu___316_15197.check_no_uvars);
                               unmeta = false;
                               unascribe = false;
                               in_full_norm_request =
                                 (uu___316_15197.in_full_norm_request);
                               weakly_reduce_scrutinee =
                                 (uu___316_15197.weakly_reduce_scrutinee)
                             }  in
                           let cfg' =
                             let uu___317_15199 = cfg  in
                             {
                               steps = steps';
                               tcenv = (uu___317_15199.tcenv);
                               debug = (uu___317_15199.debug);
                               delta_level = [FStar_TypeChecker_Env.NoDelta];
                               primitive_steps =
                                 (uu___317_15199.primitive_steps);
                               strong = (uu___317_15199.strong);
                               memoize_lazy = (uu___317_15199.memoize_lazy);
                               normalize_pure_lets =
                                 (uu___317_15199.normalize_pure_lets)
                             }  in
                           norm cfg' env [] t1)
                         in
                      rebuild cfg env stack t2
                    else
                      (let uu____15201 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____15201 with
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____15233  -> dummy :: env1) env)
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if (cfg.steps).check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
                                          let uu____15274 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____15274)
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
                                   (let uu___318_15281 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___318_15281.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___318_15281.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____15282 -> lopt  in
                           (log cfg
                              (fun uu____15288  ->
                                 let uu____15289 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____15289);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___319_15298 = cfg  in
                               {
                                 steps = (uu___319_15298.steps);
                                 tcenv = (uu___319_15298.tcenv);
                                 debug = (uu___319_15298.debug);
                                 delta_level = (uu___319_15298.delta_level);
                                 primitive_steps =
                                   (uu___319_15298.primitive_steps);
                                 strong = true;
                                 memoize_lazy = (uu___319_15298.memoize_lazy);
                                 normalize_pure_lets =
                                   (uu___319_15298.normalize_pure_lets)
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1)))
                | [] ->
                    if (cfg.steps).weak
                    then
                      let t2 =
                        if (cfg.steps).in_full_norm_request
                        then closure_as_term cfg env t1
                        else
                          (let steps' =
                             let uu___316_15304 = cfg.steps  in
                             {
                               beta = (uu___316_15304.beta);
                               iota = false;
                               zeta = false;
                               weak = false;
                               hnf = (uu___316_15304.hnf);
                               primops = false;
                               do_not_unfold_pure_lets = true;
                               unfold_until = (uu___316_15304.unfold_until);
                               unfold_only = (uu___316_15304.unfold_only);
                               unfold_fully = (uu___316_15304.unfold_fully);
                               unfold_attr = (uu___316_15304.unfold_attr);
                               unfold_tac = (uu___316_15304.unfold_tac);
                               pure_subterms_within_computations = false;
                               simplify = false;
                               erase_universes =
                                 (uu___316_15304.erase_universes);
                               allow_unbound_universes =
                                 (uu___316_15304.allow_unbound_universes);
                               reify_ = false;
                               compress_uvars =
                                 (uu___316_15304.compress_uvars);
                               no_full_norm = true;
                               check_no_uvars =
                                 (uu___316_15304.check_no_uvars);
                               unmeta = false;
                               unascribe = false;
                               in_full_norm_request =
                                 (uu___316_15304.in_full_norm_request);
                               weakly_reduce_scrutinee =
                                 (uu___316_15304.weakly_reduce_scrutinee)
                             }  in
                           let cfg' =
                             let uu___317_15306 = cfg  in
                             {
                               steps = steps';
                               tcenv = (uu___317_15306.tcenv);
                               debug = (uu___317_15306.debug);
                               delta_level = [FStar_TypeChecker_Env.NoDelta];
                               primitive_steps =
                                 (uu___317_15306.primitive_steps);
                               strong = (uu___317_15306.strong);
                               memoize_lazy = (uu___317_15306.memoize_lazy);
                               normalize_pure_lets =
                                 (uu___317_15306.normalize_pure_lets)
                             }  in
                           norm cfg' env [] t1)
                         in
                      rebuild cfg env stack t2
                    else
                      (let uu____15308 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____15308 with
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____15340  -> dummy :: env1) env)
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if (cfg.steps).check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
                                          let uu____15381 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____15381)
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
                                   (let uu___318_15388 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___318_15388.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___318_15388.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____15389 -> lopt  in
                           (log cfg
                              (fun uu____15395  ->
                                 let uu____15396 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____15396);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___319_15405 = cfg  in
                               {
                                 steps = (uu___319_15405.steps);
                                 tcenv = (uu___319_15405.tcenv);
                                 debug = (uu___319_15405.debug);
                                 delta_level = (uu___319_15405.delta_level);
                                 primitive_steps =
                                   (uu___319_15405.primitive_steps);
                                 strong = true;
                                 memoize_lazy = (uu___319_15405.memoize_lazy);
                                 normalize_pure_lets =
                                   (uu___319_15405.normalize_pure_lets)
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1))))
           | FStar_Syntax_Syntax.Tm_app (head1,args) ->
               let stack1 =
                 FStar_All.pipe_right stack
                   (FStar_List.fold_right
                      (fun uu____15444  ->
                         fun stack1  ->
                           match uu____15444 with
                           | (a,aq) ->
                               let uu____15456 =
                                 let uu____15457 =
                                   let uu____15464 =
                                     let uu____15465 =
                                       let uu____15496 =
                                         FStar_Util.mk_ref
                                           FStar_Pervasives_Native.None
                                          in
                                       (env, a, uu____15496, false)  in
                                     Clos uu____15465  in
                                   (uu____15464, aq,
                                     (t1.FStar_Syntax_Syntax.pos))
                                    in
                                 Arg uu____15457  in
                               uu____15456 :: stack1) args)
                  in
               (log cfg
                  (fun uu____15584  ->
                     let uu____15585 =
                       FStar_All.pipe_left FStar_Util.string_of_int
                         (FStar_List.length args)
                        in
                     FStar_Util.print1 "\tPushed %s arguments\n" uu____15585);
                norm cfg env stack1 head1)
           | FStar_Syntax_Syntax.Tm_refine (x,f) ->
               if (cfg.steps).weak
               then
                 (match (env, stack) with
                  | ([],[]) ->
                      let t_x = norm cfg env [] x.FStar_Syntax_Syntax.sort
                         in
                      let t2 =
                        mk
                          (FStar_Syntax_Syntax.Tm_refine
                             ((let uu___320_15631 = x  in
                               {
                                 FStar_Syntax_Syntax.ppname =
                                   (uu___320_15631.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___320_15631.FStar_Syntax_Syntax.index);
                                 FStar_Syntax_Syntax.sort = t_x
                               }), f)) t1.FStar_Syntax_Syntax.pos
                         in
                      rebuild cfg env stack t2
                  | uu____15632 ->
                      let uu____15647 = closure_as_term cfg env t1  in
                      rebuild cfg env stack uu____15647)
               else
                 (let t_x = norm cfg env [] x.FStar_Syntax_Syntax.sort  in
                  let uu____15650 =
                    FStar_Syntax_Subst.open_term
                      [(x, FStar_Pervasives_Native.None)] f
                     in
                  match uu____15650 with
                  | (closing,f1) ->
                      let f2 = norm cfg (dummy :: env) [] f1  in
                      let t2 =
                        let uu____15675 =
                          let uu____15676 =
                            let uu____15683 =
                              FStar_Syntax_Subst.close closing f2  in
                            ((let uu___321_15689 = x  in
                              {
                                FStar_Syntax_Syntax.ppname =
                                  (uu___321_15689.FStar_Syntax_Syntax.ppname);
                                FStar_Syntax_Syntax.index =
                                  (uu___321_15689.FStar_Syntax_Syntax.index);
                                FStar_Syntax_Syntax.sort = t_x
                              }), uu____15683)
                             in
                          FStar_Syntax_Syntax.Tm_refine uu____15676  in
                        mk uu____15675 t1.FStar_Syntax_Syntax.pos  in
                      rebuild cfg env stack t2)
           | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
               if (cfg.steps).weak
               then
                 let uu____15708 = closure_as_term cfg env t1  in
                 rebuild cfg env stack uu____15708
               else
                 (let uu____15710 = FStar_Syntax_Subst.open_comp bs c  in
                  match uu____15710 with
                  | (bs1,c1) ->
                      let c2 =
                        let uu____15718 =
                          FStar_All.pipe_right bs1
                            (FStar_List.fold_left
                               (fun env1  ->
                                  fun uu____15740  -> dummy :: env1) env)
                           in
                        norm_comp cfg uu____15718 c1  in
                      let t2 =
                        let uu____15762 = norm_binders cfg env bs1  in
                        FStar_Syntax_Util.arrow uu____15762 c2  in
                      rebuild cfg env stack t2)
           | FStar_Syntax_Syntax.Tm_ascribed (t11,(tc,tacopt),l) when
               (cfg.steps).unascribe -> norm cfg env stack t11
           | FStar_Syntax_Syntax.Tm_ascribed (t11,(tc,tacopt),l) ->
               (match stack with
                | (Match uu____15873)::uu____15874 ->
                    (log cfg
                       (fun uu____15887  ->
                          FStar_Util.print_string
                            "+++ Dropping ascription \n");
                     norm cfg env stack t11)
                | (Arg uu____15888)::uu____15889 ->
                    (log cfg
                       (fun uu____15900  ->
                          FStar_Util.print_string
                            "+++ Dropping ascription \n");
                     norm cfg env stack t11)
                | (App
                    (uu____15901,{
                                   FStar_Syntax_Syntax.n =
                                     FStar_Syntax_Syntax.Tm_constant
                                     (FStar_Const.Const_reify );
                                   FStar_Syntax_Syntax.pos = uu____15902;
                                   FStar_Syntax_Syntax.vars = uu____15903;_},uu____15904,uu____15905))::uu____15906
                    ->
                    (log cfg
                       (fun uu____15913  ->
                          FStar_Util.print_string
                            "+++ Dropping ascription \n");
                     norm cfg env stack t11)
                | (MemoLazy uu____15914)::uu____15915 ->
                    (log cfg
                       (fun uu____15926  ->
                          FStar_Util.print_string
                            "+++ Dropping ascription \n");
                     norm cfg env stack t11)
                | uu____15927 ->
                    (log cfg
                       (fun uu____15930  ->
                          FStar_Util.print_string "+++ Keeping ascription \n");
                     (let t12 = norm cfg env [] t11  in
                      log cfg
                        (fun uu____15934  ->
                           FStar_Util.print_string
                             "+++ Normalizing ascription \n");
                      (let tc1 =
                         match tc with
                         | FStar_Util.Inl t2 ->
                             let uu____15959 = norm cfg env [] t2  in
                             FStar_Util.Inl uu____15959
                         | FStar_Util.Inr c ->
                             let uu____15973 = norm_comp cfg env c  in
                             FStar_Util.Inr uu____15973
                          in
                       let tacopt1 =
                         FStar_Util.map_opt tacopt (norm cfg env [])  in
                       match stack with
                       | (Cfg cfg1)::stack1 ->
                           let t2 =
                             let uu____15996 =
                               let uu____15997 =
                                 let uu____16024 =
                                   FStar_Syntax_Util.unascribe t12  in
                                 (uu____16024, (tc1, tacopt1), l)  in
                               FStar_Syntax_Syntax.Tm_ascribed uu____15997
                                in
                             mk uu____15996 t1.FStar_Syntax_Syntax.pos  in
                           norm cfg1 env stack1 t2
                       | uu____16059 ->
                           let uu____16060 =
                             let uu____16061 =
                               let uu____16062 =
                                 let uu____16089 =
                                   FStar_Syntax_Util.unascribe t12  in
                                 (uu____16089, (tc1, tacopt1), l)  in
                               FStar_Syntax_Syntax.Tm_ascribed uu____16062
                                in
                             mk uu____16061 t1.FStar_Syntax_Syntax.pos  in
                           rebuild cfg env stack uu____16060))))
           | FStar_Syntax_Syntax.Tm_match (head1,branches) ->
               let stack1 =
                 (Match (env, branches, cfg, (t1.FStar_Syntax_Syntax.pos)))
                 :: stack  in
               if
                 ((cfg.steps).iota && (cfg.steps).weakly_reduce_scrutinee) &&
                   (Prims.op_Negation (cfg.steps).weak)
               then
                 let cfg' =
                   let uu___322_16166 = cfg  in
                   {
                     steps =
                       (let uu___323_16169 = cfg.steps  in
                        {
                          beta = (uu___323_16169.beta);
                          iota = (uu___323_16169.iota);
                          zeta = (uu___323_16169.zeta);
                          weak = true;
                          hnf = (uu___323_16169.hnf);
                          primops = (uu___323_16169.primops);
                          do_not_unfold_pure_lets =
                            (uu___323_16169.do_not_unfold_pure_lets);
                          unfold_until = (uu___323_16169.unfold_until);
                          unfold_only = (uu___323_16169.unfold_only);
                          unfold_fully = (uu___323_16169.unfold_fully);
                          unfold_attr = (uu___323_16169.unfold_attr);
                          unfold_tac = (uu___323_16169.unfold_tac);
                          pure_subterms_within_computations =
                            (uu___323_16169.pure_subterms_within_computations);
                          simplify = (uu___323_16169.simplify);
                          erase_universes = (uu___323_16169.erase_universes);
                          allow_unbound_universes =
                            (uu___323_16169.allow_unbound_universes);
                          reify_ = (uu___323_16169.reify_);
                          compress_uvars = (uu___323_16169.compress_uvars);
                          no_full_norm = (uu___323_16169.no_full_norm);
                          check_no_uvars = (uu___323_16169.check_no_uvars);
                          unmeta = (uu___323_16169.unmeta);
                          unascribe = (uu___323_16169.unascribe);
                          in_full_norm_request =
                            (uu___323_16169.in_full_norm_request);
                          weakly_reduce_scrutinee =
                            (uu___323_16169.weakly_reduce_scrutinee)
                        });
                     tcenv = (uu___322_16166.tcenv);
                     debug = (uu___322_16166.debug);
                     delta_level = (uu___322_16166.delta_level);
                     primitive_steps = (uu___322_16166.primitive_steps);
                     strong = (uu___322_16166.strong);
                     memoize_lazy = (uu___322_16166.memoize_lazy);
                     normalize_pure_lets =
                       (uu___322_16166.normalize_pure_lets)
                   }  in
                 norm cfg' env ((Cfg cfg) :: stack1) head1
               else norm cfg env stack1 head1
           | FStar_Syntax_Syntax.Tm_let ((b,lbs),lbody) when
               (FStar_Syntax_Syntax.is_top_level lbs) &&
                 (cfg.steps).compress_uvars
               ->
               let lbs1 =
                 FStar_All.pipe_right lbs
                   (FStar_List.map
                      (fun lb  ->
                         let uu____16205 =
                           FStar_Syntax_Subst.univ_var_opening
                             lb.FStar_Syntax_Syntax.lbunivs
                            in
                         match uu____16205 with
                         | (openings,lbunivs) ->
                             let cfg1 =
                               let uu___324_16225 = cfg  in
                               let uu____16226 =
                                 FStar_TypeChecker_Env.push_univ_vars
                                   cfg.tcenv lbunivs
                                  in
                               {
                                 steps = (uu___324_16225.steps);
                                 tcenv = uu____16226;
                                 debug = (uu___324_16225.debug);
                                 delta_level = (uu___324_16225.delta_level);
                                 primitive_steps =
                                   (uu___324_16225.primitive_steps);
                                 strong = (uu___324_16225.strong);
                                 memoize_lazy = (uu___324_16225.memoize_lazy);
                                 normalize_pure_lets =
                                   (uu___324_16225.normalize_pure_lets)
                               }  in
                             let norm1 t2 =
                               let uu____16233 =
                                 let uu____16234 =
                                   FStar_Syntax_Subst.subst openings t2  in
                                 norm cfg1 env [] uu____16234  in
                               FStar_Syntax_Subst.close_univ_vars lbunivs
                                 uu____16233
                                in
                             let lbtyp = norm1 lb.FStar_Syntax_Syntax.lbtyp
                                in
                             let lbdef = norm1 lb.FStar_Syntax_Syntax.lbdef
                                in
                             let uu___325_16237 = lb  in
                             {
                               FStar_Syntax_Syntax.lbname =
                                 (uu___325_16237.FStar_Syntax_Syntax.lbname);
                               FStar_Syntax_Syntax.lbunivs = lbunivs;
                               FStar_Syntax_Syntax.lbtyp = lbtyp;
                               FStar_Syntax_Syntax.lbeff =
                                 (uu___325_16237.FStar_Syntax_Syntax.lbeff);
                               FStar_Syntax_Syntax.lbdef = lbdef;
                               FStar_Syntax_Syntax.lbattrs =
                                 (uu___325_16237.FStar_Syntax_Syntax.lbattrs);
                               FStar_Syntax_Syntax.lbpos =
                                 (uu___325_16237.FStar_Syntax_Syntax.lbpos)
                             }))
                  in
               let uu____16238 =
                 mk (FStar_Syntax_Syntax.Tm_let ((b, lbs1), lbody))
                   t1.FStar_Syntax_Syntax.pos
                  in
               rebuild cfg env stack uu____16238
           | FStar_Syntax_Syntax.Tm_let
               ((uu____16249,{
                               FStar_Syntax_Syntax.lbname = FStar_Util.Inr
                                 uu____16250;
                               FStar_Syntax_Syntax.lbunivs = uu____16251;
                               FStar_Syntax_Syntax.lbtyp = uu____16252;
                               FStar_Syntax_Syntax.lbeff = uu____16253;
                               FStar_Syntax_Syntax.lbdef = uu____16254;
                               FStar_Syntax_Syntax.lbattrs = uu____16255;
                               FStar_Syntax_Syntax.lbpos = uu____16256;_}::uu____16257),uu____16258)
               -> rebuild cfg env stack t1
           | FStar_Syntax_Syntax.Tm_let ((false ,lb::[]),body) ->
               let n1 =
                 FStar_TypeChecker_Env.norm_eff_name cfg.tcenv
                   lb.FStar_Syntax_Syntax.lbeff
                  in
               let uu____16298 =
                 (Prims.op_Negation (cfg.steps).do_not_unfold_pure_lets) &&
                   ((((cfg.steps).pure_subterms_within_computations &&
                        (FStar_Syntax_Util.has_attribute
                           lb.FStar_Syntax_Syntax.lbattrs
                           FStar_Parser_Const.inline_let_attr))
                       ||
                       ((FStar_Syntax_Util.is_pure_effect n1) &&
                          (cfg.normalize_pure_lets ||
                             (FStar_Syntax_Util.has_attribute
                                lb.FStar_Syntax_Syntax.lbattrs
                                FStar_Parser_Const.inline_let_attr))))
                      ||
                      ((FStar_Syntax_Util.is_ghost_effect n1) &&
                         (Prims.op_Negation
                            (cfg.steps).pure_subterms_within_computations)))
                  in
               if uu____16298
               then
                 let binder =
                   let uu____16300 =
                     FStar_Util.left lb.FStar_Syntax_Syntax.lbname  in
                   FStar_Syntax_Syntax.mk_binder uu____16300  in
                 let env1 =
                   let uu____16310 =
                     let uu____16317 =
                       let uu____16318 =
                         let uu____16349 =
                           FStar_Util.mk_ref FStar_Pervasives_Native.None  in
                         (env, (lb.FStar_Syntax_Syntax.lbdef), uu____16349,
                           false)
                          in
                       Clos uu____16318  in
                     ((FStar_Pervasives_Native.Some binder), uu____16317)  in
                   uu____16310 :: env  in
                 (log cfg
                    (fun uu____16444  ->
                       FStar_Util.print_string "+++ Reducing Tm_let\n");
                  norm cfg env1 stack body)
               else
                 if (cfg.steps).weak
                 then
                   (log cfg
                      (fun uu____16448  ->
                         FStar_Util.print_string "+++ Not touching Tm_let\n");
                    (let uu____16449 = closure_as_term cfg env t1  in
                     rebuild cfg env stack uu____16449))
                 else
                   (let uu____16451 =
                      let uu____16456 =
                        let uu____16457 =
                          let uu____16462 =
                            FStar_All.pipe_right
                              lb.FStar_Syntax_Syntax.lbname FStar_Util.left
                             in
                          FStar_All.pipe_right uu____16462
                            FStar_Syntax_Syntax.mk_binder
                           in
                        [uu____16457]  in
                      FStar_Syntax_Subst.open_term uu____16456 body  in
                    match uu____16451 with
                    | (bs,body1) ->
                        (log cfg
                           (fun uu____16483  ->
                              FStar_Util.print_string
                                "+++ Normalizing Tm_let -- type");
                         (let ty =
                            norm cfg env [] lb.FStar_Syntax_Syntax.lbtyp  in
                          let lbname =
                            let x =
                              let uu____16491 = FStar_List.hd bs  in
                              FStar_Pervasives_Native.fst uu____16491  in
                            FStar_Util.Inl
                              (let uu___326_16501 = x  in
                               {
                                 FStar_Syntax_Syntax.ppname =
                                   (uu___326_16501.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___326_16501.FStar_Syntax_Syntax.index);
                                 FStar_Syntax_Syntax.sort = ty
                               })
                             in
                          log cfg
                            (fun uu____16504  ->
                               FStar_Util.print_string
                                 "+++ Normalizing Tm_let -- definiens\n");
                          (let lb1 =
                             let uu___327_16506 = lb  in
                             let uu____16507 =
                               norm cfg env [] lb.FStar_Syntax_Syntax.lbdef
                                in
                             {
                               FStar_Syntax_Syntax.lbname = lbname;
                               FStar_Syntax_Syntax.lbunivs =
                                 (uu___327_16506.FStar_Syntax_Syntax.lbunivs);
                               FStar_Syntax_Syntax.lbtyp = ty;
                               FStar_Syntax_Syntax.lbeff =
                                 (uu___327_16506.FStar_Syntax_Syntax.lbeff);
                               FStar_Syntax_Syntax.lbdef = uu____16507;
                               FStar_Syntax_Syntax.lbattrs =
                                 (uu___327_16506.FStar_Syntax_Syntax.lbattrs);
                               FStar_Syntax_Syntax.lbpos =
                                 (uu___327_16506.FStar_Syntax_Syntax.lbpos)
                             }  in
                           let env' =
                             FStar_All.pipe_right bs
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____16532  -> dummy :: env1) env)
                              in
                           let stack1 = (Cfg cfg) :: stack  in
                           let cfg1 =
                             let uu___328_16555 = cfg  in
                             {
                               steps = (uu___328_16555.steps);
                               tcenv = (uu___328_16555.tcenv);
                               debug = (uu___328_16555.debug);
                               delta_level = (uu___328_16555.delta_level);
                               primitive_steps =
                                 (uu___328_16555.primitive_steps);
                               strong = true;
                               memoize_lazy = (uu___328_16555.memoize_lazy);
                               normalize_pure_lets =
                                 (uu___328_16555.normalize_pure_lets)
                             }  in
                           log cfg1
                             (fun uu____16558  ->
                                FStar_Util.print_string
                                  "+++ Normalizing Tm_let -- body\n");
                           norm cfg1 env'
                             ((Let
                                 (env, bs, lb1, (t1.FStar_Syntax_Syntax.pos)))
                             :: stack1) body1))))
           | FStar_Syntax_Syntax.Tm_let ((true ,lbs),body) when
               (cfg.steps).compress_uvars ||
                 ((Prims.op_Negation (cfg.steps).zeta) &&
                    (cfg.steps).pure_subterms_within_computations)
               ->
               let uu____16575 = FStar_Syntax_Subst.open_let_rec lbs body  in
               (match uu____16575 with
                | (lbs1,body1) ->
                    let lbs2 =
                      FStar_List.map
                        (fun lb  ->
                           let ty =
                             norm cfg env [] lb.FStar_Syntax_Syntax.lbtyp  in
                           let lbname =
                             let uu____16611 =
                               let uu___329_16612 =
                                 FStar_Util.left
                                   lb.FStar_Syntax_Syntax.lbname
                                  in
                               {
                                 FStar_Syntax_Syntax.ppname =
                                   (uu___329_16612.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___329_16612.FStar_Syntax_Syntax.index);
                                 FStar_Syntax_Syntax.sort = ty
                               }  in
                             FStar_Util.Inl uu____16611  in
                           let uu____16613 =
                             FStar_Syntax_Util.abs_formals
                               lb.FStar_Syntax_Syntax.lbdef
                              in
                           match uu____16613 with
                           | (xs,def_body,lopt) ->
                               let xs1 = norm_binders cfg env xs  in
                               let env1 =
                                 let uu____16639 =
                                   FStar_List.map (fun uu____16655  -> dummy)
                                     lbs1
                                    in
                                 let uu____16656 =
                                   let uu____16665 =
                                     FStar_List.map
                                       (fun uu____16685  -> dummy) xs1
                                      in
                                   FStar_List.append uu____16665 env  in
                                 FStar_List.append uu____16639 uu____16656
                                  in
                               let def_body1 = norm cfg env1 [] def_body  in
                               let lopt1 =
                                 match lopt with
                                 | FStar_Pervasives_Native.Some rc ->
                                     let uu____16709 =
                                       let uu___330_16710 = rc  in
                                       let uu____16711 =
                                         FStar_Util.map_opt
                                           rc.FStar_Syntax_Syntax.residual_typ
                                           (norm cfg env1 [])
                                          in
                                       {
                                         FStar_Syntax_Syntax.residual_effect
                                           =
                                           (uu___330_16710.FStar_Syntax_Syntax.residual_effect);
                                         FStar_Syntax_Syntax.residual_typ =
                                           uu____16711;
                                         FStar_Syntax_Syntax.residual_flags =
                                           (uu___330_16710.FStar_Syntax_Syntax.residual_flags)
                                       }  in
                                     FStar_Pervasives_Native.Some uu____16709
                                 | uu____16720 -> lopt  in
                               let def =
                                 FStar_Syntax_Util.abs xs1 def_body1 lopt1
                                  in
                               let uu___331_16726 = lb  in
                               {
                                 FStar_Syntax_Syntax.lbname = lbname;
                                 FStar_Syntax_Syntax.lbunivs =
                                   (uu___331_16726.FStar_Syntax_Syntax.lbunivs);
                                 FStar_Syntax_Syntax.lbtyp = ty;
                                 FStar_Syntax_Syntax.lbeff =
                                   (uu___331_16726.FStar_Syntax_Syntax.lbeff);
                                 FStar_Syntax_Syntax.lbdef = def;
                                 FStar_Syntax_Syntax.lbattrs =
                                   (uu___331_16726.FStar_Syntax_Syntax.lbattrs);
                                 FStar_Syntax_Syntax.lbpos =
                                   (uu___331_16726.FStar_Syntax_Syntax.lbpos)
                               }) lbs1
                       in
                    let env' =
                      let uu____16736 =
                        FStar_List.map (fun uu____16752  -> dummy) lbs2  in
                      FStar_List.append uu____16736 env  in
                    let body2 = norm cfg env' [] body1  in
                    let uu____16760 =
                      FStar_Syntax_Subst.close_let_rec lbs2 body2  in
                    (match uu____16760 with
                     | (lbs3,body3) ->
                         let t2 =
                           let uu___332_16776 = t1  in
                           {
                             FStar_Syntax_Syntax.n =
                               (FStar_Syntax_Syntax.Tm_let
                                  ((true, lbs3), body3));
                             FStar_Syntax_Syntax.pos =
                               (uu___332_16776.FStar_Syntax_Syntax.pos);
                             FStar_Syntax_Syntax.vars =
                               (uu___332_16776.FStar_Syntax_Syntax.vars)
                           }  in
                         rebuild cfg env stack t2))
           | FStar_Syntax_Syntax.Tm_let (lbs,body) when
               Prims.op_Negation (cfg.steps).zeta ->
               let uu____16805 = closure_as_term cfg env t1  in
               rebuild cfg env stack uu____16805
           | FStar_Syntax_Syntax.Tm_let (lbs,body) ->
               let uu____16824 =
                 FStar_List.fold_right
                   (fun lb  ->
                      fun uu____16900  ->
                        match uu____16900 with
                        | (rec_env,memos,i) ->
                            let bv =
                              let uu___333_17021 =
                                FStar_Util.left lb.FStar_Syntax_Syntax.lbname
                                 in
                              {
                                FStar_Syntax_Syntax.ppname =
                                  (uu___333_17021.FStar_Syntax_Syntax.ppname);
                                FStar_Syntax_Syntax.index = i;
                                FStar_Syntax_Syntax.sort =
                                  (uu___333_17021.FStar_Syntax_Syntax.sort)
                              }  in
                            let f_i = FStar_Syntax_Syntax.bv_to_tm bv  in
                            let fix_f_i =
                              mk (FStar_Syntax_Syntax.Tm_let (lbs, f_i))
                                t1.FStar_Syntax_Syntax.pos
                               in
                            let memo =
                              FStar_Util.mk_ref FStar_Pervasives_Native.None
                               in
                            let rec_env1 =
                              (FStar_Pervasives_Native.None,
                                (Clos (env, fix_f_i, memo, true)))
                              :: rec_env  in
                            (rec_env1, (memo :: memos),
                              (i + (Prims.parse_int "1"))))
                   (FStar_Pervasives_Native.snd lbs)
                   (env, [], (Prims.parse_int "0"))
                  in
               (match uu____16824 with
                | (rec_env,memos,uu____17248) ->
                    let uu____17301 =
                      FStar_List.map2
                        (fun lb  ->
                           fun memo  ->
                             FStar_ST.op_Colon_Equals memo
                               (FStar_Pervasives_Native.Some
                                  (rec_env, (lb.FStar_Syntax_Syntax.lbdef))))
                        (FStar_Pervasives_Native.snd lbs) memos
                       in
                    let body_env =
                      FStar_List.fold_right
                        (fun lb  ->
                           fun env1  ->
                             let uu____17624 =
                               let uu____17631 =
                                 let uu____17632 =
                                   let uu____17663 =
                                     FStar_Util.mk_ref
                                       FStar_Pervasives_Native.None
                                      in
                                   (rec_env, (lb.FStar_Syntax_Syntax.lbdef),
                                     uu____17663, false)
                                    in
                                 Clos uu____17632  in
                               (FStar_Pervasives_Native.None, uu____17631)
                                in
                             uu____17624 :: env1)
                        (FStar_Pervasives_Native.snd lbs) env
                       in
                    norm cfg body_env stack body)
           | FStar_Syntax_Syntax.Tm_meta (head1,m) ->
               (log cfg
                  (fun uu____17767  ->
                     let uu____17768 =
                       FStar_Syntax_Print.metadata_to_string m  in
                     FStar_Util.print1 ">> metadata = %s\n" uu____17768);
                (match m with
                 | FStar_Syntax_Syntax.Meta_monadic (m1,t2) ->
                     reduce_impure_comp cfg env stack head1
                       (FStar_Util.Inl m1) t2
                 | FStar_Syntax_Syntax.Meta_monadic_lift (m1,m',t2) ->
                     reduce_impure_comp cfg env stack head1
                       (FStar_Util.Inr (m1, m')) t2
                 | uu____17790 ->
                     if (cfg.steps).unmeta
                     then norm cfg env stack head1
                     else
                       (match stack with
                        | uu____17792::uu____17793 ->
                            (match m with
                             | FStar_Syntax_Syntax.Meta_labeled
                                 (l,r,uu____17798) ->
                                 norm cfg env ((Meta (env, m, r)) :: stack)
                                   head1
                             | FStar_Syntax_Syntax.Meta_pattern args ->
                                 let args1 = norm_pattern_args cfg env args
                                    in
                                 norm cfg env
                                   ((Meta
                                       (env,
                                         (FStar_Syntax_Syntax.Meta_pattern
                                            args1),
                                         (t1.FStar_Syntax_Syntax.pos))) ::
                                   stack) head1
                             | uu____17821 -> norm cfg env stack head1)
                        | [] ->
                            let head2 = norm cfg env [] head1  in
                            let m1 =
                              match m with
                              | FStar_Syntax_Syntax.Meta_pattern args ->
                                  let uu____17835 =
                                    norm_pattern_args cfg env args  in
                                  FStar_Syntax_Syntax.Meta_pattern
                                    uu____17835
                              | uu____17846 -> m  in
                            let t2 =
                              mk (FStar_Syntax_Syntax.Tm_meta (head2, m1))
                                t1.FStar_Syntax_Syntax.pos
                               in
                            rebuild cfg env stack t2)))
           | FStar_Syntax_Syntax.Tm_delayed uu____17852 ->
               let t2 = FStar_Syntax_Subst.compress t1  in
               norm cfg env stack t2
           | FStar_Syntax_Syntax.Tm_uvar uu____17876 ->
               let t2 = FStar_Syntax_Subst.compress t1  in
               (match t2.FStar_Syntax_Syntax.n with
                | FStar_Syntax_Syntax.Tm_uvar uu____17890 ->
                    if (cfg.steps).check_no_uvars
                    then
                      let uu____17903 =
                        let uu____17904 =
                          FStar_Range.string_of_range
                            t2.FStar_Syntax_Syntax.pos
                           in
                        let uu____17905 =
                          FStar_Syntax_Print.term_to_string t2  in
                        FStar_Util.format2
                          "(%s) CheckNoUvars: Unexpected unification variable remains: %s"
                          uu____17904 uu____17905
                         in
                      failwith uu____17903
                    else
                      (let uu____17907 = inline_closure_env cfg env [] t2  in
                       rebuild cfg env stack uu____17907)
                | uu____17908 -> norm cfg env stack t2))

and (do_unfold_fv :
  cfg ->
    env ->
      stack_elt Prims.list ->
        FStar_Syntax_Syntax.term ->
          FStar_TypeChecker_Env.qninfo ->
            FStar_Syntax_Syntax.fv -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun t0  ->
          fun qninfo  ->
            fun f  ->
              let uu____17917 =
                FStar_TypeChecker_Env.lookup_definition_qninfo
                  cfg.delta_level
                  (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                  qninfo
                 in
              match uu____17917 with
              | FStar_Pervasives_Native.None  ->
                  (log_unfolding cfg
                     (fun uu____17931  ->
                        let uu____17932 = FStar_Syntax_Print.fv_to_string f
                           in
                        FStar_Util.print1 " >> Tm_fvar case 2 for %s\n"
                          uu____17932);
                   rebuild cfg env stack t0)
              | FStar_Pervasives_Native.Some (us,t) ->
                  (log_unfolding cfg
                     (fun uu____17943  ->
                        let uu____17944 =
                          FStar_Syntax_Print.term_to_string t0  in
                        let uu____17945 = FStar_Syntax_Print.term_to_string t
                           in
                        FStar_Util.print2 " >> Unfolded %s to %s\n"
                          uu____17944 uu____17945);
                   (let t1 =
                      if
                        (cfg.steps).unfold_until =
                          (FStar_Pervasives_Native.Some
                             FStar_Syntax_Syntax.delta_constant)
                      then t
                      else
                        FStar_Syntax_Subst.set_use_range
                          t0.FStar_Syntax_Syntax.pos t
                       in
                    let n1 = FStar_List.length us  in
                    if n1 > (Prims.parse_int "0")
                    then
                      match stack with
                      | (UnivArgs (us',uu____17958))::stack1 ->
                          ((let uu____17967 =
                              FStar_All.pipe_left
                                (FStar_TypeChecker_Env.debug cfg.tcenv)
                                (FStar_Options.Other "univ_norm")
                               in
                            if uu____17967
                            then
                              FStar_List.iter
                                (fun x  ->
                                   let uu____17971 =
                                     FStar_Syntax_Print.univ_to_string x  in
                                   FStar_Util.print1 "Univ (normalizer) %s\n"
                                     uu____17971) us'
                            else ());
                           (let env1 =
                              FStar_All.pipe_right us'
                                (FStar_List.fold_left
                                   (fun env1  ->
                                      fun u  ->
                                        (FStar_Pervasives_Native.None,
                                          (Univ u))
                                        :: env1) env)
                               in
                            norm cfg env1 stack1 t1))
                      | uu____18004 when
                          (cfg.steps).erase_universes ||
                            (cfg.steps).allow_unbound_universes
                          -> norm cfg env stack t1
                      | uu____18007 ->
                          let uu____18010 =
                            let uu____18011 =
                              FStar_Syntax_Print.lid_to_string
                                (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                               in
                            FStar_Util.format1
                              "Impossible: missing universe instantiation on %s"
                              uu____18011
                             in
                          failwith uu____18010
                    else norm cfg env stack t1))

and (reduce_impure_comp :
  cfg ->
    env ->
      stack ->
        FStar_Syntax_Syntax.term ->
          (FStar_Syntax_Syntax.monad_name,(FStar_Syntax_Syntax.monad_name,
                                            FStar_Syntax_Syntax.monad_name)
                                            FStar_Pervasives_Native.tuple2)
            FStar_Util.either ->
            FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun head1  ->
          fun m  ->
            fun t  ->
              let t1 = norm cfg env [] t  in
              let stack1 = (Cfg cfg) :: stack  in
              let cfg1 =
                if (cfg.steps).pure_subterms_within_computations
                then
                  let new_steps =
                    [PureSubtermsWithinComputations;
                    Primops;
                    AllowUnboundUniverses;
                    EraseUniverses;
                    Exclude Zeta;
                    Inlining]  in
                  let uu___334_18035 = cfg  in
                  let uu____18036 =
                    FStar_List.fold_right fstep_add_one new_steps cfg.steps
                     in
                  {
                    steps = uu____18036;
                    tcenv = (uu___334_18035.tcenv);
                    debug = (uu___334_18035.debug);
                    delta_level =
                      [FStar_TypeChecker_Env.Inlining;
                      FStar_TypeChecker_Env.Eager_unfolding_only];
                    primitive_steps = (uu___334_18035.primitive_steps);
                    strong = (uu___334_18035.strong);
                    memoize_lazy = (uu___334_18035.memoize_lazy);
                    normalize_pure_lets =
                      (uu___334_18035.normalize_pure_lets)
                  }
                else
                  (let uu___335_18038 = cfg  in
                   {
                     steps =
                       (let uu___336_18041 = cfg.steps  in
                        {
                          beta = (uu___336_18041.beta);
                          iota = (uu___336_18041.iota);
                          zeta = false;
                          weak = (uu___336_18041.weak);
                          hnf = (uu___336_18041.hnf);
                          primops = (uu___336_18041.primops);
                          do_not_unfold_pure_lets =
                            (uu___336_18041.do_not_unfold_pure_lets);
                          unfold_until = (uu___336_18041.unfold_until);
                          unfold_only = (uu___336_18041.unfold_only);
                          unfold_fully = (uu___336_18041.unfold_fully);
                          unfold_attr = (uu___336_18041.unfold_attr);
                          unfold_tac = (uu___336_18041.unfold_tac);
                          pure_subterms_within_computations =
                            (uu___336_18041.pure_subterms_within_computations);
                          simplify = (uu___336_18041.simplify);
                          erase_universes = (uu___336_18041.erase_universes);
                          allow_unbound_universes =
                            (uu___336_18041.allow_unbound_universes);
                          reify_ = (uu___336_18041.reify_);
                          compress_uvars = (uu___336_18041.compress_uvars);
                          no_full_norm = (uu___336_18041.no_full_norm);
                          check_no_uvars = (uu___336_18041.check_no_uvars);
                          unmeta = (uu___336_18041.unmeta);
                          unascribe = (uu___336_18041.unascribe);
                          in_full_norm_request =
                            (uu___336_18041.in_full_norm_request);
                          weakly_reduce_scrutinee =
                            (uu___336_18041.weakly_reduce_scrutinee)
                        });
                     tcenv = (uu___335_18038.tcenv);
                     debug = (uu___335_18038.debug);
                     delta_level = (uu___335_18038.delta_level);
                     primitive_steps = (uu___335_18038.primitive_steps);
                     strong = (uu___335_18038.strong);
                     memoize_lazy = (uu___335_18038.memoize_lazy);
                     normalize_pure_lets =
                       (uu___335_18038.normalize_pure_lets)
                   })
                 in
              let metadata =
                match m with
                | FStar_Util.Inl m1 ->
                    FStar_Syntax_Syntax.Meta_monadic (m1, t1)
                | FStar_Util.Inr (m1,m') ->
                    FStar_Syntax_Syntax.Meta_monadic_lift (m1, m', t1)
                 in
              norm cfg1 env
                ((Meta (env, metadata, (head1.FStar_Syntax_Syntax.pos))) ::
                stack1) head1

and (do_reify_monadic :
  (unit -> FStar_Syntax_Syntax.term) ->
    cfg ->
      env ->
        stack_elt Prims.list ->
          FStar_Syntax_Syntax.term ->
            FStar_Syntax_Syntax.monad_name ->
              FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun fallback  ->
    fun cfg  ->
      fun env  ->
        fun stack  ->
          fun head1  ->
            fun m  ->
              fun t  ->
                let head0 = head1  in
                let head2 = FStar_Syntax_Util.unascribe head1  in
                log cfg
                  (fun uu____18075  ->
                     let uu____18076 = FStar_Syntax_Print.tag_of_term head2
                        in
                     let uu____18077 =
                       FStar_Syntax_Print.term_to_string head2  in
                     FStar_Util.print2 "Reifying: (%s) %s\n" uu____18076
                       uu____18077);
                (let head3 = FStar_Syntax_Util.unmeta_safe head2  in
                 let uu____18079 =
                   let uu____18080 = FStar_Syntax_Subst.compress head3  in
                   uu____18080.FStar_Syntax_Syntax.n  in
                 match uu____18079 with
                 | FStar_Syntax_Syntax.Tm_let ((false ,lb::[]),body) ->
                     let ed =
                       let uu____18098 =
                         FStar_TypeChecker_Env.norm_eff_name cfg.tcenv m  in
                       FStar_TypeChecker_Env.get_effect_decl cfg.tcenv
                         uu____18098
                        in
                     let uu____18099 = ed.FStar_Syntax_Syntax.bind_repr  in
                     (match uu____18099 with
                      | (uu____18100,bind_repr) ->
                          (match lb.FStar_Syntax_Syntax.lbname with
                           | FStar_Util.Inr uu____18110 ->
                               failwith
                                 "Cannot reify a top-level let binding"
                           | FStar_Util.Inl x ->
                               let is_return e =
                                 let uu____18120 =
                                   let uu____18121 =
                                     FStar_Syntax_Subst.compress e  in
                                   uu____18121.FStar_Syntax_Syntax.n  in
                                 match uu____18120 with
                                 | FStar_Syntax_Syntax.Tm_meta
                                     (e1,FStar_Syntax_Syntax.Meta_monadic
                                      (uu____18127,uu____18128))
                                     ->
                                     let uu____18137 =
                                       let uu____18138 =
                                         FStar_Syntax_Subst.compress e1  in
                                       uu____18138.FStar_Syntax_Syntax.n  in
                                     (match uu____18137 with
                                      | FStar_Syntax_Syntax.Tm_meta
                                          (e2,FStar_Syntax_Syntax.Meta_monadic_lift
                                           (uu____18144,msrc,uu____18146))
                                          when
                                          FStar_Syntax_Util.is_pure_effect
                                            msrc
                                          ->
                                          let uu____18155 =
                                            FStar_Syntax_Subst.compress e2
                                             in
                                          FStar_Pervasives_Native.Some
                                            uu____18155
                                      | uu____18156 ->
                                          FStar_Pervasives_Native.None)
                                 | uu____18157 ->
                                     FStar_Pervasives_Native.None
                                  in
                               let uu____18158 =
                                 is_return lb.FStar_Syntax_Syntax.lbdef  in
                               (match uu____18158 with
                                | FStar_Pervasives_Native.Some e ->
                                    let lb1 =
                                      let uu___337_18163 = lb  in
                                      {
                                        FStar_Syntax_Syntax.lbname =
                                          (uu___337_18163.FStar_Syntax_Syntax.lbname);
                                        FStar_Syntax_Syntax.lbunivs =
                                          (uu___337_18163.FStar_Syntax_Syntax.lbunivs);
                                        FStar_Syntax_Syntax.lbtyp =
                                          (uu___337_18163.FStar_Syntax_Syntax.lbtyp);
                                        FStar_Syntax_Syntax.lbeff =
                                          FStar_Parser_Const.effect_PURE_lid;
                                        FStar_Syntax_Syntax.lbdef = e;
                                        FStar_Syntax_Syntax.lbattrs =
                                          (uu___337_18163.FStar_Syntax_Syntax.lbattrs);
                                        FStar_Syntax_Syntax.lbpos =
                                          (uu___337_18163.FStar_Syntax_Syntax.lbpos)
                                      }  in
                                    let uu____18164 = FStar_List.tl stack  in
                                    let uu____18165 =
                                      let uu____18166 =
                                        let uu____18173 =
                                          let uu____18174 =
                                            let uu____18187 =
                                              FStar_Syntax_Util.mk_reify body
                                               in
                                            ((false, [lb1]), uu____18187)  in
                                          FStar_Syntax_Syntax.Tm_let
                                            uu____18174
                                           in
                                        FStar_Syntax_Syntax.mk uu____18173
                                         in
                                      uu____18166
                                        FStar_Pervasives_Native.None
                                        head3.FStar_Syntax_Syntax.pos
                                       in
                                    norm cfg env uu____18164 uu____18165
                                | FStar_Pervasives_Native.None  ->
                                    let uu____18203 =
                                      let uu____18204 = is_return body  in
                                      match uu____18204 with
                                      | FStar_Pervasives_Native.Some
                                          {
                                            FStar_Syntax_Syntax.n =
                                              FStar_Syntax_Syntax.Tm_bvar y;
                                            FStar_Syntax_Syntax.pos =
                                              uu____18208;
                                            FStar_Syntax_Syntax.vars =
                                              uu____18209;_}
                                          -> FStar_Syntax_Syntax.bv_eq x y
                                      | uu____18212 -> false  in
                                    if uu____18203
                                    then
                                      norm cfg env stack
                                        lb.FStar_Syntax_Syntax.lbdef
                                    else
                                      (let rng =
                                         head3.FStar_Syntax_Syntax.pos  in
                                       let head4 =
                                         FStar_All.pipe_left
                                           FStar_Syntax_Util.mk_reify
                                           lb.FStar_Syntax_Syntax.lbdef
                                          in
                                       let body1 =
                                         FStar_All.pipe_left
                                           FStar_Syntax_Util.mk_reify body
                                          in
                                       let body_rc =
                                         {
                                           FStar_Syntax_Syntax.residual_effect
                                             = m;
                                           FStar_Syntax_Syntax.residual_typ =
                                             (FStar_Pervasives_Native.Some t);
                                           FStar_Syntax_Syntax.residual_flags
                                             = []
                                         }  in
                                       let body2 =
                                         let uu____18233 =
                                           let uu____18240 =
                                             let uu____18241 =
                                               let uu____18258 =
                                                 let uu____18265 =
                                                   FStar_Syntax_Syntax.mk_binder
                                                     x
                                                    in
                                                 [uu____18265]  in
                                               (uu____18258, body1,
                                                 (FStar_Pervasives_Native.Some
                                                    body_rc))
                                                in
                                             FStar_Syntax_Syntax.Tm_abs
                                               uu____18241
                                              in
                                           FStar_Syntax_Syntax.mk uu____18240
                                            in
                                         uu____18233
                                           FStar_Pervasives_Native.None
                                           body1.FStar_Syntax_Syntax.pos
                                          in
                                       let close1 = closure_as_term cfg env
                                          in
                                       let bind_inst =
                                         let uu____18299 =
                                           let uu____18300 =
                                             FStar_Syntax_Subst.compress
                                               bind_repr
                                              in
                                           uu____18300.FStar_Syntax_Syntax.n
                                            in
                                         match uu____18299 with
                                         | FStar_Syntax_Syntax.Tm_uinst
                                             (bind1,uu____18306::uu____18307::[])
                                             ->
                                             let uu____18312 =
                                               let uu____18319 =
                                                 let uu____18320 =
                                                   let uu____18327 =
                                                     let uu____18328 =
                                                       let uu____18329 =
                                                         close1
                                                           lb.FStar_Syntax_Syntax.lbtyp
                                                          in
                                                       (cfg.tcenv).FStar_TypeChecker_Env.universe_of
                                                         cfg.tcenv
                                                         uu____18329
                                                        in
                                                     let uu____18330 =
                                                       let uu____18333 =
                                                         let uu____18334 =
                                                           close1 t  in
                                                         (cfg.tcenv).FStar_TypeChecker_Env.universe_of
                                                           cfg.tcenv
                                                           uu____18334
                                                          in
                                                       [uu____18333]  in
                                                     uu____18328 ::
                                                       uu____18330
                                                      in
                                                   (bind1, uu____18327)  in
                                                 FStar_Syntax_Syntax.Tm_uinst
                                                   uu____18320
                                                  in
                                               FStar_Syntax_Syntax.mk
                                                 uu____18319
                                                in
                                             uu____18312
                                               FStar_Pervasives_Native.None
                                               rng
                                         | uu____18340 ->
                                             failwith
                                               "NIY : Reification of indexed effects"
                                          in
                                       let maybe_range_arg =
                                         let uu____18352 =
                                           FStar_Util.for_some
                                             (FStar_Syntax_Util.attr_eq
                                                FStar_Syntax_Util.dm4f_bind_range_attr)
                                             ed.FStar_Syntax_Syntax.eff_attrs
                                            in
                                         if uu____18352
                                         then
                                           let uu____18361 =
                                             let uu____18368 =
                                               FStar_Syntax_Embeddings.embed
                                                 FStar_Syntax_Embeddings.e_range
                                                 lb.FStar_Syntax_Syntax.lbpos
                                                 lb.FStar_Syntax_Syntax.lbpos
                                                in
                                             FStar_Syntax_Syntax.as_arg
                                               uu____18368
                                              in
                                           let uu____18369 =
                                             let uu____18378 =
                                               let uu____18385 =
                                                 FStar_Syntax_Embeddings.embed
                                                   FStar_Syntax_Embeddings.e_range
                                                   body2.FStar_Syntax_Syntax.pos
                                                   body2.FStar_Syntax_Syntax.pos
                                                  in
                                               FStar_Syntax_Syntax.as_arg
                                                 uu____18385
                                                in
                                             [uu____18378]  in
                                           uu____18361 :: uu____18369
                                         else []  in
                                       let reified =
                                         let uu____18414 =
                                           let uu____18421 =
                                             let uu____18422 =
                                               let uu____18437 =
                                                 let uu____18446 =
                                                   let uu____18455 =
                                                     FStar_Syntax_Syntax.as_arg
                                                       lb.FStar_Syntax_Syntax.lbtyp
                                                      in
                                                   let uu____18462 =
                                                     let uu____18471 =
                                                       FStar_Syntax_Syntax.as_arg
                                                         t
                                                        in
                                                     [uu____18471]  in
                                                   uu____18455 :: uu____18462
                                                    in
                                                 let uu____18496 =
                                                   let uu____18505 =
                                                     let uu____18514 =
                                                       FStar_Syntax_Syntax.as_arg
                                                         FStar_Syntax_Syntax.tun
                                                        in
                                                     let uu____18521 =
                                                       let uu____18530 =
                                                         FStar_Syntax_Syntax.as_arg
                                                           head4
                                                          in
                                                       let uu____18537 =
                                                         let uu____18546 =
                                                           FStar_Syntax_Syntax.as_arg
                                                             FStar_Syntax_Syntax.tun
                                                            in
                                                         let uu____18553 =
                                                           let uu____18562 =
                                                             FStar_Syntax_Syntax.as_arg
                                                               body2
                                                              in
                                                           [uu____18562]  in
                                                         uu____18546 ::
                                                           uu____18553
                                                          in
                                                       uu____18530 ::
                                                         uu____18537
                                                        in
                                                     uu____18514 ::
                                                       uu____18521
                                                      in
                                                   FStar_List.append
                                                     maybe_range_arg
                                                     uu____18505
                                                    in
                                                 FStar_List.append
                                                   uu____18446 uu____18496
                                                  in
                                               (bind_inst, uu____18437)  in
                                             FStar_Syntax_Syntax.Tm_app
                                               uu____18422
                                              in
                                           FStar_Syntax_Syntax.mk uu____18421
                                            in
                                         uu____18414
                                           FStar_Pervasives_Native.None rng
                                          in
                                       log cfg
                                         (fun uu____18628  ->
                                            let uu____18629 =
                                              FStar_Syntax_Print.term_to_string
                                                head0
                                               in
                                            let uu____18630 =
                                              FStar_Syntax_Print.term_to_string
                                                reified
                                               in
                                            FStar_Util.print2
                                              "Reified (1) <%s> to %s\n"
                                              uu____18629 uu____18630);
                                       (let uu____18631 = FStar_List.tl stack
                                           in
                                        norm cfg env uu____18631 reified)))))
                 | FStar_Syntax_Syntax.Tm_app (head_app,args) ->
                     let ed =
                       let uu____18655 =
                         FStar_TypeChecker_Env.norm_eff_name cfg.tcenv m  in
                       FStar_TypeChecker_Env.get_effect_decl cfg.tcenv
                         uu____18655
                        in
                     let uu____18656 = ed.FStar_Syntax_Syntax.bind_repr  in
                     (match uu____18656 with
                      | (uu____18657,bind_repr) ->
                          let maybe_unfold_action head4 =
                            let maybe_extract_fv t1 =
                              let t2 =
                                let uu____18694 =
                                  let uu____18695 =
                                    FStar_Syntax_Subst.compress t1  in
                                  uu____18695.FStar_Syntax_Syntax.n  in
                                match uu____18694 with
                                | FStar_Syntax_Syntax.Tm_uinst
                                    (t2,uu____18699) -> t2
                                | uu____18704 -> head4  in
                              let uu____18705 =
                                let uu____18706 =
                                  FStar_Syntax_Subst.compress t2  in
                                uu____18706.FStar_Syntax_Syntax.n  in
                              match uu____18705 with
                              | FStar_Syntax_Syntax.Tm_fvar x ->
                                  FStar_Pervasives_Native.Some x
                              | uu____18712 -> FStar_Pervasives_Native.None
                               in
                            let uu____18713 = maybe_extract_fv head4  in
                            match uu____18713 with
                            | FStar_Pervasives_Native.Some x when
                                let uu____18723 =
                                  FStar_Syntax_Syntax.lid_of_fv x  in
                                FStar_TypeChecker_Env.is_action cfg.tcenv
                                  uu____18723
                                ->
                                let head5 = norm cfg env [] head4  in
                                let action_unfolded =
                                  let uu____18728 = maybe_extract_fv head5
                                     in
                                  match uu____18728 with
                                  | FStar_Pervasives_Native.Some uu____18733
                                      -> FStar_Pervasives_Native.Some true
                                  | uu____18734 ->
                                      FStar_Pervasives_Native.Some false
                                   in
                                (head5, action_unfolded)
                            | uu____18739 ->
                                (head4, FStar_Pervasives_Native.None)
                             in
                          ((let is_arg_impure uu____18754 =
                              match uu____18754 with
                              | (e,q) ->
                                  let uu____18761 =
                                    let uu____18762 =
                                      FStar_Syntax_Subst.compress e  in
                                    uu____18762.FStar_Syntax_Syntax.n  in
                                  (match uu____18761 with
                                   | FStar_Syntax_Syntax.Tm_meta
                                       (e0,FStar_Syntax_Syntax.Meta_monadic_lift
                                        (m1,m2,t'))
                                       ->
                                       let uu____18777 =
                                         FStar_Syntax_Util.is_pure_effect m1
                                          in
                                       Prims.op_Negation uu____18777
                                   | uu____18778 -> false)
                               in
                            let uu____18779 =
                              let uu____18780 =
                                let uu____18789 =
                                  FStar_Syntax_Syntax.as_arg head_app  in
                                uu____18789 :: args  in
                              FStar_Util.for_some is_arg_impure uu____18780
                               in
                            if uu____18779
                            then
                              let uu____18808 =
                                let uu____18809 =
                                  FStar_Syntax_Print.term_to_string head3  in
                                FStar_Util.format1
                                  "Incompatibility between typechecker and normalizer; this monadic application contains impure terms %s\n"
                                  uu____18809
                                 in
                              failwith uu____18808
                            else ());
                           (let uu____18811 = maybe_unfold_action head_app
                               in
                            match uu____18811 with
                            | (head_app1,found_action) ->
                                let mk1 tm =
                                  FStar_Syntax_Syntax.mk tm
                                    FStar_Pervasives_Native.None
                                    head3.FStar_Syntax_Syntax.pos
                                   in
                                let body =
                                  mk1
                                    (FStar_Syntax_Syntax.Tm_app
                                       (head_app1, args))
                                   in
                                let body1 =
                                  match found_action with
                                  | FStar_Pervasives_Native.None  ->
                                      FStar_Syntax_Util.mk_reify body
                                  | FStar_Pervasives_Native.Some (false ) ->
                                      mk1
                                        (FStar_Syntax_Syntax.Tm_meta
                                           (body,
                                             (FStar_Syntax_Syntax.Meta_monadic
                                                (m, t))))
                                  | FStar_Pervasives_Native.Some (true ) ->
                                      body
                                   in
                                (log cfg
                                   (fun uu____18854  ->
                                      let uu____18855 =
                                        FStar_Syntax_Print.term_to_string
                                          head0
                                         in
                                      let uu____18856 =
                                        FStar_Syntax_Print.term_to_string
                                          body1
                                         in
                                      FStar_Util.print2
                                        "Reified (2) <%s> to %s\n"
                                        uu____18855 uu____18856);
                                 (let uu____18857 = FStar_List.tl stack  in
                                  norm cfg env uu____18857 body1)))))
                 | FStar_Syntax_Syntax.Tm_meta
                     (e,FStar_Syntax_Syntax.Meta_monadic uu____18859) ->
                     do_reify_monadic fallback cfg env stack e m t
                 | FStar_Syntax_Syntax.Tm_meta
                     (e,FStar_Syntax_Syntax.Meta_monadic_lift (msrc,mtgt,t'))
                     ->
                     let lifted =
                       let uu____18883 = closure_as_term cfg env t'  in
                       reify_lift cfg e msrc mtgt uu____18883  in
                     (log cfg
                        (fun uu____18887  ->
                           let uu____18888 =
                             FStar_Syntax_Print.term_to_string lifted  in
                           FStar_Util.print1 "Reified lift to (2): %s\n"
                             uu____18888);
                      (let uu____18889 = FStar_List.tl stack  in
                       norm cfg env uu____18889 lifted))
                 | FStar_Syntax_Syntax.Tm_match (e,branches) ->
                     let branches1 =
                       FStar_All.pipe_right branches
                         (FStar_List.map
                            (fun uu____19010  ->
                               match uu____19010 with
                               | (pat,wopt,tm) ->
                                   let uu____19058 =
                                     FStar_Syntax_Util.mk_reify tm  in
                                   (pat, wopt, uu____19058)))
                        in
                     let tm =
                       mk (FStar_Syntax_Syntax.Tm_match (e, branches1))
                         head3.FStar_Syntax_Syntax.pos
                        in
                     let uu____19090 = FStar_List.tl stack  in
                     norm cfg env uu____19090 tm
                 | uu____19091 -> fallback ())

and (reify_lift :
  cfg ->
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      FStar_Syntax_Syntax.monad_name ->
        FStar_Syntax_Syntax.monad_name ->
          FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun e  ->
      fun msrc  ->
        fun mtgt  ->
          fun t  ->
            let env = cfg.tcenv  in
            log cfg
              (fun uu____19105  ->
                 let uu____19106 = FStar_Ident.string_of_lid msrc  in
                 let uu____19107 = FStar_Ident.string_of_lid mtgt  in
                 let uu____19108 = FStar_Syntax_Print.term_to_string e  in
                 FStar_Util.print3 "Reifying lift %s -> %s: %s\n" uu____19106
                   uu____19107 uu____19108);
            (let uu____19109 =
               (FStar_Syntax_Util.is_pure_effect msrc) ||
                 (FStar_Syntax_Util.is_div_effect msrc)
                in
             if uu____19109
             then
               let ed =
                 let uu____19111 =
                   FStar_TypeChecker_Env.norm_eff_name cfg.tcenv mtgt  in
                 FStar_TypeChecker_Env.get_effect_decl env uu____19111  in
               let uu____19112 = ed.FStar_Syntax_Syntax.return_repr  in
               match uu____19112 with
               | (uu____19113,return_repr) ->
                   let return_inst =
                     let uu____19126 =
                       let uu____19127 =
                         FStar_Syntax_Subst.compress return_repr  in
                       uu____19127.FStar_Syntax_Syntax.n  in
                     match uu____19126 with
                     | FStar_Syntax_Syntax.Tm_uinst
                         (return_tm,uu____19133::[]) ->
                         let uu____19138 =
                           let uu____19145 =
                             let uu____19146 =
                               let uu____19153 =
                                 let uu____19154 =
                                   env.FStar_TypeChecker_Env.universe_of env
                                     t
                                    in
                                 [uu____19154]  in
                               (return_tm, uu____19153)  in
                             FStar_Syntax_Syntax.Tm_uinst uu____19146  in
                           FStar_Syntax_Syntax.mk uu____19145  in
                         uu____19138 FStar_Pervasives_Native.None
                           e.FStar_Syntax_Syntax.pos
                     | uu____19160 ->
                         failwith "NIY : Reification of indexed effects"
                      in
                   let uu____19163 =
                     let uu____19170 =
                       let uu____19171 =
                         let uu____19186 =
                           let uu____19195 = FStar_Syntax_Syntax.as_arg t  in
                           let uu____19202 =
                             let uu____19211 = FStar_Syntax_Syntax.as_arg e
                                in
                             [uu____19211]  in
                           uu____19195 :: uu____19202  in
                         (return_inst, uu____19186)  in
                       FStar_Syntax_Syntax.Tm_app uu____19171  in
                     FStar_Syntax_Syntax.mk uu____19170  in
                   uu____19163 FStar_Pervasives_Native.None
                     e.FStar_Syntax_Syntax.pos
             else
               (let uu____19250 =
                  FStar_TypeChecker_Env.monad_leq env msrc mtgt  in
                match uu____19250 with
                | FStar_Pervasives_Native.None  ->
                    let uu____19253 =
                      let uu____19254 = FStar_Ident.text_of_lid msrc  in
                      let uu____19255 = FStar_Ident.text_of_lid mtgt  in
                      FStar_Util.format2
                        "Impossible : trying to reify a lift between unrelated effects (%s and %s)"
                        uu____19254 uu____19255
                       in
                    failwith uu____19253
                | FStar_Pervasives_Native.Some
                    { FStar_TypeChecker_Env.msource = uu____19256;
                      FStar_TypeChecker_Env.mtarget = uu____19257;
                      FStar_TypeChecker_Env.mlift =
                        { FStar_TypeChecker_Env.mlift_wp = uu____19258;
                          FStar_TypeChecker_Env.mlift_term =
                            FStar_Pervasives_Native.None ;_};_}
                    ->
                    let uu____19280 =
                      let uu____19281 = FStar_Ident.text_of_lid msrc  in
                      let uu____19282 = FStar_Ident.text_of_lid mtgt  in
                      FStar_Util.format2
                        "Impossible : trying to reify a non-reifiable lift (from %s to %s)"
                        uu____19281 uu____19282
                       in
                    failwith uu____19280
                | FStar_Pervasives_Native.Some
                    { FStar_TypeChecker_Env.msource = uu____19283;
                      FStar_TypeChecker_Env.mtarget = uu____19284;
                      FStar_TypeChecker_Env.mlift =
                        { FStar_TypeChecker_Env.mlift_wp = uu____19285;
                          FStar_TypeChecker_Env.mlift_term =
                            FStar_Pervasives_Native.Some lift;_};_}
                    ->
                    let uu____19320 =
                      env.FStar_TypeChecker_Env.universe_of env t  in
                    let uu____19321 = FStar_Syntax_Util.mk_reify e  in
                    lift uu____19320 t FStar_Syntax_Syntax.tun uu____19321))

and (norm_pattern_args :
  cfg ->
    env ->
      (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.aqual)
        FStar_Pervasives_Native.tuple2 Prims.list Prims.list ->
        (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.aqual)
          FStar_Pervasives_Native.tuple2 Prims.list Prims.list)
  =
  fun cfg  ->
    fun env  ->
      fun args  ->
        FStar_All.pipe_right args
          (FStar_List.map
             (FStar_List.map
                (fun uu____19377  ->
                   match uu____19377 with
                   | (a,imp) ->
                       let uu____19388 = norm cfg env [] a  in
                       (uu____19388, imp))))

and (norm_comp :
  cfg -> env -> FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp) =
  fun cfg  ->
    fun env  ->
      fun comp  ->
        log cfg
          (fun uu____19396  ->
             let uu____19397 = FStar_Syntax_Print.comp_to_string comp  in
             let uu____19398 =
               FStar_Util.string_of_int (FStar_List.length env)  in
             FStar_Util.print2 ">>> %s\nNormComp with with %s env elements"
               uu____19397 uu____19398);
        (match comp.FStar_Syntax_Syntax.n with
         | FStar_Syntax_Syntax.Total (t,uopt) ->
             let t1 = norm cfg env [] t  in
             let uopt1 =
               match uopt with
               | FStar_Pervasives_Native.Some u ->
                   let uu____19422 = norm_universe cfg env u  in
                   FStar_All.pipe_left
                     (fun _0_18  -> FStar_Pervasives_Native.Some _0_18)
                     uu____19422
               | FStar_Pervasives_Native.None  ->
                   FStar_Pervasives_Native.None
                in
             let uu___338_19425 = comp  in
             {
               FStar_Syntax_Syntax.n =
                 (FStar_Syntax_Syntax.Total (t1, uopt1));
               FStar_Syntax_Syntax.pos =
                 (uu___338_19425.FStar_Syntax_Syntax.pos);
               FStar_Syntax_Syntax.vars =
                 (uu___338_19425.FStar_Syntax_Syntax.vars)
             }
         | FStar_Syntax_Syntax.GTotal (t,uopt) ->
             let t1 = norm cfg env [] t  in
             let uopt1 =
               match uopt with
               | FStar_Pervasives_Native.Some u ->
                   let uu____19447 = norm_universe cfg env u  in
                   FStar_All.pipe_left
                     (fun _0_19  -> FStar_Pervasives_Native.Some _0_19)
                     uu____19447
               | FStar_Pervasives_Native.None  ->
                   FStar_Pervasives_Native.None
                in
             let uu___339_19450 = comp  in
             {
               FStar_Syntax_Syntax.n =
                 (FStar_Syntax_Syntax.GTotal (t1, uopt1));
               FStar_Syntax_Syntax.pos =
                 (uu___339_19450.FStar_Syntax_Syntax.pos);
               FStar_Syntax_Syntax.vars =
                 (uu___339_19450.FStar_Syntax_Syntax.vars)
             }
         | FStar_Syntax_Syntax.Comp ct ->
             let norm_args =
               FStar_List.mapi
                 (fun idx  ->
                    fun uu____19487  ->
                      match uu____19487 with
                      | (a,i) ->
                          let uu____19498 = norm cfg env [] a  in
                          (uu____19498, i))
                in
             let effect_args = norm_args ct.FStar_Syntax_Syntax.effect_args
                in
             let flags1 =
               FStar_All.pipe_right ct.FStar_Syntax_Syntax.flags
                 (FStar_List.map
                    (fun uu___252_19516  ->
                       match uu___252_19516 with
                       | FStar_Syntax_Syntax.DECREASES t ->
                           let uu____19520 = norm cfg env [] t  in
                           FStar_Syntax_Syntax.DECREASES uu____19520
                       | f -> f))
                in
             let comp_univs =
               FStar_List.map (norm_universe cfg env)
                 ct.FStar_Syntax_Syntax.comp_univs
                in
             let result_typ =
               norm cfg env [] ct.FStar_Syntax_Syntax.result_typ  in
             let uu___340_19528 = comp  in
             {
               FStar_Syntax_Syntax.n =
                 (FStar_Syntax_Syntax.Comp
                    (let uu___341_19531 = ct  in
                     {
                       FStar_Syntax_Syntax.comp_univs = comp_univs;
                       FStar_Syntax_Syntax.effect_name =
                         (uu___341_19531.FStar_Syntax_Syntax.effect_name);
                       FStar_Syntax_Syntax.result_typ = result_typ;
                       FStar_Syntax_Syntax.effect_args = effect_args;
                       FStar_Syntax_Syntax.flags = flags1
                     }));
               FStar_Syntax_Syntax.pos =
                 (uu___340_19528.FStar_Syntax_Syntax.pos);
               FStar_Syntax_Syntax.vars =
                 (uu___340_19528.FStar_Syntax_Syntax.vars)
             })

and (norm_binder :
  cfg -> env -> FStar_Syntax_Syntax.binder -> FStar_Syntax_Syntax.binder) =
  fun cfg  ->
    fun env  ->
      fun uu____19534  ->
        match uu____19534 with
        | (x,imp) ->
            let uu____19537 =
              let uu___342_19538 = x  in
              let uu____19539 = norm cfg env [] x.FStar_Syntax_Syntax.sort
                 in
              {
                FStar_Syntax_Syntax.ppname =
                  (uu___342_19538.FStar_Syntax_Syntax.ppname);
                FStar_Syntax_Syntax.index =
                  (uu___342_19538.FStar_Syntax_Syntax.index);
                FStar_Syntax_Syntax.sort = uu____19539
              }  in
            (uu____19537, imp)

and (norm_binders :
  cfg -> env -> FStar_Syntax_Syntax.binders -> FStar_Syntax_Syntax.binders) =
  fun cfg  ->
    fun env  ->
      fun bs  ->
        let uu____19545 =
          FStar_List.fold_left
            (fun uu____19579  ->
               fun b  ->
                 match uu____19579 with
                 | (nbs',env1) ->
                     let b1 = norm_binder cfg env1 b  in
                     ((b1 :: nbs'), (dummy :: env1))) ([], env) bs
           in
        match uu____19545 with | (nbs,uu____19659) -> FStar_List.rev nbs

and (norm_lcomp_opt :
  cfg ->
    env ->
      FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option ->
        FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option)
  =
  fun cfg  ->
    fun env  ->
      fun lopt  ->
        match lopt with
        | FStar_Pervasives_Native.Some rc ->
            let flags1 =
              filter_out_lcomp_cflags rc.FStar_Syntax_Syntax.residual_flags
               in
            let uu____19691 =
              let uu___343_19692 = rc  in
              let uu____19693 =
                FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ
                  (norm cfg env [])
                 in
              {
                FStar_Syntax_Syntax.residual_effect =
                  (uu___343_19692.FStar_Syntax_Syntax.residual_effect);
                FStar_Syntax_Syntax.residual_typ = uu____19693;
                FStar_Syntax_Syntax.residual_flags =
                  (uu___343_19692.FStar_Syntax_Syntax.residual_flags)
              }  in
            FStar_Pervasives_Native.Some uu____19691
        | uu____19702 -> lopt

and (maybe_simplify :
  cfg ->
    ((FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
       FStar_Pervasives_Native.tuple2 FStar_Pervasives_Native.option,
      closure) FStar_Pervasives_Native.tuple2 Prims.list ->
      stack -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun tm  ->
          let tm' = maybe_simplify_aux cfg env stack tm  in
          if (cfg.debug).b380
          then
            (let uu____19723 = FStar_Syntax_Print.term_to_string tm  in
             let uu____19724 = FStar_Syntax_Print.term_to_string tm'  in
             FStar_Util.print3 "%sSimplified\n\t%s to\n\t%s\n"
               (if (cfg.steps).simplify then "" else "NOT ") uu____19723
               uu____19724)
          else ();
          tm'

and (maybe_simplify_aux :
  cfg ->
    ((FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
       FStar_Pervasives_Native.tuple2 FStar_Pervasives_Native.option,
      closure) FStar_Pervasives_Native.tuple2 Prims.list ->
      stack -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun tm  ->
          let tm1 = reduce_primops cfg env stack tm  in
          let uu____19746 =
            FStar_All.pipe_left Prims.op_Negation (cfg.steps).simplify  in
          if uu____19746
          then tm1
          else
            (let w t =
               let uu___344_19760 = t  in
               {
                 FStar_Syntax_Syntax.n =
                   (uu___344_19760.FStar_Syntax_Syntax.n);
                 FStar_Syntax_Syntax.pos = (tm1.FStar_Syntax_Syntax.pos);
                 FStar_Syntax_Syntax.vars =
                   (uu___344_19760.FStar_Syntax_Syntax.vars)
               }  in
             let simp_t t =
               let uu____19771 =
                 let uu____19772 = FStar_Syntax_Util.unmeta t  in
                 uu____19772.FStar_Syntax_Syntax.n  in
               match uu____19771 with
               | FStar_Syntax_Syntax.Tm_fvar fv when
                   FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.true_lid
                   -> FStar_Pervasives_Native.Some true
               | FStar_Syntax_Syntax.Tm_fvar fv when
                   FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.false_lid
                   -> FStar_Pervasives_Native.Some false
               | uu____19779 -> FStar_Pervasives_Native.None  in
             let rec args_are_binders args bs =
               match (args, bs) with
               | ((t,uu____19828)::args1,(bv,uu____19831)::bs1) ->
                   let uu____19865 =
                     let uu____19866 = FStar_Syntax_Subst.compress t  in
                     uu____19866.FStar_Syntax_Syntax.n  in
                   (match uu____19865 with
                    | FStar_Syntax_Syntax.Tm_name bv' ->
                        (FStar_Syntax_Syntax.bv_eq bv bv') &&
                          (args_are_binders args1 bs1)
                    | uu____19870 -> false)
               | ([],[]) -> true
               | (uu____19891,uu____19892) -> false  in
             let is_applied bs t =
               if (cfg.debug).wpe
               then
                 (let uu____19933 = FStar_Syntax_Print.term_to_string t  in
                  let uu____19934 = FStar_Syntax_Print.tag_of_term t  in
                  FStar_Util.print2 "WPE> is_applied %s -- %s\n" uu____19933
                    uu____19934)
               else ();
               (let uu____19936 = FStar_Syntax_Util.head_and_args' t  in
                match uu____19936 with
                | (hd1,args) ->
                    let uu____19969 =
                      let uu____19970 = FStar_Syntax_Subst.compress hd1  in
                      uu____19970.FStar_Syntax_Syntax.n  in
                    (match uu____19969 with
                     | FStar_Syntax_Syntax.Tm_name bv when
                         args_are_binders args bs ->
                         (if (cfg.debug).wpe
                          then
                            (let uu____19977 =
                               FStar_Syntax_Print.term_to_string t  in
                             let uu____19978 =
                               FStar_Syntax_Print.bv_to_string bv  in
                             let uu____19979 =
                               FStar_Syntax_Print.term_to_string hd1  in
                             FStar_Util.print3
                               "WPE> got it\n>>>>top = %s\n>>>>b = %s\n>>>>hd = %s\n"
                               uu____19977 uu____19978 uu____19979)
                          else ();
                          FStar_Pervasives_Native.Some bv)
                     | uu____19981 -> FStar_Pervasives_Native.None))
                in
             let is_applied_maybe_squashed bs t =
               if (cfg.debug).wpe
               then
                 (let uu____19998 = FStar_Syntax_Print.term_to_string t  in
                  let uu____19999 = FStar_Syntax_Print.tag_of_term t  in
                  FStar_Util.print2
                    "WPE> is_applied_maybe_squashed %s -- %s\n" uu____19998
                    uu____19999)
               else ();
               (let uu____20001 = FStar_Syntax_Util.is_squash t  in
                match uu____20001 with
                | FStar_Pervasives_Native.Some (uu____20012,t') ->
                    is_applied bs t'
                | uu____20024 ->
                    let uu____20033 = FStar_Syntax_Util.is_auto_squash t  in
                    (match uu____20033 with
                     | FStar_Pervasives_Native.Some (uu____20044,t') ->
                         is_applied bs t'
                     | uu____20056 -> is_applied bs t))
                in
             let is_quantified_const bv phi =
               let uu____20080 =
                 FStar_Syntax_Util.destruct_typ_as_formula phi  in
               match uu____20080 with
               | FStar_Pervasives_Native.Some (FStar_Syntax_Util.BaseConn
                   (lid,(p,uu____20087)::(q,uu____20089)::[])) when
                   FStar_Ident.lid_equals lid FStar_Parser_Const.imp_lid ->
                   (if (cfg.debug).wpe
                    then
                      (let uu____20117 = FStar_Syntax_Print.term_to_string p
                          in
                       let uu____20118 = FStar_Syntax_Print.term_to_string q
                          in
                       FStar_Util.print2 "WPE> p = (%s); q = (%s)\n"
                         uu____20117 uu____20118)
                    else ();
                    (let uu____20120 =
                       FStar_Syntax_Util.destruct_typ_as_formula p  in
                     match uu____20120 with
                     | FStar_Pervasives_Native.None  ->
                         let uu____20125 =
                           let uu____20126 = FStar_Syntax_Subst.compress p
                              in
                           uu____20126.FStar_Syntax_Syntax.n  in
                         (match uu____20125 with
                          | FStar_Syntax_Syntax.Tm_bvar bv' when
                              FStar_Syntax_Syntax.bv_eq bv bv' ->
                              (if (cfg.debug).wpe
                               then FStar_Util.print_string "WPE> Case 1\n"
                               else ();
                               (let uu____20134 =
                                  FStar_Syntax_Subst.subst
                                    [FStar_Syntax_Syntax.NT
                                       (bv, FStar_Syntax_Util.t_true)] q
                                   in
                                FStar_Pervasives_Native.Some uu____20134))
                          | uu____20137 -> FStar_Pervasives_Native.None)
                     | FStar_Pervasives_Native.Some
                         (FStar_Syntax_Util.BaseConn
                         (lid1,(p1,uu____20140)::[])) when
                         FStar_Ident.lid_equals lid1
                           FStar_Parser_Const.not_lid
                         ->
                         let uu____20157 =
                           let uu____20158 = FStar_Syntax_Subst.compress p1
                              in
                           uu____20158.FStar_Syntax_Syntax.n  in
                         (match uu____20157 with
                          | FStar_Syntax_Syntax.Tm_bvar bv' when
                              FStar_Syntax_Syntax.bv_eq bv bv' ->
                              (if (cfg.debug).wpe
                               then FStar_Util.print_string "WPE> Case 2\n"
                               else ();
                               (let uu____20166 =
                                  FStar_Syntax_Subst.subst
                                    [FStar_Syntax_Syntax.NT
                                       (bv, FStar_Syntax_Util.t_false)] q
                                   in
                                FStar_Pervasives_Native.Some uu____20166))
                          | uu____20169 -> FStar_Pervasives_Native.None)
                     | FStar_Pervasives_Native.Some (FStar_Syntax_Util.QAll
                         (bs,pats,phi1)) ->
                         let uu____20173 =
                           FStar_Syntax_Util.destruct_typ_as_formula phi1  in
                         (match uu____20173 with
                          | FStar_Pervasives_Native.None  ->
                              let uu____20178 =
                                is_applied_maybe_squashed bs phi1  in
                              (match uu____20178 with
                               | FStar_Pervasives_Native.Some bv' when
                                   FStar_Syntax_Syntax.bv_eq bv bv' ->
                                   (if (cfg.debug).wpe
                                    then
                                      FStar_Util.print_string "WPE> Case 3\n"
                                    else ();
                                    (let ftrue =
                                       FStar_Syntax_Util.abs bs
                                         FStar_Syntax_Util.t_true
                                         (FStar_Pervasives_Native.Some
                                            (FStar_Syntax_Util.residual_tot
                                               FStar_Syntax_Util.ktype0))
                                        in
                                     let uu____20189 =
                                       FStar_Syntax_Subst.subst
                                         [FStar_Syntax_Syntax.NT (bv, ftrue)]
                                         q
                                        in
                                     FStar_Pervasives_Native.Some uu____20189))
                               | uu____20192 -> FStar_Pervasives_Native.None)
                          | FStar_Pervasives_Native.Some
                              (FStar_Syntax_Util.BaseConn
                              (lid1,(p1,uu____20197)::[])) when
                              FStar_Ident.lid_equals lid1
                                FStar_Parser_Const.not_lid
                              ->
                              let uu____20214 =
                                is_applied_maybe_squashed bs p1  in
                              (match uu____20214 with
                               | FStar_Pervasives_Native.Some bv' when
                                   FStar_Syntax_Syntax.bv_eq bv bv' ->
                                   (if (cfg.debug).wpe
                                    then
                                      FStar_Util.print_string "WPE> Case 4\n"
                                    else ();
                                    (let ffalse =
                                       FStar_Syntax_Util.abs bs
                                         FStar_Syntax_Util.t_false
                                         (FStar_Pervasives_Native.Some
                                            (FStar_Syntax_Util.residual_tot
                                               FStar_Syntax_Util.ktype0))
                                        in
                                     let uu____20225 =
                                       FStar_Syntax_Subst.subst
                                         [FStar_Syntax_Syntax.NT (bv, ffalse)]
                                         q
                                        in
                                     FStar_Pervasives_Native.Some uu____20225))
                               | uu____20228 -> FStar_Pervasives_Native.None)
                          | uu____20231 -> FStar_Pervasives_Native.None)
                     | uu____20234 -> FStar_Pervasives_Native.None))
               | uu____20237 -> FStar_Pervasives_Native.None  in
             let is_forall_const phi =
               let uu____20250 =
                 FStar_Syntax_Util.destruct_typ_as_formula phi  in
               match uu____20250 with
               | FStar_Pervasives_Native.Some (FStar_Syntax_Util.QAll
                   ((bv,uu____20256)::[],uu____20257,phi')) ->
                   (if (cfg.debug).wpe
                    then
                      (let uu____20268 = FStar_Syntax_Print.bv_to_string bv
                          in
                       let uu____20269 =
                         FStar_Syntax_Print.term_to_string phi'  in
                       FStar_Util.print2 "WPE> QAll [%s] %s\n" uu____20268
                         uu____20269)
                    else ();
                    is_quantified_const bv phi')
               | uu____20271 -> FStar_Pervasives_Native.None  in
             let is_const_match phi =
               let uu____20284 =
                 let uu____20285 = FStar_Syntax_Subst.compress phi  in
                 uu____20285.FStar_Syntax_Syntax.n  in
               match uu____20284 with
               | FStar_Syntax_Syntax.Tm_match (uu____20290,br::brs) ->
                   let uu____20357 = br  in
                   (match uu____20357 with
                    | (uu____20374,uu____20375,e) ->
                        let r =
                          let uu____20396 = simp_t e  in
                          match uu____20396 with
                          | FStar_Pervasives_Native.None  ->
                              FStar_Pervasives_Native.None
                          | FStar_Pervasives_Native.Some b ->
                              let uu____20402 =
                                FStar_List.for_all
                                  (fun uu____20420  ->
                                     match uu____20420 with
                                     | (uu____20433,uu____20434,e') ->
                                         let uu____20448 = simp_t e'  in
                                         uu____20448 =
                                           (FStar_Pervasives_Native.Some b))
                                  brs
                                 in
                              if uu____20402
                              then FStar_Pervasives_Native.Some b
                              else FStar_Pervasives_Native.None
                           in
                        r)
               | uu____20456 -> FStar_Pervasives_Native.None  in
             let maybe_auto_squash t =
               let uu____20465 = FStar_Syntax_Util.is_sub_singleton t  in
               if uu____20465
               then t
               else
                 FStar_Syntax_Util.mk_auto_squash FStar_Syntax_Syntax.U_zero
                   t
                in
             let squashed_head_un_auto_squash_args t =
               let maybe_un_auto_squash_arg uu____20496 =
                 match uu____20496 with
                 | (t1,q) ->
                     let uu____20509 = FStar_Syntax_Util.is_auto_squash t1
                        in
                     (match uu____20509 with
                      | FStar_Pervasives_Native.Some
                          (FStar_Syntax_Syntax.U_zero ,t2) -> (t2, q)
                      | uu____20537 -> (t1, q))
                  in
               let uu____20548 = FStar_Syntax_Util.head_and_args t  in
               match uu____20548 with
               | (head1,args) ->
                   let args1 = FStar_List.map maybe_un_auto_squash_arg args
                      in
                   FStar_Syntax_Syntax.mk_Tm_app head1 args1
                     FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos
                in
             let rec clearly_inhabited ty =
               let uu____20614 =
                 let uu____20615 = FStar_Syntax_Util.unmeta ty  in
                 uu____20615.FStar_Syntax_Syntax.n  in
               match uu____20614 with
               | FStar_Syntax_Syntax.Tm_uinst (t,uu____20619) ->
                   clearly_inhabited t
               | FStar_Syntax_Syntax.Tm_arrow (uu____20624,c) ->
                   clearly_inhabited (FStar_Syntax_Util.comp_result c)
               | FStar_Syntax_Syntax.Tm_fvar fv ->
                   let l = FStar_Syntax_Syntax.lid_of_fv fv  in
                   (((FStar_Ident.lid_equals l FStar_Parser_Const.int_lid) ||
                       (FStar_Ident.lid_equals l FStar_Parser_Const.bool_lid))
                      ||
                      (FStar_Ident.lid_equals l FStar_Parser_Const.string_lid))
                     || (FStar_Ident.lid_equals l FStar_Parser_Const.exn_lid)
               | uu____20644 -> false  in
             let simplify1 arg =
               let uu____20669 = simp_t (FStar_Pervasives_Native.fst arg)  in
               (uu____20669, arg)  in
             let uu____20678 = is_forall_const tm1  in
             match uu____20678 with
             | FStar_Pervasives_Native.Some tm' ->
                 (if (cfg.debug).wpe
                  then
                    (let uu____20683 = FStar_Syntax_Print.term_to_string tm1
                        in
                     let uu____20684 = FStar_Syntax_Print.term_to_string tm'
                        in
                     FStar_Util.print2 "WPE> %s ~> %s\n" uu____20683
                       uu____20684)
                  else ();
                  (let uu____20686 = norm cfg env [] tm'  in
                   maybe_simplify_aux cfg env stack uu____20686))
             | FStar_Pervasives_Native.None  ->
                 let uu____20687 =
                   let uu____20688 = FStar_Syntax_Subst.compress tm1  in
                   uu____20688.FStar_Syntax_Syntax.n  in
                 (match uu____20687 with
                  | FStar_Syntax_Syntax.Tm_app
                      ({
                         FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uinst
                           ({
                              FStar_Syntax_Syntax.n =
                                FStar_Syntax_Syntax.Tm_fvar fv;
                              FStar_Syntax_Syntax.pos = uu____20692;
                              FStar_Syntax_Syntax.vars = uu____20693;_},uu____20694);
                         FStar_Syntax_Syntax.pos = uu____20695;
                         FStar_Syntax_Syntax.vars = uu____20696;_},args)
                      ->
                      let uu____20722 =
                        FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.and_lid
                         in
                      if uu____20722
                      then
                        let uu____20723 =
                          FStar_All.pipe_right args
                            (FStar_List.map simplify1)
                           in
                        (match uu____20723 with
                         | (FStar_Pervasives_Native.Some (true ),uu____20768)::
                             (uu____20769,(arg,uu____20771))::[] ->
                             maybe_auto_squash arg
                         | (uu____20820,(arg,uu____20822))::(FStar_Pervasives_Native.Some
                                                             (true
                                                             ),uu____20823)::[]
                             -> maybe_auto_squash arg
                         | (FStar_Pervasives_Native.Some (false
                            ),uu____20872)::uu____20873::[] ->
                             w FStar_Syntax_Util.t_false
                         | uu____20924::(FStar_Pervasives_Native.Some (false
                                         ),uu____20925)::[]
                             -> w FStar_Syntax_Util.t_false
                         | uu____20976 ->
                             squashed_head_un_auto_squash_args tm1)
                      else
                        (let uu____20990 =
                           FStar_Syntax_Syntax.fv_eq_lid fv
                             FStar_Parser_Const.or_lid
                            in
                         if uu____20990
                         then
                           let uu____20991 =
                             FStar_All.pipe_right args
                               (FStar_List.map simplify1)
                              in
                           match uu____20991 with
                           | (FStar_Pervasives_Native.Some (true
                              ),uu____21036)::uu____21037::[] ->
                               w FStar_Syntax_Util.t_true
                           | uu____21088::(FStar_Pervasives_Native.Some (true
                                           ),uu____21089)::[]
                               -> w FStar_Syntax_Util.t_true
                           | (FStar_Pervasives_Native.Some (false
                              ),uu____21140)::(uu____21141,(arg,uu____21143))::[]
                               -> maybe_auto_squash arg
                           | (uu____21192,(arg,uu____21194))::(FStar_Pervasives_Native.Some
                                                               (false
                                                               ),uu____21195)::[]
                               -> maybe_auto_squash arg
                           | uu____21244 ->
                               squashed_head_un_auto_squash_args tm1
                         else
                           (let uu____21258 =
                              FStar_Syntax_Syntax.fv_eq_lid fv
                                FStar_Parser_Const.imp_lid
                               in
                            if uu____21258
                            then
                              let uu____21259 =
                                FStar_All.pipe_right args
                                  (FStar_List.map simplify1)
                                 in
                              match uu____21259 with
                              | uu____21304::(FStar_Pervasives_Native.Some
                                              (true ),uu____21305)::[]
                                  -> w FStar_Syntax_Util.t_true
                              | (FStar_Pervasives_Native.Some (false
                                 ),uu____21356)::uu____21357::[] ->
                                  w FStar_Syntax_Util.t_true
                              | (FStar_Pervasives_Native.Some (true
                                 ),uu____21408)::(uu____21409,(arg,uu____21411))::[]
                                  -> maybe_auto_squash arg
                              | (uu____21460,(p,uu____21462))::(uu____21463,
                                                                (q,uu____21465))::[]
                                  ->
                                  let uu____21512 =
                                    FStar_Syntax_Util.term_eq p q  in
                                  (if uu____21512
                                   then w FStar_Syntax_Util.t_true
                                   else squashed_head_un_auto_squash_args tm1)
                              | uu____21514 ->
                                  squashed_head_un_auto_squash_args tm1
                            else
                              (let uu____21528 =
                                 FStar_Syntax_Syntax.fv_eq_lid fv
                                   FStar_Parser_Const.iff_lid
                                  in
                               if uu____21528
                               then
                                 let uu____21529 =
                                   FStar_All.pipe_right args
                                     (FStar_List.map simplify1)
                                    in
                                 match uu____21529 with
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____21574)::(FStar_Pervasives_Native.Some
                                                     (true ),uu____21575)::[]
                                     -> w FStar_Syntax_Util.t_true
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____21626)::(FStar_Pervasives_Native.Some
                                                     (false ),uu____21627)::[]
                                     -> w FStar_Syntax_Util.t_true
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____21678)::(FStar_Pervasives_Native.Some
                                                     (false ),uu____21679)::[]
                                     -> w FStar_Syntax_Util.t_false
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____21730)::(FStar_Pervasives_Native.Some
                                                     (true ),uu____21731)::[]
                                     -> w FStar_Syntax_Util.t_false
                                 | (uu____21782,(arg,uu____21784))::(FStar_Pervasives_Native.Some
                                                                    (true
                                                                    ),uu____21785)::[]
                                     -> maybe_auto_squash arg
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____21834)::(uu____21835,(arg,uu____21837))::[]
                                     -> maybe_auto_squash arg
                                 | (uu____21886,(arg,uu____21888))::(FStar_Pervasives_Native.Some
                                                                    (false
                                                                    ),uu____21889)::[]
                                     ->
                                     let uu____21938 =
                                       FStar_Syntax_Util.mk_neg arg  in
                                     maybe_auto_squash uu____21938
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____21939)::(uu____21940,(arg,uu____21942))::[]
                                     ->
                                     let uu____21991 =
                                       FStar_Syntax_Util.mk_neg arg  in
                                     maybe_auto_squash uu____21991
                                 | (uu____21992,(p,uu____21994))::(uu____21995,
                                                                   (q,uu____21997))::[]
                                     ->
                                     let uu____22044 =
                                       FStar_Syntax_Util.term_eq p q  in
                                     (if uu____22044
                                      then w FStar_Syntax_Util.t_true
                                      else
                                        squashed_head_un_auto_squash_args tm1)
                                 | uu____22046 ->
                                     squashed_head_un_auto_squash_args tm1
                               else
                                 (let uu____22060 =
                                    FStar_Syntax_Syntax.fv_eq_lid fv
                                      FStar_Parser_Const.not_lid
                                     in
                                  if uu____22060
                                  then
                                    let uu____22061 =
                                      FStar_All.pipe_right args
                                        (FStar_List.map simplify1)
                                       in
                                    match uu____22061 with
                                    | (FStar_Pervasives_Native.Some (true
                                       ),uu____22106)::[] ->
                                        w FStar_Syntax_Util.t_false
                                    | (FStar_Pervasives_Native.Some (false
                                       ),uu____22137)::[] ->
                                        w FStar_Syntax_Util.t_true
                                    | uu____22168 ->
                                        squashed_head_un_auto_squash_args tm1
                                  else
                                    (let uu____22182 =
                                       FStar_Syntax_Syntax.fv_eq_lid fv
                                         FStar_Parser_Const.forall_lid
                                        in
                                     if uu____22182
                                     then
                                       match args with
                                       | (t,uu____22184)::[] ->
                                           let uu____22201 =
                                             let uu____22202 =
                                               FStar_Syntax_Subst.compress t
                                                in
                                             uu____22202.FStar_Syntax_Syntax.n
                                              in
                                           (match uu____22201 with
                                            | FStar_Syntax_Syntax.Tm_abs
                                                (uu____22205::[],body,uu____22207)
                                                ->
                                                let uu____22234 = simp_t body
                                                   in
                                                (match uu____22234 with
                                                 | FStar_Pervasives_Native.Some
                                                     (true ) ->
                                                     w
                                                       FStar_Syntax_Util.t_true
                                                 | uu____22237 -> tm1)
                                            | uu____22240 -> tm1)
                                       | (ty,FStar_Pervasives_Native.Some
                                          (FStar_Syntax_Syntax.Implicit
                                          uu____22242))::(t,uu____22244)::[]
                                           ->
                                           let uu____22271 =
                                             let uu____22272 =
                                               FStar_Syntax_Subst.compress t
                                                in
                                             uu____22272.FStar_Syntax_Syntax.n
                                              in
                                           (match uu____22271 with
                                            | FStar_Syntax_Syntax.Tm_abs
                                                (uu____22275::[],body,uu____22277)
                                                ->
                                                let uu____22304 = simp_t body
                                                   in
                                                (match uu____22304 with
                                                 | FStar_Pervasives_Native.Some
                                                     (true ) ->
                                                     w
                                                       FStar_Syntax_Util.t_true
                                                 | FStar_Pervasives_Native.Some
                                                     (false ) when
                                                     clearly_inhabited ty ->
                                                     w
                                                       FStar_Syntax_Util.t_false
                                                 | uu____22307 -> tm1)
                                            | uu____22310 -> tm1)
                                       | uu____22311 -> tm1
                                     else
                                       (let uu____22321 =
                                          FStar_Syntax_Syntax.fv_eq_lid fv
                                            FStar_Parser_Const.exists_lid
                                           in
                                        if uu____22321
                                        then
                                          match args with
                                          | (t,uu____22323)::[] ->
                                              let uu____22340 =
                                                let uu____22341 =
                                                  FStar_Syntax_Subst.compress
                                                    t
                                                   in
                                                uu____22341.FStar_Syntax_Syntax.n
                                                 in
                                              (match uu____22340 with
                                               | FStar_Syntax_Syntax.Tm_abs
                                                   (uu____22344::[],body,uu____22346)
                                                   ->
                                                   let uu____22373 =
                                                     simp_t body  in
                                                   (match uu____22373 with
                                                    | FStar_Pervasives_Native.Some
                                                        (false ) ->
                                                        w
                                                          FStar_Syntax_Util.t_false
                                                    | uu____22376 -> tm1)
                                               | uu____22379 -> tm1)
                                          | (ty,FStar_Pervasives_Native.Some
                                             (FStar_Syntax_Syntax.Implicit
                                             uu____22381))::(t,uu____22383)::[]
                                              ->
                                              let uu____22410 =
                                                let uu____22411 =
                                                  FStar_Syntax_Subst.compress
                                                    t
                                                   in
                                                uu____22411.FStar_Syntax_Syntax.n
                                                 in
                                              (match uu____22410 with
                                               | FStar_Syntax_Syntax.Tm_abs
                                                   (uu____22414::[],body,uu____22416)
                                                   ->
                                                   let uu____22443 =
                                                     simp_t body  in
                                                   (match uu____22443 with
                                                    | FStar_Pervasives_Native.Some
                                                        (false ) ->
                                                        w
                                                          FStar_Syntax_Util.t_false
                                                    | FStar_Pervasives_Native.Some
                                                        (true ) when
                                                        clearly_inhabited ty
                                                        ->
                                                        w
                                                          FStar_Syntax_Util.t_true
                                                    | uu____22446 -> tm1)
                                               | uu____22449 -> tm1)
                                          | uu____22450 -> tm1
                                        else
                                          (let uu____22460 =
                                             FStar_Syntax_Syntax.fv_eq_lid fv
                                               FStar_Parser_Const.b2t_lid
                                              in
                                           if uu____22460
                                           then
                                             match args with
                                             | ({
                                                  FStar_Syntax_Syntax.n =
                                                    FStar_Syntax_Syntax.Tm_constant
                                                    (FStar_Const.Const_bool
                                                    (true ));
                                                  FStar_Syntax_Syntax.pos =
                                                    uu____22461;
                                                  FStar_Syntax_Syntax.vars =
                                                    uu____22462;_},uu____22463)::[]
                                                 ->
                                                 w FStar_Syntax_Util.t_true
                                             | ({
                                                  FStar_Syntax_Syntax.n =
                                                    FStar_Syntax_Syntax.Tm_constant
                                                    (FStar_Const.Const_bool
                                                    (false ));
                                                  FStar_Syntax_Syntax.pos =
                                                    uu____22480;
                                                  FStar_Syntax_Syntax.vars =
                                                    uu____22481;_},uu____22482)::[]
                                                 ->
                                                 w FStar_Syntax_Util.t_false
                                             | uu____22499 -> tm1
                                           else
                                             (let uu____22509 =
                                                FStar_Syntax_Util.is_auto_squash
                                                  tm1
                                                 in
                                              match uu____22509 with
                                              | FStar_Pervasives_Native.Some
                                                  (FStar_Syntax_Syntax.U_zero
                                                   ,t)
                                                  when
                                                  FStar_Syntax_Util.is_sub_singleton
                                                    t
                                                  -> t
                                              | uu____22529 ->
                                                  reduce_equality cfg env
                                                    stack tm1))))))))
                  | FStar_Syntax_Syntax.Tm_app
                      ({
                         FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar
                           fv;
                         FStar_Syntax_Syntax.pos = uu____22539;
                         FStar_Syntax_Syntax.vars = uu____22540;_},args)
                      ->
                      let uu____22562 =
                        FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.and_lid
                         in
                      if uu____22562
                      then
                        let uu____22563 =
                          FStar_All.pipe_right args
                            (FStar_List.map simplify1)
                           in
                        (match uu____22563 with
                         | (FStar_Pervasives_Native.Some (true ),uu____22608)::
                             (uu____22609,(arg,uu____22611))::[] ->
                             maybe_auto_squash arg
                         | (uu____22660,(arg,uu____22662))::(FStar_Pervasives_Native.Some
                                                             (true
                                                             ),uu____22663)::[]
                             -> maybe_auto_squash arg
                         | (FStar_Pervasives_Native.Some (false
                            ),uu____22712)::uu____22713::[] ->
                             w FStar_Syntax_Util.t_false
                         | uu____22764::(FStar_Pervasives_Native.Some (false
                                         ),uu____22765)::[]
                             -> w FStar_Syntax_Util.t_false
                         | uu____22816 ->
                             squashed_head_un_auto_squash_args tm1)
                      else
                        (let uu____22830 =
                           FStar_Syntax_Syntax.fv_eq_lid fv
                             FStar_Parser_Const.or_lid
                            in
                         if uu____22830
                         then
                           let uu____22831 =
                             FStar_All.pipe_right args
                               (FStar_List.map simplify1)
                              in
                           match uu____22831 with
                           | (FStar_Pervasives_Native.Some (true
                              ),uu____22876)::uu____22877::[] ->
                               w FStar_Syntax_Util.t_true
                           | uu____22928::(FStar_Pervasives_Native.Some (true
                                           ),uu____22929)::[]
                               -> w FStar_Syntax_Util.t_true
                           | (FStar_Pervasives_Native.Some (false
                              ),uu____22980)::(uu____22981,(arg,uu____22983))::[]
                               -> maybe_auto_squash arg
                           | (uu____23032,(arg,uu____23034))::(FStar_Pervasives_Native.Some
                                                               (false
                                                               ),uu____23035)::[]
                               -> maybe_auto_squash arg
                           | uu____23084 ->
                               squashed_head_un_auto_squash_args tm1
                         else
                           (let uu____23098 =
                              FStar_Syntax_Syntax.fv_eq_lid fv
                                FStar_Parser_Const.imp_lid
                               in
                            if uu____23098
                            then
                              let uu____23099 =
                                FStar_All.pipe_right args
                                  (FStar_List.map simplify1)
                                 in
                              match uu____23099 with
                              | uu____23144::(FStar_Pervasives_Native.Some
                                              (true ),uu____23145)::[]
                                  -> w FStar_Syntax_Util.t_true
                              | (FStar_Pervasives_Native.Some (false
                                 ),uu____23196)::uu____23197::[] ->
                                  w FStar_Syntax_Util.t_true
                              | (FStar_Pervasives_Native.Some (true
                                 ),uu____23248)::(uu____23249,(arg,uu____23251))::[]
                                  -> maybe_auto_squash arg
                              | (uu____23300,(p,uu____23302))::(uu____23303,
                                                                (q,uu____23305))::[]
                                  ->
                                  let uu____23352 =
                                    FStar_Syntax_Util.term_eq p q  in
                                  (if uu____23352
                                   then w FStar_Syntax_Util.t_true
                                   else squashed_head_un_auto_squash_args tm1)
                              | uu____23354 ->
                                  squashed_head_un_auto_squash_args tm1
                            else
                              (let uu____23368 =
                                 FStar_Syntax_Syntax.fv_eq_lid fv
                                   FStar_Parser_Const.iff_lid
                                  in
                               if uu____23368
                               then
                                 let uu____23369 =
                                   FStar_All.pipe_right args
                                     (FStar_List.map simplify1)
                                    in
                                 match uu____23369 with
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____23414)::(FStar_Pervasives_Native.Some
                                                     (true ),uu____23415)::[]
                                     -> w FStar_Syntax_Util.t_true
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____23466)::(FStar_Pervasives_Native.Some
                                                     (false ),uu____23467)::[]
                                     -> w FStar_Syntax_Util.t_true
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____23518)::(FStar_Pervasives_Native.Some
                                                     (false ),uu____23519)::[]
                                     -> w FStar_Syntax_Util.t_false
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____23570)::(FStar_Pervasives_Native.Some
                                                     (true ),uu____23571)::[]
                                     -> w FStar_Syntax_Util.t_false
                                 | (uu____23622,(arg,uu____23624))::(FStar_Pervasives_Native.Some
                                                                    (true
                                                                    ),uu____23625)::[]
                                     -> maybe_auto_squash arg
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____23674)::(uu____23675,(arg,uu____23677))::[]
                                     -> maybe_auto_squash arg
                                 | (uu____23726,(arg,uu____23728))::(FStar_Pervasives_Native.Some
                                                                    (false
                                                                    ),uu____23729)::[]
                                     ->
                                     let uu____23778 =
                                       FStar_Syntax_Util.mk_neg arg  in
                                     maybe_auto_squash uu____23778
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____23779)::(uu____23780,(arg,uu____23782))::[]
                                     ->
                                     let uu____23831 =
                                       FStar_Syntax_Util.mk_neg arg  in
                                     maybe_auto_squash uu____23831
                                 | (uu____23832,(p,uu____23834))::(uu____23835,
                                                                   (q,uu____23837))::[]
                                     ->
                                     let uu____23884 =
                                       FStar_Syntax_Util.term_eq p q  in
                                     (if uu____23884
                                      then w FStar_Syntax_Util.t_true
                                      else
                                        squashed_head_un_auto_squash_args tm1)
                                 | uu____23886 ->
                                     squashed_head_un_auto_squash_args tm1
                               else
                                 (let uu____23900 =
                                    FStar_Syntax_Syntax.fv_eq_lid fv
                                      FStar_Parser_Const.not_lid
                                     in
                                  if uu____23900
                                  then
                                    let uu____23901 =
                                      FStar_All.pipe_right args
                                        (FStar_List.map simplify1)
                                       in
                                    match uu____23901 with
                                    | (FStar_Pervasives_Native.Some (true
                                       ),uu____23946)::[] ->
                                        w FStar_Syntax_Util.t_false
                                    | (FStar_Pervasives_Native.Some (false
                                       ),uu____23977)::[] ->
                                        w FStar_Syntax_Util.t_true
                                    | uu____24008 ->
                                        squashed_head_un_auto_squash_args tm1
                                  else
                                    (let uu____24022 =
                                       FStar_Syntax_Syntax.fv_eq_lid fv
                                         FStar_Parser_Const.forall_lid
                                        in
                                     if uu____24022
                                     then
                                       match args with
                                       | (t,uu____24024)::[] ->
                                           let uu____24041 =
                                             let uu____24042 =
                                               FStar_Syntax_Subst.compress t
                                                in
                                             uu____24042.FStar_Syntax_Syntax.n
                                              in
                                           (match uu____24041 with
                                            | FStar_Syntax_Syntax.Tm_abs
                                                (uu____24045::[],body,uu____24047)
                                                ->
                                                let uu____24074 = simp_t body
                                                   in
                                                (match uu____24074 with
                                                 | FStar_Pervasives_Native.Some
                                                     (true ) ->
                                                     w
                                                       FStar_Syntax_Util.t_true
                                                 | uu____24077 -> tm1)
                                            | uu____24080 -> tm1)
                                       | (ty,FStar_Pervasives_Native.Some
                                          (FStar_Syntax_Syntax.Implicit
                                          uu____24082))::(t,uu____24084)::[]
                                           ->
                                           let uu____24111 =
                                             let uu____24112 =
                                               FStar_Syntax_Subst.compress t
                                                in
                                             uu____24112.FStar_Syntax_Syntax.n
                                              in
                                           (match uu____24111 with
                                            | FStar_Syntax_Syntax.Tm_abs
                                                (uu____24115::[],body,uu____24117)
                                                ->
                                                let uu____24144 = simp_t body
                                                   in
                                                (match uu____24144 with
                                                 | FStar_Pervasives_Native.Some
                                                     (true ) ->
                                                     w
                                                       FStar_Syntax_Util.t_true
                                                 | FStar_Pervasives_Native.Some
                                                     (false ) when
                                                     clearly_inhabited ty ->
                                                     w
                                                       FStar_Syntax_Util.t_false
                                                 | uu____24147 -> tm1)
                                            | uu____24150 -> tm1)
                                       | uu____24151 -> tm1
                                     else
                                       (let uu____24161 =
                                          FStar_Syntax_Syntax.fv_eq_lid fv
                                            FStar_Parser_Const.exists_lid
                                           in
                                        if uu____24161
                                        then
                                          match args with
                                          | (t,uu____24163)::[] ->
                                              let uu____24180 =
                                                let uu____24181 =
                                                  FStar_Syntax_Subst.compress
                                                    t
                                                   in
                                                uu____24181.FStar_Syntax_Syntax.n
                                                 in
                                              (match uu____24180 with
                                               | FStar_Syntax_Syntax.Tm_abs
                                                   (uu____24184::[],body,uu____24186)
                                                   ->
                                                   let uu____24213 =
                                                     simp_t body  in
                                                   (match uu____24213 with
                                                    | FStar_Pervasives_Native.Some
                                                        (false ) ->
                                                        w
                                                          FStar_Syntax_Util.t_false
                                                    | uu____24216 -> tm1)
                                               | uu____24219 -> tm1)
                                          | (ty,FStar_Pervasives_Native.Some
                                             (FStar_Syntax_Syntax.Implicit
                                             uu____24221))::(t,uu____24223)::[]
                                              ->
                                              let uu____24250 =
                                                let uu____24251 =
                                                  FStar_Syntax_Subst.compress
                                                    t
                                                   in
                                                uu____24251.FStar_Syntax_Syntax.n
                                                 in
                                              (match uu____24250 with
                                               | FStar_Syntax_Syntax.Tm_abs
                                                   (uu____24254::[],body,uu____24256)
                                                   ->
                                                   let uu____24283 =
                                                     simp_t body  in
                                                   (match uu____24283 with
                                                    | FStar_Pervasives_Native.Some
                                                        (false ) ->
                                                        w
                                                          FStar_Syntax_Util.t_false
                                                    | FStar_Pervasives_Native.Some
                                                        (true ) when
                                                        clearly_inhabited ty
                                                        ->
                                                        w
                                                          FStar_Syntax_Util.t_true
                                                    | uu____24286 -> tm1)
                                               | uu____24289 -> tm1)
                                          | uu____24290 -> tm1
                                        else
                                          (let uu____24300 =
                                             FStar_Syntax_Syntax.fv_eq_lid fv
                                               FStar_Parser_Const.b2t_lid
                                              in
                                           if uu____24300
                                           then
                                             match args with
                                             | ({
                                                  FStar_Syntax_Syntax.n =
                                                    FStar_Syntax_Syntax.Tm_constant
                                                    (FStar_Const.Const_bool
                                                    (true ));
                                                  FStar_Syntax_Syntax.pos =
                                                    uu____24301;
                                                  FStar_Syntax_Syntax.vars =
                                                    uu____24302;_},uu____24303)::[]
                                                 ->
                                                 w FStar_Syntax_Util.t_true
                                             | ({
                                                  FStar_Syntax_Syntax.n =
                                                    FStar_Syntax_Syntax.Tm_constant
                                                    (FStar_Const.Const_bool
                                                    (false ));
                                                  FStar_Syntax_Syntax.pos =
                                                    uu____24320;
                                                  FStar_Syntax_Syntax.vars =
                                                    uu____24321;_},uu____24322)::[]
                                                 ->
                                                 w FStar_Syntax_Util.t_false
                                             | uu____24339 -> tm1
                                           else
                                             (let uu____24349 =
                                                FStar_Syntax_Util.is_auto_squash
                                                  tm1
                                                 in
                                              match uu____24349 with
                                              | FStar_Pervasives_Native.Some
                                                  (FStar_Syntax_Syntax.U_zero
                                                   ,t)
                                                  when
                                                  FStar_Syntax_Util.is_sub_singleton
                                                    t
                                                  -> t
                                              | uu____24369 ->
                                                  reduce_equality cfg env
                                                    stack tm1))))))))
                  | FStar_Syntax_Syntax.Tm_refine (bv,t) ->
                      let uu____24384 = simp_t t  in
                      (match uu____24384 with
                       | FStar_Pervasives_Native.Some (true ) ->
                           bv.FStar_Syntax_Syntax.sort
                       | FStar_Pervasives_Native.Some (false ) -> tm1
                       | FStar_Pervasives_Native.None  -> tm1)
                  | FStar_Syntax_Syntax.Tm_match uu____24387 ->
                      let uu____24410 = is_const_match tm1  in
                      (match uu____24410 with
                       | FStar_Pervasives_Native.Some (true ) ->
                           w FStar_Syntax_Util.t_true
                       | FStar_Pervasives_Native.Some (false ) ->
                           w FStar_Syntax_Util.t_false
                       | FStar_Pervasives_Native.None  -> tm1)
                  | uu____24413 -> tm1))

and (rebuild :
  cfg -> env -> stack -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun t  ->
          log cfg
            (fun uu____24423  ->
               (let uu____24425 = FStar_Syntax_Print.tag_of_term t  in
                let uu____24426 = FStar_Syntax_Print.term_to_string t  in
                let uu____24427 =
                  FStar_Util.string_of_int (FStar_List.length env)  in
                let uu____24434 =
                  let uu____24435 =
                    let uu____24438 = firstn (Prims.parse_int "4") stack  in
                    FStar_All.pipe_left FStar_Pervasives_Native.fst
                      uu____24438
                     in
                  stack_to_string uu____24435  in
                FStar_Util.print4
                  ">>> %s\nRebuild %s with %s env elements and top of the stack %s \n"
                  uu____24425 uu____24426 uu____24427 uu____24434);
               (let uu____24461 =
                  FStar_TypeChecker_Env.debug cfg.tcenv
                    (FStar_Options.Other "NormRebuild")
                   in
                if uu____24461
                then
                  let uu____24462 = FStar_Syntax_Util.unbound_variables t  in
                  match uu____24462 with
                  | [] -> ()
                  | bvs ->
                      ((let uu____24469 = FStar_Syntax_Print.tag_of_term t
                           in
                        let uu____24470 = FStar_Syntax_Print.term_to_string t
                           in
                        let uu____24471 =
                          let uu____24472 =
                            FStar_All.pipe_right bvs
                              (FStar_List.map FStar_Syntax_Print.bv_to_string)
                             in
                          FStar_All.pipe_right uu____24472
                            (FStar_String.concat ", ")
                           in
                        FStar_Util.print3
                          "!!! Rebuild (%s) %s, free vars=%s\n" uu____24469
                          uu____24470 uu____24471);
                       failwith "DIE!")
                else ()));
          (let t1 = maybe_simplify cfg env stack t  in
           match stack with
           | [] -> t1
           | (Debug (tm,time_then))::stack1 ->
               (if (cfg.debug).print_normalized
                then
                  (let time_now = FStar_Util.now ()  in
                   let uu____24490 =
                     let uu____24491 =
                       let uu____24492 =
                         FStar_Util.time_diff time_then time_now  in
                       FStar_Pervasives_Native.snd uu____24492  in
                     FStar_Util.string_of_int uu____24491  in
                   let uu____24497 = FStar_Syntax_Print.term_to_string tm  in
                   let uu____24498 = FStar_Syntax_Print.term_to_string t1  in
                   FStar_Util.print3 "Normalized (%s ms) %s\n\tto %s\n"
                     uu____24490 uu____24497 uu____24498)
                else ();
                rebuild cfg env stack1 t1)
           | (Cfg cfg1)::stack1 -> rebuild cfg1 env stack1 t1
           | (Meta (uu____24504,m,r))::stack1 ->
               let t2 = mk (FStar_Syntax_Syntax.Tm_meta (t1, m)) r  in
               rebuild cfg env stack1 t2
           | (MemoLazy r)::stack1 ->
               (set_memo cfg r (env, t1);
                log cfg
                  (fun uu____24555  ->
                     let uu____24556 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print1 "\tSet memo %s\n" uu____24556);
                rebuild cfg env stack1 t1)
           | (Let (env',bs,lb,r))::stack1 ->
               let body = FStar_Syntax_Subst.close bs t1  in
               let t2 =
                 FStar_Syntax_Syntax.mk
                   (FStar_Syntax_Syntax.Tm_let ((false, [lb]), body))
                   FStar_Pervasives_Native.None r
                  in
               rebuild cfg env' stack1 t2
           | (Abs (env',bs,env'',lopt,r))::stack1 ->
               let bs1 = norm_binders cfg env' bs  in
               let lopt1 = norm_lcomp_opt cfg env'' lopt  in
               let uu____24594 =
                 let uu___345_24595 = FStar_Syntax_Util.abs bs1 t1 lopt1  in
                 {
                   FStar_Syntax_Syntax.n =
                     (uu___345_24595.FStar_Syntax_Syntax.n);
                   FStar_Syntax_Syntax.pos = r;
                   FStar_Syntax_Syntax.vars =
                     (uu___345_24595.FStar_Syntax_Syntax.vars)
                 }  in
               rebuild cfg env stack1 uu____24594
           | (Arg (Univ uu____24598,uu____24599,uu____24600))::uu____24601 ->
               failwith "Impossible"
           | (Arg (Dummy ,uu____24604,uu____24605))::uu____24606 ->
               failwith "Impossible"
           | (UnivArgs (us,r))::stack1 ->
               let t2 = FStar_Syntax_Syntax.mk_Tm_uinst t1 us  in
               rebuild cfg env stack1 t2
           | (Arg (Clos (env_arg,tm,uu____24621,uu____24622),aq,r))::stack1
               when
               let uu____24672 = head_of t1  in
               FStar_Syntax_Util.is_fstar_tactics_by_tactic uu____24672 ->
               let t2 =
                 let uu____24676 =
                   let uu____24681 =
                     let uu____24682 = closure_as_term cfg env_arg tm  in
                     (uu____24682, aq)  in
                   FStar_Syntax_Syntax.extend_app t1 uu____24681  in
                 uu____24676 FStar_Pervasives_Native.None r  in
               rebuild cfg env stack1 t2
           | (Arg (Clos (env_arg,tm,m,uu____24692),aq,r))::stack1 ->
               (log cfg
                  (fun uu____24745  ->
                     let uu____24746 = FStar_Syntax_Print.term_to_string tm
                        in
                     FStar_Util.print1 "Rebuilding with arg %s\n" uu____24746);
                if Prims.op_Negation (cfg.steps).iota
                then
                  (if (cfg.steps).hnf
                   then
                     let arg = closure_as_term cfg env_arg tm  in
                     let t2 =
                       FStar_Syntax_Syntax.extend_app t1 (arg, aq)
                         FStar_Pervasives_Native.None r
                        in
                     rebuild cfg env_arg stack1 t2
                   else
                     (let stack2 = (App (env, t1, aq, r)) :: stack1  in
                      norm cfg env_arg stack2 tm))
                else
                  (let uu____24758 = FStar_ST.op_Bang m  in
                   match uu____24758 with
                   | FStar_Pervasives_Native.None  ->
                       if (cfg.steps).hnf
                       then
                         let arg = closure_as_term cfg env_arg tm  in
                         let t2 =
                           FStar_Syntax_Syntax.extend_app t1 (arg, aq)
                             FStar_Pervasives_Native.None r
                            in
                         rebuild cfg env_arg stack1 t2
                       else
                         (let stack2 = (MemoLazy m) :: (App (env, t1, aq, r))
                            :: stack1  in
                          norm cfg env_arg stack2 tm)
                   | FStar_Pervasives_Native.Some (uu____24901,a) ->
                       let t2 =
                         FStar_Syntax_Syntax.extend_app t1 (a, aq)
                           FStar_Pervasives_Native.None r
                          in
                       rebuild cfg env_arg stack1 t2))
           | (App (env1,head1,aq,r))::stack' when should_reify cfg stack ->
               let t0 = t1  in
               let fallback msg uu____24954 =
                 log cfg
                   (fun uu____24958  ->
                      let uu____24959 = FStar_Syntax_Print.term_to_string t1
                         in
                      FStar_Util.print2 "Not reifying%s: %s\n" msg
                        uu____24959);
                 (let t2 =
                    FStar_Syntax_Syntax.extend_app head1 (t1, aq)
                      FStar_Pervasives_Native.None r
                     in
                  rebuild cfg env1 stack' t2)
                  in
               let uu____24965 =
                 let uu____24966 = FStar_Syntax_Subst.compress t1  in
                 uu____24966.FStar_Syntax_Syntax.n  in
               (match uu____24965 with
                | FStar_Syntax_Syntax.Tm_meta
                    (t2,FStar_Syntax_Syntax.Meta_monadic (m,ty)) ->
                    do_reify_monadic (fallback " (1)") cfg env1 stack t2 m ty
                | FStar_Syntax_Syntax.Tm_meta
                    (t2,FStar_Syntax_Syntax.Meta_monadic_lift (msrc,mtgt,ty))
                    ->
                    let lifted =
                      let uu____24993 = closure_as_term cfg env1 ty  in
                      reify_lift cfg t2 msrc mtgt uu____24993  in
                    (log cfg
                       (fun uu____24997  ->
                          let uu____24998 =
                            FStar_Syntax_Print.term_to_string lifted  in
                          FStar_Util.print1 "Reified lift to (1): %s\n"
                            uu____24998);
                     (let uu____24999 = FStar_List.tl stack  in
                      norm cfg env1 uu____24999 lifted))
                | FStar_Syntax_Syntax.Tm_app
                    ({
                       FStar_Syntax_Syntax.n =
                         FStar_Syntax_Syntax.Tm_constant
                         (FStar_Const.Const_reflect uu____25000);
                       FStar_Syntax_Syntax.pos = uu____25001;
                       FStar_Syntax_Syntax.vars = uu____25002;_},(e,uu____25004)::[])
                    -> norm cfg env1 stack' e
                | FStar_Syntax_Syntax.Tm_app uu____25033 when
                    (cfg.steps).primops ->
                    let uu____25048 = FStar_Syntax_Util.head_and_args t1  in
                    (match uu____25048 with
                     | (hd1,args) ->
                         let uu____25085 =
                           let uu____25086 = FStar_Syntax_Util.un_uinst hd1
                              in
                           uu____25086.FStar_Syntax_Syntax.n  in
                         (match uu____25085 with
                          | FStar_Syntax_Syntax.Tm_fvar fv ->
                              let uu____25090 = find_prim_step cfg fv  in
                              (match uu____25090 with
                               | FStar_Pervasives_Native.Some
                                   { name = uu____25093; arity = uu____25094;
                                     auto_reflect =
                                       FStar_Pervasives_Native.Some n1;
                                     strong_reduction_ok = uu____25096;
                                     requires_binder_substitution =
                                       uu____25097;
                                     interpretation = uu____25098;_}
                                   when (FStar_List.length args) = n1 ->
                                   norm cfg env1 stack' t1
                               | uu____25113 -> fallback " (3)" ())
                          | uu____25116 -> fallback " (4)" ()))
                | uu____25117 -> fallback " (2)" ())
           | (App (env1,head1,aq,r))::stack1 ->
               let t2 =
                 FStar_Syntax_Syntax.extend_app head1 (t1, aq)
                   FStar_Pervasives_Native.None r
                  in
               rebuild cfg env1 stack1 t2
           | (Match (env',branches,cfg1,r))::stack1 ->
               (log cfg1
                  (fun uu____25140  ->
                     let uu____25141 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print1
                       "Rebuilding with match, scrutinee is %s ...\n"
                       uu____25141);
                (let scrutinee_env = env  in
                 let env1 = env'  in
                 let scrutinee = t1  in
                 let norm_and_rebuild_match uu____25150 =
                   log cfg1
                     (fun uu____25155  ->
                        let uu____25156 =
                          FStar_Syntax_Print.term_to_string scrutinee  in
                        let uu____25157 =
                          let uu____25158 =
                            FStar_All.pipe_right branches
                              (FStar_List.map
                                 (fun uu____25185  ->
                                    match uu____25185 with
                                    | (p,uu____25195,uu____25196) ->
                                        FStar_Syntax_Print.pat_to_string p))
                             in
                          FStar_All.pipe_right uu____25158
                            (FStar_String.concat "\n\t")
                           in
                        FStar_Util.print2
                          "match is irreducible: scrutinee=%s\nbranches=%s\n"
                          uu____25156 uu____25157);
                   (let whnf = (cfg1.steps).weak || (cfg1.steps).hnf  in
                    let cfg_exclude_zeta =
                      let new_delta =
                        FStar_All.pipe_right cfg1.delta_level
                          (FStar_List.filter
                             (fun uu___253_25213  ->
                                match uu___253_25213 with
                                | FStar_TypeChecker_Env.Inlining  -> true
                                | FStar_TypeChecker_Env.Eager_unfolding_only 
                                    -> true
                                | uu____25214 -> false))
                         in
                      let steps =
                        let uu___346_25216 = cfg1.steps  in
                        {
                          beta = (uu___346_25216.beta);
                          iota = (uu___346_25216.iota);
                          zeta = false;
                          weak = (uu___346_25216.weak);
                          hnf = (uu___346_25216.hnf);
                          primops = (uu___346_25216.primops);
                          do_not_unfold_pure_lets =
                            (uu___346_25216.do_not_unfold_pure_lets);
                          unfold_until = FStar_Pervasives_Native.None;
                          unfold_only = FStar_Pervasives_Native.None;
                          unfold_fully = (uu___346_25216.unfold_fully);
                          unfold_attr = FStar_Pervasives_Native.None;
                          unfold_tac = false;
                          pure_subterms_within_computations =
                            (uu___346_25216.pure_subterms_within_computations);
                          simplify = (uu___346_25216.simplify);
                          erase_universes = (uu___346_25216.erase_universes);
                          allow_unbound_universes =
                            (uu___346_25216.allow_unbound_universes);
                          reify_ = (uu___346_25216.reify_);
                          compress_uvars = (uu___346_25216.compress_uvars);
                          no_full_norm = (uu___346_25216.no_full_norm);
                          check_no_uvars = (uu___346_25216.check_no_uvars);
                          unmeta = (uu___346_25216.unmeta);
                          unascribe = (uu___346_25216.unascribe);
                          in_full_norm_request =
                            (uu___346_25216.in_full_norm_request);
                          weakly_reduce_scrutinee =
                            (uu___346_25216.weakly_reduce_scrutinee)
                        }  in
                      let uu___347_25221 = cfg1  in
                      {
                        steps;
                        tcenv = (uu___347_25221.tcenv);
                        debug = (uu___347_25221.debug);
                        delta_level = new_delta;
                        primitive_steps = (uu___347_25221.primitive_steps);
                        strong = true;
                        memoize_lazy = (uu___347_25221.memoize_lazy);
                        normalize_pure_lets =
                          (uu___347_25221.normalize_pure_lets)
                      }  in
                    let norm_or_whnf env2 t2 =
                      if whnf
                      then closure_as_term cfg_exclude_zeta env2 t2
                      else norm cfg_exclude_zeta env2 [] t2  in
                    let rec norm_pat env2 p =
                      match p.FStar_Syntax_Syntax.v with
                      | FStar_Syntax_Syntax.Pat_constant uu____25293 ->
                          (p, env2)
                      | FStar_Syntax_Syntax.Pat_cons (fv,pats) ->
                          let uu____25322 =
                            FStar_All.pipe_right pats
                              (FStar_List.fold_left
                                 (fun uu____25406  ->
                                    fun uu____25407  ->
                                      match (uu____25406, uu____25407) with
                                      | ((pats1,env3),(p1,b)) ->
                                          let uu____25546 = norm_pat env3 p1
                                             in
                                          (match uu____25546 with
                                           | (p2,env4) ->
                                               (((p2, b) :: pats1), env4)))
                                 ([], env2))
                             in
                          (match uu____25322 with
                           | (pats1,env3) ->
                               ((let uu___348_25708 = p  in
                                 {
                                   FStar_Syntax_Syntax.v =
                                     (FStar_Syntax_Syntax.Pat_cons
                                        (fv, (FStar_List.rev pats1)));
                                   FStar_Syntax_Syntax.p =
                                     (uu___348_25708.FStar_Syntax_Syntax.p)
                                 }), env3))
                      | FStar_Syntax_Syntax.Pat_var x ->
                          let x1 =
                            let uu___349_25727 = x  in
                            let uu____25728 =
                              norm_or_whnf env2 x.FStar_Syntax_Syntax.sort
                               in
                            {
                              FStar_Syntax_Syntax.ppname =
                                (uu___349_25727.FStar_Syntax_Syntax.ppname);
                              FStar_Syntax_Syntax.index =
                                (uu___349_25727.FStar_Syntax_Syntax.index);
                              FStar_Syntax_Syntax.sort = uu____25728
                            }  in
                          ((let uu___350_25742 = p  in
                            {
                              FStar_Syntax_Syntax.v =
                                (FStar_Syntax_Syntax.Pat_var x1);
                              FStar_Syntax_Syntax.p =
                                (uu___350_25742.FStar_Syntax_Syntax.p)
                            }), (dummy :: env2))
                      | FStar_Syntax_Syntax.Pat_wild x ->
                          let x1 =
                            let uu___351_25753 = x  in
                            let uu____25754 =
                              norm_or_whnf env2 x.FStar_Syntax_Syntax.sort
                               in
                            {
                              FStar_Syntax_Syntax.ppname =
                                (uu___351_25753.FStar_Syntax_Syntax.ppname);
                              FStar_Syntax_Syntax.index =
                                (uu___351_25753.FStar_Syntax_Syntax.index);
                              FStar_Syntax_Syntax.sort = uu____25754
                            }  in
                          ((let uu___352_25768 = p  in
                            {
                              FStar_Syntax_Syntax.v =
                                (FStar_Syntax_Syntax.Pat_wild x1);
                              FStar_Syntax_Syntax.p =
                                (uu___352_25768.FStar_Syntax_Syntax.p)
                            }), (dummy :: env2))
                      | FStar_Syntax_Syntax.Pat_dot_term (x,t2) ->
                          let x1 =
                            let uu___353_25784 = x  in
                            let uu____25785 =
                              norm_or_whnf env2 x.FStar_Syntax_Syntax.sort
                               in
                            {
                              FStar_Syntax_Syntax.ppname =
                                (uu___353_25784.FStar_Syntax_Syntax.ppname);
                              FStar_Syntax_Syntax.index =
                                (uu___353_25784.FStar_Syntax_Syntax.index);
                              FStar_Syntax_Syntax.sort = uu____25785
                            }  in
                          let t3 = norm_or_whnf env2 t2  in
                          ((let uu___354_25800 = p  in
                            {
                              FStar_Syntax_Syntax.v =
                                (FStar_Syntax_Syntax.Pat_dot_term (x1, t3));
                              FStar_Syntax_Syntax.p =
                                (uu___354_25800.FStar_Syntax_Syntax.p)
                            }), env2)
                       in
                    let branches1 =
                      match env1 with
                      | [] when whnf -> branches
                      | uu____25844 ->
                          FStar_All.pipe_right branches
                            (FStar_List.map
                               (fun branch1  ->
                                  let uu____25874 =
                                    FStar_Syntax_Subst.open_branch branch1
                                     in
                                  match uu____25874 with
                                  | (p,wopt,e) ->
                                      let uu____25894 = norm_pat env1 p  in
                                      (match uu____25894 with
                                       | (p1,env2) ->
                                           let wopt1 =
                                             match wopt with
                                             | FStar_Pervasives_Native.None 
                                                 ->
                                                 FStar_Pervasives_Native.None
                                             | FStar_Pervasives_Native.Some w
                                                 ->
                                                 let uu____25949 =
                                                   norm_or_whnf env2 w  in
                                                 FStar_Pervasives_Native.Some
                                                   uu____25949
                                              in
                                           let e1 = norm_or_whnf env2 e  in
                                           FStar_Syntax_Util.branch
                                             (p1, wopt1, e1))))
                       in
                    let scrutinee1 =
                      let uu____25966 =
                        ((((cfg1.steps).iota &&
                             (Prims.op_Negation (cfg1.steps).weak))
                            &&
                            (Prims.op_Negation (cfg1.steps).compress_uvars))
                           && (cfg1.steps).weakly_reduce_scrutinee)
                          && (maybe_weakly_reduced scrutinee)
                         in
                      if uu____25966
                      then
                        norm
                          (let uu___355_25971 = cfg1  in
                           {
                             steps =
                               (let uu___356_25974 = cfg1.steps  in
                                {
                                  beta = (uu___356_25974.beta);
                                  iota = (uu___356_25974.iota);
                                  zeta = (uu___356_25974.zeta);
                                  weak = (uu___356_25974.weak);
                                  hnf = (uu___356_25974.hnf);
                                  primops = (uu___356_25974.primops);
                                  do_not_unfold_pure_lets =
                                    (uu___356_25974.do_not_unfold_pure_lets);
                                  unfold_until =
                                    (uu___356_25974.unfold_until);
                                  unfold_only = (uu___356_25974.unfold_only);
                                  unfold_fully =
                                    (uu___356_25974.unfold_fully);
                                  unfold_attr = (uu___356_25974.unfold_attr);
                                  unfold_tac = (uu___356_25974.unfold_tac);
                                  pure_subterms_within_computations =
                                    (uu___356_25974.pure_subterms_within_computations);
                                  simplify = (uu___356_25974.simplify);
                                  erase_universes =
                                    (uu___356_25974.erase_universes);
                                  allow_unbound_universes =
                                    (uu___356_25974.allow_unbound_universes);
                                  reify_ = (uu___356_25974.reify_);
                                  compress_uvars =
                                    (uu___356_25974.compress_uvars);
                                  no_full_norm =
                                    (uu___356_25974.no_full_norm);
                                  check_no_uvars =
                                    (uu___356_25974.check_no_uvars);
                                  unmeta = (uu___356_25974.unmeta);
                                  unascribe = (uu___356_25974.unascribe);
                                  in_full_norm_request =
                                    (uu___356_25974.in_full_norm_request);
                                  weakly_reduce_scrutinee = false
                                });
                             tcenv = (uu___355_25971.tcenv);
                             debug = (uu___355_25971.debug);
                             delta_level = (uu___355_25971.delta_level);
                             primitive_steps =
                               (uu___355_25971.primitive_steps);
                             strong = (uu___355_25971.strong);
                             memoize_lazy = (uu___355_25971.memoize_lazy);
                             normalize_pure_lets =
                               (uu___355_25971.normalize_pure_lets)
                           }) scrutinee_env [] scrutinee
                      else scrutinee  in
                    let uu____25976 =
                      mk
                        (FStar_Syntax_Syntax.Tm_match (scrutinee1, branches1))
                        r
                       in
                    rebuild cfg1 env1 stack1 uu____25976)
                    in
                 let rec is_cons head1 =
                   let uu____26001 =
                     let uu____26002 = FStar_Syntax_Subst.compress head1  in
                     uu____26002.FStar_Syntax_Syntax.n  in
                   match uu____26001 with
                   | FStar_Syntax_Syntax.Tm_uinst (h,uu____26006) ->
                       is_cons h
                   | FStar_Syntax_Syntax.Tm_constant uu____26011 -> true
                   | FStar_Syntax_Syntax.Tm_fvar
                       { FStar_Syntax_Syntax.fv_name = uu____26012;
                         FStar_Syntax_Syntax.fv_delta = uu____26013;
                         FStar_Syntax_Syntax.fv_qual =
                           FStar_Pervasives_Native.Some
                           (FStar_Syntax_Syntax.Data_ctor );_}
                       -> true
                   | FStar_Syntax_Syntax.Tm_fvar
                       { FStar_Syntax_Syntax.fv_name = uu____26014;
                         FStar_Syntax_Syntax.fv_delta = uu____26015;
                         FStar_Syntax_Syntax.fv_qual =
                           FStar_Pervasives_Native.Some
                           (FStar_Syntax_Syntax.Record_ctor uu____26016);_}
                       -> true
                   | uu____26023 -> false  in
                 let guard_when_clause wopt b rest =
                   match wopt with
                   | FStar_Pervasives_Native.None  -> b
                   | FStar_Pervasives_Native.Some w ->
                       let then_branch = b  in
                       let else_branch =
                         mk (FStar_Syntax_Syntax.Tm_match (scrutinee, rest))
                           r
                          in
                       FStar_Syntax_Util.if_then_else w then_branch
                         else_branch
                    in
                 let rec matches_pat scrutinee_orig p =
                   let scrutinee1 = FStar_Syntax_Util.unmeta scrutinee_orig
                      in
                   let uu____26186 =
                     FStar_Syntax_Util.head_and_args scrutinee1  in
                   match uu____26186 with
                   | (head1,args) ->
                       (match p.FStar_Syntax_Syntax.v with
                        | FStar_Syntax_Syntax.Pat_var bv ->
                            FStar_Util.Inl [(bv, scrutinee_orig)]
                        | FStar_Syntax_Syntax.Pat_wild bv ->
                            FStar_Util.Inl [(bv, scrutinee_orig)]
                        | FStar_Syntax_Syntax.Pat_dot_term uu____26273 ->
                            FStar_Util.Inl []
                        | FStar_Syntax_Syntax.Pat_constant s ->
                            (match scrutinee1.FStar_Syntax_Syntax.n with
                             | FStar_Syntax_Syntax.Tm_constant s' when
                                 FStar_Const.eq_const s s' ->
                                 FStar_Util.Inl []
                             | uu____26312 ->
                                 let uu____26313 =
                                   let uu____26314 = is_cons head1  in
                                   Prims.op_Negation uu____26314  in
                                 FStar_Util.Inr uu____26313)
                        | FStar_Syntax_Syntax.Pat_cons (fv,arg_pats) ->
                            let uu____26339 =
                              let uu____26340 =
                                FStar_Syntax_Util.un_uinst head1  in
                              uu____26340.FStar_Syntax_Syntax.n  in
                            (match uu____26339 with
                             | FStar_Syntax_Syntax.Tm_fvar fv' when
                                 FStar_Syntax_Syntax.fv_eq fv fv' ->
                                 matches_args [] args arg_pats
                             | uu____26358 ->
                                 let uu____26359 =
                                   let uu____26360 = is_cons head1  in
                                   Prims.op_Negation uu____26360  in
                                 FStar_Util.Inr uu____26359))
                 
                 and matches_args out a p =
                   match (a, p) with
                   | ([],[]) -> FStar_Util.Inl out
                   | ((t2,uu____26437)::rest_a,(p1,uu____26440)::rest_p) ->
                       let uu____26484 = matches_pat t2 p1  in
                       (match uu____26484 with
                        | FStar_Util.Inl s ->
                            matches_args (FStar_List.append out s) rest_a
                              rest_p
                        | m -> m)
                   | uu____26533 -> FStar_Util.Inr false
                  in
                 let rec matches scrutinee1 p =
                   match p with
                   | [] -> norm_and_rebuild_match ()
                   | (p1,wopt,b)::rest ->
                       let uu____26651 = matches_pat scrutinee1 p1  in
                       (match uu____26651 with
                        | FStar_Util.Inr (false ) -> matches scrutinee1 rest
                        | FStar_Util.Inr (true ) -> norm_and_rebuild_match ()
                        | FStar_Util.Inl s ->
                            (log cfg1
                               (fun uu____26691  ->
                                  let uu____26692 =
                                    FStar_Syntax_Print.pat_to_string p1  in
                                  let uu____26693 =
                                    let uu____26694 =
                                      FStar_List.map
                                        (fun uu____26704  ->
                                           match uu____26704 with
                                           | (uu____26709,t2) ->
                                               FStar_Syntax_Print.term_to_string
                                                 t2) s
                                       in
                                    FStar_All.pipe_right uu____26694
                                      (FStar_String.concat "; ")
                                     in
                                  FStar_Util.print2
                                    "Matches pattern %s with subst = %s\n"
                                    uu____26692 uu____26693);
                             (let env0 = env1  in
                              let env2 =
                                FStar_List.fold_left
                                  (fun env2  ->
                                     fun uu____26741  ->
                                       match uu____26741 with
                                       | (bv,t2) ->
                                           let uu____26764 =
                                             let uu____26771 =
                                               let uu____26774 =
                                                 FStar_Syntax_Syntax.mk_binder
                                                   bv
                                                  in
                                               FStar_Pervasives_Native.Some
                                                 uu____26774
                                                in
                                             let uu____26775 =
                                               let uu____26776 =
                                                 let uu____26807 =
                                                   FStar_Util.mk_ref
                                                     (FStar_Pervasives_Native.Some
                                                        ([], t2))
                                                    in
                                                 ([], t2, uu____26807, false)
                                                  in
                                               Clos uu____26776  in
                                             (uu____26771, uu____26775)  in
                                           uu____26764 :: env2) env1 s
                                 in
                              let uu____26920 = guard_when_clause wopt b rest
                                 in
                              norm cfg1 env2 stack1 uu____26920)))
                    in
                 if (cfg1.steps).iota
                 then matches scrutinee branches
                 else norm_and_rebuild_match ())))

let (plugins :
  (primitive_step -> unit,unit -> primitive_step Prims.list)
    FStar_Pervasives_Native.tuple2)
  =
  let plugins = FStar_Util.mk_ref []  in
  let register p =
    let uu____26947 =
      let uu____26950 = FStar_ST.op_Bang plugins  in p :: uu____26950  in
    FStar_ST.op_Colon_Equals plugins uu____26947  in
  let retrieve uu____27058 = FStar_ST.op_Bang plugins  in
  (register, retrieve) 
let (register_plugin : primitive_step -> unit) =
  fun p  -> FStar_Pervasives_Native.fst plugins p 
let (retrieve_plugins : unit -> primitive_step Prims.list) =
  fun uu____27135  -> FStar_Pervasives_Native.snd plugins () 
let (config' :
  primitive_step Prims.list ->
    step Prims.list -> FStar_TypeChecker_Env.env -> cfg)
  =
  fun psteps  ->
    fun s  ->
      fun e  ->
        let d =
          FStar_All.pipe_right s
            (FStar_List.collect
               (fun uu___254_27176  ->
                  match uu___254_27176 with
                  | UnfoldUntil k -> [FStar_TypeChecker_Env.Unfold k]
                  | Eager_unfolding  ->
                      [FStar_TypeChecker_Env.Eager_unfolding_only]
                  | Inlining  -> [FStar_TypeChecker_Env.Inlining]
                  | UnfoldTac  -> [FStar_TypeChecker_Env.UnfoldTac]
                  | uu____27180 -> []))
           in
        let d1 =
          match d with
          | [] -> [FStar_TypeChecker_Env.NoDelta]
          | uu____27186 -> d  in
        let uu____27189 = to_fsteps s  in
        let uu____27190 =
          let uu____27191 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "Norm")  in
          let uu____27192 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "Primops")  in
          let uu____27193 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "Unfolding")
             in
          let uu____27194 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "380")  in
          let uu____27195 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "WPE")  in
          let uu____27196 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "NormDelayed")
             in
          let uu____27197 =
            FStar_TypeChecker_Env.debug e
              (FStar_Options.Other "print_normalized_terms")
             in
          {
            gen = uu____27191;
            primop = uu____27192;
            unfolding = uu____27193;
            b380 = uu____27194;
            wpe = uu____27195;
            norm_delayed = uu____27196;
            print_normalized = uu____27197
          }  in
        let uu____27198 =
          let uu____27201 =
            let uu____27204 = retrieve_plugins ()  in
            FStar_List.append uu____27204 psteps  in
          add_steps built_in_primitive_steps uu____27201  in
        let uu____27207 =
          (FStar_Options.normalize_pure_terms_for_extraction ()) ||
            (let uu____27209 =
               FStar_All.pipe_right s
                 (FStar_List.contains PureSubtermsWithinComputations)
                in
             Prims.op_Negation uu____27209)
           in
        {
          steps = uu____27189;
          tcenv = e;
          debug = uu____27190;
          delta_level = d1;
          primitive_steps = uu____27198;
          strong = false;
          memoize_lazy = true;
          normalize_pure_lets = uu____27207
        }
  
let (config : step Prims.list -> FStar_TypeChecker_Env.env -> cfg) =
  fun s  -> fun e  -> config' [] s e 
let (normalize_with_primitive_steps :
  primitive_step Prims.list ->
    step Prims.list ->
      FStar_TypeChecker_Env.env ->
        FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun ps  ->
    fun s  -> fun e  -> fun t  -> let c = config' ps s e  in norm c [] [] t
  
let (normalize :
  steps ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  = fun s  -> fun e  -> fun t  -> normalize_with_primitive_steps [] s e t 
let (normalize_comp :
  steps ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp)
  =
  fun s  ->
    fun e  ->
      fun t  -> let uu____27291 = config s e  in norm_comp uu____27291 [] t
  
let (normalize_universe :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe -> FStar_Syntax_Syntax.universe)
  =
  fun env  ->
    fun u  ->
      let uu____27308 = config [] env  in norm_universe uu____27308 [] u
  
let (ghost_to_pure :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun c  ->
      let cfg =
        config
          [UnfoldUntil FStar_Syntax_Syntax.delta_constant;
          AllowUnboundUniverses;
          EraseUniverses] env
         in
      let non_info t =
        let uu____27332 = norm cfg [] [] t  in
        FStar_Syntax_Util.non_informative uu____27332  in
      match c.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Total uu____27339 -> c
      | FStar_Syntax_Syntax.GTotal (t,uopt) when non_info t ->
          let uu___357_27358 = c  in
          {
            FStar_Syntax_Syntax.n = (FStar_Syntax_Syntax.Total (t, uopt));
            FStar_Syntax_Syntax.pos =
              (uu___357_27358.FStar_Syntax_Syntax.pos);
            FStar_Syntax_Syntax.vars =
              (uu___357_27358.FStar_Syntax_Syntax.vars)
          }
      | FStar_Syntax_Syntax.Comp ct ->
          let l =
            FStar_TypeChecker_Env.norm_eff_name cfg.tcenv
              ct.FStar_Syntax_Syntax.effect_name
             in
          let uu____27365 =
            (FStar_Syntax_Util.is_ghost_effect l) &&
              (non_info ct.FStar_Syntax_Syntax.result_typ)
             in
          if uu____27365
          then
            let ct1 =
              let uu____27367 =
                downgrade_ghost_effect_name
                  ct.FStar_Syntax_Syntax.effect_name
                 in
              match uu____27367 with
              | FStar_Pervasives_Native.Some pure_eff ->
                  let flags1 =
                    let uu____27374 =
                      FStar_Ident.lid_equals pure_eff
                        FStar_Parser_Const.effect_Tot_lid
                       in
                    if uu____27374
                    then FStar_Syntax_Syntax.TOTAL ::
                      (ct.FStar_Syntax_Syntax.flags)
                    else ct.FStar_Syntax_Syntax.flags  in
                  let uu___358_27378 = ct  in
                  {
                    FStar_Syntax_Syntax.comp_univs =
                      (uu___358_27378.FStar_Syntax_Syntax.comp_univs);
                    FStar_Syntax_Syntax.effect_name = pure_eff;
                    FStar_Syntax_Syntax.result_typ =
                      (uu___358_27378.FStar_Syntax_Syntax.result_typ);
                    FStar_Syntax_Syntax.effect_args =
                      (uu___358_27378.FStar_Syntax_Syntax.effect_args);
                    FStar_Syntax_Syntax.flags = flags1
                  }
              | FStar_Pervasives_Native.None  ->
                  let ct1 =
                    FStar_TypeChecker_Env.unfold_effect_abbrev cfg.tcenv c
                     in
                  let uu___359_27380 = ct1  in
                  {
                    FStar_Syntax_Syntax.comp_univs =
                      (uu___359_27380.FStar_Syntax_Syntax.comp_univs);
                    FStar_Syntax_Syntax.effect_name =
                      FStar_Parser_Const.effect_PURE_lid;
                    FStar_Syntax_Syntax.result_typ =
                      (uu___359_27380.FStar_Syntax_Syntax.result_typ);
                    FStar_Syntax_Syntax.effect_args =
                      (uu___359_27380.FStar_Syntax_Syntax.effect_args);
                    FStar_Syntax_Syntax.flags =
                      (uu___359_27380.FStar_Syntax_Syntax.flags)
                  }
               in
            let uu___360_27381 = c  in
            {
              FStar_Syntax_Syntax.n = (FStar_Syntax_Syntax.Comp ct1);
              FStar_Syntax_Syntax.pos =
                (uu___360_27381.FStar_Syntax_Syntax.pos);
              FStar_Syntax_Syntax.vars =
                (uu___360_27381.FStar_Syntax_Syntax.vars)
            }
          else c
      | uu____27383 -> c
  
let (ghost_to_pure_lcomp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.lcomp -> FStar_Syntax_Syntax.lcomp)
  =
  fun env  ->
    fun lc  ->
      let cfg =
        config
          [Eager_unfolding;
          UnfoldUntil FStar_Syntax_Syntax.delta_constant;
          EraseUniverses;
          AllowUnboundUniverses] env
         in
      let non_info t =
        let uu____27401 = norm cfg [] [] t  in
        FStar_Syntax_Util.non_informative uu____27401  in
      let uu____27408 =
        (FStar_Syntax_Util.is_ghost_effect lc.FStar_Syntax_Syntax.eff_name)
          && (non_info lc.FStar_Syntax_Syntax.res_typ)
         in
      if uu____27408
      then
        let uu____27409 =
          downgrade_ghost_effect_name lc.FStar_Syntax_Syntax.eff_name  in
        match uu____27409 with
        | FStar_Pervasives_Native.Some pure_eff ->
            FStar_Syntax_Syntax.mk_lcomp pure_eff
              lc.FStar_Syntax_Syntax.res_typ lc.FStar_Syntax_Syntax.cflags
              (fun uu____27415  ->
                 let uu____27416 = FStar_Syntax_Syntax.lcomp_comp lc  in
                 ghost_to_pure env uu____27416)
        | FStar_Pervasives_Native.None  -> lc
      else lc
  
let (term_to_string :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> Prims.string) =
  fun env  ->
    fun t  ->
      let t1 =
        try normalize [AllowUnboundUniverses] env t
        with
        | e ->
            ((let uu____27437 =
                let uu____27442 =
                  let uu____27443 = FStar_Util.message_of_exn e  in
                  FStar_Util.format1 "Normalization failed with error %s\n"
                    uu____27443
                   in
                (FStar_Errors.Warning_NormalizationFailure, uu____27442)  in
              FStar_Errors.log_issue t.FStar_Syntax_Syntax.pos uu____27437);
             t)
         in
      FStar_Syntax_Print.term_to_string' env.FStar_TypeChecker_Env.dsenv t1
  
let (comp_to_string :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.comp -> Prims.string) =
  fun env  ->
    fun c  ->
      let c1 =
        try
          let uu____27458 = config [AllowUnboundUniverses] env  in
          norm_comp uu____27458 [] c
        with
        | e ->
            ((let uu____27471 =
                let uu____27476 =
                  let uu____27477 = FStar_Util.message_of_exn e  in
                  FStar_Util.format1 "Normalization failed with error %s\n"
                    uu____27477
                   in
                (FStar_Errors.Warning_NormalizationFailure, uu____27476)  in
              FStar_Errors.log_issue c.FStar_Syntax_Syntax.pos uu____27471);
             c)
         in
      FStar_Syntax_Print.comp_to_string' env.FStar_TypeChecker_Env.dsenv c1
  
let (normalize_refinement :
  steps ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ)
  =
  fun steps  ->
    fun env  ->
      fun t0  ->
        let t = normalize (FStar_List.append steps [Beta]) env t0  in
        let rec aux t1 =
          let t2 = FStar_Syntax_Subst.compress t1  in
          match t2.FStar_Syntax_Syntax.n with
          | FStar_Syntax_Syntax.Tm_refine (x,phi) ->
              let t01 = aux x.FStar_Syntax_Syntax.sort  in
              (match t01.FStar_Syntax_Syntax.n with
               | FStar_Syntax_Syntax.Tm_refine (y,phi1) ->
                   let uu____27522 =
                     let uu____27523 =
                       let uu____27530 =
                         FStar_Syntax_Util.mk_conj_simp phi1 phi  in
                       (y, uu____27530)  in
                     FStar_Syntax_Syntax.Tm_refine uu____27523  in
                   mk uu____27522 t01.FStar_Syntax_Syntax.pos
               | uu____27535 -> t2)
          | uu____27536 -> t2  in
        aux t
  
let (unfold_whnf :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t  ->
      normalize
        [Primops;
        Weak;
        HNF;
        UnfoldUntil FStar_Syntax_Syntax.delta_constant;
        Beta] env t
  
let (reduce_or_remove_uvar_solutions :
  Prims.bool ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun remove  ->
    fun env  ->
      fun t  ->
        normalize
          (FStar_List.append (if remove then [CheckNoUvars] else [])
             [Beta;
             DoNotUnfoldPureLets;
             CompressUvars;
             Exclude Zeta;
             Exclude Iota;
             NoFullNorm]) env t
  
let (reduce_uvar_solutions :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  = fun env  -> fun t  -> reduce_or_remove_uvar_solutions false env t 
let (remove_uvar_solutions :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  = fun env  -> fun t  -> reduce_or_remove_uvar_solutions true env t 
let (eta_expand_with_type :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun e  ->
      fun t_e  ->
        let uu____27600 = FStar_Syntax_Util.arrow_formals_comp t_e  in
        match uu____27600 with
        | (formals,c) ->
            (match formals with
             | [] -> e
             | uu____27629 ->
                 let uu____27636 = FStar_Syntax_Util.abs_formals e  in
                 (match uu____27636 with
                  | (actuals,uu____27646,uu____27647) ->
                      if
                        (FStar_List.length actuals) =
                          (FStar_List.length formals)
                      then e
                      else
                        (let uu____27661 =
                           FStar_All.pipe_right formals
                             FStar_Syntax_Util.args_of_binders
                            in
                         match uu____27661 with
                         | (binders,args) ->
                             let uu____27672 =
                               FStar_Syntax_Syntax.mk_Tm_app e args
                                 FStar_Pervasives_Native.None
                                 e.FStar_Syntax_Syntax.pos
                                in
                             FStar_Syntax_Util.abs binders uu____27672
                               (FStar_Pervasives_Native.Some
                                  (FStar_Syntax_Util.residual_comp_of_comp c)))))
  
let (eta_expand :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t  ->
      match t.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_name x ->
          eta_expand_with_type env t x.FStar_Syntax_Syntax.sort
      | uu____27686 ->
          let uu____27687 = FStar_Syntax_Util.head_and_args t  in
          (match uu____27687 with
           | (head1,args) ->
               let uu____27724 =
                 let uu____27725 = FStar_Syntax_Subst.compress head1  in
                 uu____27725.FStar_Syntax_Syntax.n  in
               (match uu____27724 with
                | FStar_Syntax_Syntax.Tm_uvar (u,s) ->
                    let uu____27746 =
                      let uu____27759 =
                        FStar_Syntax_Subst.subst' s
                          u.FStar_Syntax_Syntax.ctx_uvar_typ
                         in
                      FStar_Syntax_Util.arrow_formals uu____27759  in
                    (match uu____27746 with
                     | (formals,_tres) ->
                         if
                           (FStar_List.length formals) =
                             (FStar_List.length args)
                         then t
                         else
                           (let uu____27789 =
                              env.FStar_TypeChecker_Env.type_of
                                (let uu___365_27797 = env  in
                                 {
                                   FStar_TypeChecker_Env.solver =
                                     (uu___365_27797.FStar_TypeChecker_Env.solver);
                                   FStar_TypeChecker_Env.range =
                                     (uu___365_27797.FStar_TypeChecker_Env.range);
                                   FStar_TypeChecker_Env.curmodule =
                                     (uu___365_27797.FStar_TypeChecker_Env.curmodule);
                                   FStar_TypeChecker_Env.gamma =
                                     (uu___365_27797.FStar_TypeChecker_Env.gamma);
                                   FStar_TypeChecker_Env.gamma_sig =
                                     (uu___365_27797.FStar_TypeChecker_Env.gamma_sig);
                                   FStar_TypeChecker_Env.gamma_cache =
                                     (uu___365_27797.FStar_TypeChecker_Env.gamma_cache);
                                   FStar_TypeChecker_Env.modules =
                                     (uu___365_27797.FStar_TypeChecker_Env.modules);
                                   FStar_TypeChecker_Env.expected_typ =
                                     FStar_Pervasives_Native.None;
                                   FStar_TypeChecker_Env.sigtab =
                                     (uu___365_27797.FStar_TypeChecker_Env.sigtab);
                                   FStar_TypeChecker_Env.is_pattern =
                                     (uu___365_27797.FStar_TypeChecker_Env.is_pattern);
                                   FStar_TypeChecker_Env.instantiate_imp =
                                     (uu___365_27797.FStar_TypeChecker_Env.instantiate_imp);
                                   FStar_TypeChecker_Env.effects =
                                     (uu___365_27797.FStar_TypeChecker_Env.effects);
                                   FStar_TypeChecker_Env.generalize =
                                     (uu___365_27797.FStar_TypeChecker_Env.generalize);
                                   FStar_TypeChecker_Env.letrecs =
                                     (uu___365_27797.FStar_TypeChecker_Env.letrecs);
                                   FStar_TypeChecker_Env.top_level =
                                     (uu___365_27797.FStar_TypeChecker_Env.top_level);
                                   FStar_TypeChecker_Env.check_uvars =
                                     (uu___365_27797.FStar_TypeChecker_Env.check_uvars);
                                   FStar_TypeChecker_Env.use_eq =
                                     (uu___365_27797.FStar_TypeChecker_Env.use_eq);
                                   FStar_TypeChecker_Env.is_iface =
                                     (uu___365_27797.FStar_TypeChecker_Env.is_iface);
                                   FStar_TypeChecker_Env.admit =
                                     (uu___365_27797.FStar_TypeChecker_Env.admit);
                                   FStar_TypeChecker_Env.lax = true;
                                   FStar_TypeChecker_Env.lax_universes =
                                     (uu___365_27797.FStar_TypeChecker_Env.lax_universes);
                                   FStar_TypeChecker_Env.failhard =
                                     (uu___365_27797.FStar_TypeChecker_Env.failhard);
                                   FStar_TypeChecker_Env.nosynth =
                                     (uu___365_27797.FStar_TypeChecker_Env.nosynth);
                                   FStar_TypeChecker_Env.uvar_subtyping =
                                     (uu___365_27797.FStar_TypeChecker_Env.uvar_subtyping);
                                   FStar_TypeChecker_Env.tc_term =
                                     (uu___365_27797.FStar_TypeChecker_Env.tc_term);
                                   FStar_TypeChecker_Env.type_of =
                                     (uu___365_27797.FStar_TypeChecker_Env.type_of);
                                   FStar_TypeChecker_Env.universe_of =
                                     (uu___365_27797.FStar_TypeChecker_Env.universe_of);
                                   FStar_TypeChecker_Env.check_type_of =
                                     (uu___365_27797.FStar_TypeChecker_Env.check_type_of);
                                   FStar_TypeChecker_Env.use_bv_sorts = true;
                                   FStar_TypeChecker_Env.qtbl_name_and_index
                                     =
                                     (uu___365_27797.FStar_TypeChecker_Env.qtbl_name_and_index);
                                   FStar_TypeChecker_Env.normalized_eff_names
                                     =
                                     (uu___365_27797.FStar_TypeChecker_Env.normalized_eff_names);
                                   FStar_TypeChecker_Env.proof_ns =
                                     (uu___365_27797.FStar_TypeChecker_Env.proof_ns);
                                   FStar_TypeChecker_Env.synth_hook =
                                     (uu___365_27797.FStar_TypeChecker_Env.synth_hook);
                                   FStar_TypeChecker_Env.splice =
                                     (uu___365_27797.FStar_TypeChecker_Env.splice);
                                   FStar_TypeChecker_Env.is_native_tactic =
                                     (uu___365_27797.FStar_TypeChecker_Env.is_native_tactic);
                                   FStar_TypeChecker_Env.identifier_info =
                                     (uu___365_27797.FStar_TypeChecker_Env.identifier_info);
                                   FStar_TypeChecker_Env.tc_hooks =
                                     (uu___365_27797.FStar_TypeChecker_Env.tc_hooks);
                                   FStar_TypeChecker_Env.dsenv =
                                     (uu___365_27797.FStar_TypeChecker_Env.dsenv);
                                   FStar_TypeChecker_Env.dep_graph =
                                     (uu___365_27797.FStar_TypeChecker_Env.dep_graph)
                                 }) t
                               in
                            match uu____27789 with
                            | (uu____27798,ty,uu____27800) ->
                                eta_expand_with_type env t ty))
                | uu____27801 ->
                    let uu____27802 =
                      env.FStar_TypeChecker_Env.type_of
                        (let uu___366_27810 = env  in
                         {
                           FStar_TypeChecker_Env.solver =
                             (uu___366_27810.FStar_TypeChecker_Env.solver);
                           FStar_TypeChecker_Env.range =
                             (uu___366_27810.FStar_TypeChecker_Env.range);
                           FStar_TypeChecker_Env.curmodule =
                             (uu___366_27810.FStar_TypeChecker_Env.curmodule);
                           FStar_TypeChecker_Env.gamma =
                             (uu___366_27810.FStar_TypeChecker_Env.gamma);
                           FStar_TypeChecker_Env.gamma_sig =
                             (uu___366_27810.FStar_TypeChecker_Env.gamma_sig);
                           FStar_TypeChecker_Env.gamma_cache =
                             (uu___366_27810.FStar_TypeChecker_Env.gamma_cache);
                           FStar_TypeChecker_Env.modules =
                             (uu___366_27810.FStar_TypeChecker_Env.modules);
                           FStar_TypeChecker_Env.expected_typ =
                             FStar_Pervasives_Native.None;
                           FStar_TypeChecker_Env.sigtab =
                             (uu___366_27810.FStar_TypeChecker_Env.sigtab);
                           FStar_TypeChecker_Env.is_pattern =
                             (uu___366_27810.FStar_TypeChecker_Env.is_pattern);
                           FStar_TypeChecker_Env.instantiate_imp =
                             (uu___366_27810.FStar_TypeChecker_Env.instantiate_imp);
                           FStar_TypeChecker_Env.effects =
                             (uu___366_27810.FStar_TypeChecker_Env.effects);
                           FStar_TypeChecker_Env.generalize =
                             (uu___366_27810.FStar_TypeChecker_Env.generalize);
                           FStar_TypeChecker_Env.letrecs =
                             (uu___366_27810.FStar_TypeChecker_Env.letrecs);
                           FStar_TypeChecker_Env.top_level =
                             (uu___366_27810.FStar_TypeChecker_Env.top_level);
                           FStar_TypeChecker_Env.check_uvars =
                             (uu___366_27810.FStar_TypeChecker_Env.check_uvars);
                           FStar_TypeChecker_Env.use_eq =
                             (uu___366_27810.FStar_TypeChecker_Env.use_eq);
                           FStar_TypeChecker_Env.is_iface =
                             (uu___366_27810.FStar_TypeChecker_Env.is_iface);
                           FStar_TypeChecker_Env.admit =
                             (uu___366_27810.FStar_TypeChecker_Env.admit);
                           FStar_TypeChecker_Env.lax = true;
                           FStar_TypeChecker_Env.lax_universes =
                             (uu___366_27810.FStar_TypeChecker_Env.lax_universes);
                           FStar_TypeChecker_Env.failhard =
                             (uu___366_27810.FStar_TypeChecker_Env.failhard);
                           FStar_TypeChecker_Env.nosynth =
                             (uu___366_27810.FStar_TypeChecker_Env.nosynth);
                           FStar_TypeChecker_Env.uvar_subtyping =
                             (uu___366_27810.FStar_TypeChecker_Env.uvar_subtyping);
                           FStar_TypeChecker_Env.tc_term =
                             (uu___366_27810.FStar_TypeChecker_Env.tc_term);
                           FStar_TypeChecker_Env.type_of =
                             (uu___366_27810.FStar_TypeChecker_Env.type_of);
                           FStar_TypeChecker_Env.universe_of =
                             (uu___366_27810.FStar_TypeChecker_Env.universe_of);
                           FStar_TypeChecker_Env.check_type_of =
                             (uu___366_27810.FStar_TypeChecker_Env.check_type_of);
                           FStar_TypeChecker_Env.use_bv_sorts = true;
                           FStar_TypeChecker_Env.qtbl_name_and_index =
                             (uu___366_27810.FStar_TypeChecker_Env.qtbl_name_and_index);
                           FStar_TypeChecker_Env.normalized_eff_names =
                             (uu___366_27810.FStar_TypeChecker_Env.normalized_eff_names);
                           FStar_TypeChecker_Env.proof_ns =
                             (uu___366_27810.FStar_TypeChecker_Env.proof_ns);
                           FStar_TypeChecker_Env.synth_hook =
                             (uu___366_27810.FStar_TypeChecker_Env.synth_hook);
                           FStar_TypeChecker_Env.splice =
                             (uu___366_27810.FStar_TypeChecker_Env.splice);
                           FStar_TypeChecker_Env.is_native_tactic =
                             (uu___366_27810.FStar_TypeChecker_Env.is_native_tactic);
                           FStar_TypeChecker_Env.identifier_info =
                             (uu___366_27810.FStar_TypeChecker_Env.identifier_info);
                           FStar_TypeChecker_Env.tc_hooks =
                             (uu___366_27810.FStar_TypeChecker_Env.tc_hooks);
                           FStar_TypeChecker_Env.dsenv =
                             (uu___366_27810.FStar_TypeChecker_Env.dsenv);
                           FStar_TypeChecker_Env.dep_graph =
                             (uu___366_27810.FStar_TypeChecker_Env.dep_graph)
                         }) t
                       in
                    (match uu____27802 with
                     | (uu____27811,ty,uu____27813) ->
                         eta_expand_with_type env t ty)))
  
let rec (elim_delayed_subst_term :
  FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun t  ->
    let mk1 x =
      FStar_Syntax_Syntax.mk x FStar_Pervasives_Native.None
        t.FStar_Syntax_Syntax.pos
       in
    let t1 = FStar_Syntax_Subst.compress t  in
    let elim_bv x =
      let uu___367_27886 = x  in
      let uu____27887 = elim_delayed_subst_term x.FStar_Syntax_Syntax.sort
         in
      {
        FStar_Syntax_Syntax.ppname =
          (uu___367_27886.FStar_Syntax_Syntax.ppname);
        FStar_Syntax_Syntax.index =
          (uu___367_27886.FStar_Syntax_Syntax.index);
        FStar_Syntax_Syntax.sort = uu____27887
      }  in
    match t1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_delayed uu____27890 -> failwith "Impossible"
    | FStar_Syntax_Syntax.Tm_bvar uu____27913 -> t1
    | FStar_Syntax_Syntax.Tm_name uu____27914 -> t1
    | FStar_Syntax_Syntax.Tm_fvar uu____27915 -> t1
    | FStar_Syntax_Syntax.Tm_uinst uu____27916 -> t1
    | FStar_Syntax_Syntax.Tm_constant uu____27923 -> t1
    | FStar_Syntax_Syntax.Tm_type uu____27924 -> t1
    | FStar_Syntax_Syntax.Tm_lazy uu____27925 -> t1
    | FStar_Syntax_Syntax.Tm_unknown  -> t1
    | FStar_Syntax_Syntax.Tm_abs (bs,t2,rc_opt) ->
        let elim_rc rc =
          let uu___368_27955 = rc  in
          let uu____27956 =
            FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ
              elim_delayed_subst_term
             in
          let uu____27965 =
            elim_delayed_subst_cflags rc.FStar_Syntax_Syntax.residual_flags
             in
          {
            FStar_Syntax_Syntax.residual_effect =
              (uu___368_27955.FStar_Syntax_Syntax.residual_effect);
            FStar_Syntax_Syntax.residual_typ = uu____27956;
            FStar_Syntax_Syntax.residual_flags = uu____27965
          }  in
        let uu____27968 =
          let uu____27969 =
            let uu____27986 = elim_delayed_subst_binders bs  in
            let uu____27993 = elim_delayed_subst_term t2  in
            let uu____27996 = FStar_Util.map_opt rc_opt elim_rc  in
            (uu____27986, uu____27993, uu____27996)  in
          FStar_Syntax_Syntax.Tm_abs uu____27969  in
        mk1 uu____27968
    | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
        let uu____28027 =
          let uu____28028 =
            let uu____28041 = elim_delayed_subst_binders bs  in
            let uu____28048 = elim_delayed_subst_comp c  in
            (uu____28041, uu____28048)  in
          FStar_Syntax_Syntax.Tm_arrow uu____28028  in
        mk1 uu____28027
    | FStar_Syntax_Syntax.Tm_refine (bv,phi) ->
        let uu____28065 =
          let uu____28066 =
            let uu____28073 = elim_bv bv  in
            let uu____28074 = elim_delayed_subst_term phi  in
            (uu____28073, uu____28074)  in
          FStar_Syntax_Syntax.Tm_refine uu____28066  in
        mk1 uu____28065
    | FStar_Syntax_Syntax.Tm_app (t2,args) ->
        let uu____28101 =
          let uu____28102 =
            let uu____28117 = elim_delayed_subst_term t2  in
            let uu____28120 = elim_delayed_subst_args args  in
            (uu____28117, uu____28120)  in
          FStar_Syntax_Syntax.Tm_app uu____28102  in
        mk1 uu____28101
    | FStar_Syntax_Syntax.Tm_match (t2,branches) ->
        let rec elim_pat p =
          match p.FStar_Syntax_Syntax.v with
          | FStar_Syntax_Syntax.Pat_var x ->
              let uu___369_28188 = p  in
              let uu____28189 =
                let uu____28190 = elim_bv x  in
                FStar_Syntax_Syntax.Pat_var uu____28190  in
              {
                FStar_Syntax_Syntax.v = uu____28189;
                FStar_Syntax_Syntax.p =
                  (uu___369_28188.FStar_Syntax_Syntax.p)
              }
          | FStar_Syntax_Syntax.Pat_wild x ->
              let uu___370_28192 = p  in
              let uu____28193 =
                let uu____28194 = elim_bv x  in
                FStar_Syntax_Syntax.Pat_wild uu____28194  in
              {
                FStar_Syntax_Syntax.v = uu____28193;
                FStar_Syntax_Syntax.p =
                  (uu___370_28192.FStar_Syntax_Syntax.p)
              }
          | FStar_Syntax_Syntax.Pat_dot_term (x,t0) ->
              let uu___371_28201 = p  in
              let uu____28202 =
                let uu____28203 =
                  let uu____28210 = elim_bv x  in
                  let uu____28211 = elim_delayed_subst_term t0  in
                  (uu____28210, uu____28211)  in
                FStar_Syntax_Syntax.Pat_dot_term uu____28203  in
              {
                FStar_Syntax_Syntax.v = uu____28202;
                FStar_Syntax_Syntax.p =
                  (uu___371_28201.FStar_Syntax_Syntax.p)
              }
          | FStar_Syntax_Syntax.Pat_cons (fv,pats) ->
              let uu___372_28234 = p  in
              let uu____28235 =
                let uu____28236 =
                  let uu____28249 =
                    FStar_List.map
                      (fun uu____28272  ->
                         match uu____28272 with
                         | (x,b) ->
                             let uu____28285 = elim_pat x  in
                             (uu____28285, b)) pats
                     in
                  (fv, uu____28249)  in
                FStar_Syntax_Syntax.Pat_cons uu____28236  in
              {
                FStar_Syntax_Syntax.v = uu____28235;
                FStar_Syntax_Syntax.p =
                  (uu___372_28234.FStar_Syntax_Syntax.p)
              }
          | uu____28298 -> p  in
        let elim_branch uu____28322 =
          match uu____28322 with
          | (pat,wopt,t3) ->
              let uu____28348 = elim_pat pat  in
              let uu____28351 =
                FStar_Util.map_opt wopt elim_delayed_subst_term  in
              let uu____28354 = elim_delayed_subst_term t3  in
              (uu____28348, uu____28351, uu____28354)
           in
        let uu____28359 =
          let uu____28360 =
            let uu____28383 = elim_delayed_subst_term t2  in
            let uu____28386 = FStar_List.map elim_branch branches  in
            (uu____28383, uu____28386)  in
          FStar_Syntax_Syntax.Tm_match uu____28360  in
        mk1 uu____28359
    | FStar_Syntax_Syntax.Tm_ascribed (t2,a,lopt) ->
        let elim_ascription uu____28517 =
          match uu____28517 with
          | (tc,topt) ->
              let uu____28552 =
                match tc with
                | FStar_Util.Inl t3 ->
                    let uu____28562 = elim_delayed_subst_term t3  in
                    FStar_Util.Inl uu____28562
                | FStar_Util.Inr c ->
                    let uu____28564 = elim_delayed_subst_comp c  in
                    FStar_Util.Inr uu____28564
                 in
              let uu____28565 =
                FStar_Util.map_opt topt elim_delayed_subst_term  in
              (uu____28552, uu____28565)
           in
        let uu____28574 =
          let uu____28575 =
            let uu____28602 = elim_delayed_subst_term t2  in
            let uu____28605 = elim_ascription a  in
            (uu____28602, uu____28605, lopt)  in
          FStar_Syntax_Syntax.Tm_ascribed uu____28575  in
        mk1 uu____28574
    | FStar_Syntax_Syntax.Tm_let (lbs,t2) ->
        let elim_lb lb =
          let uu___373_28666 = lb  in
          let uu____28667 =
            elim_delayed_subst_term lb.FStar_Syntax_Syntax.lbtyp  in
          let uu____28670 =
            elim_delayed_subst_term lb.FStar_Syntax_Syntax.lbdef  in
          {
            FStar_Syntax_Syntax.lbname =
              (uu___373_28666.FStar_Syntax_Syntax.lbname);
            FStar_Syntax_Syntax.lbunivs =
              (uu___373_28666.FStar_Syntax_Syntax.lbunivs);
            FStar_Syntax_Syntax.lbtyp = uu____28667;
            FStar_Syntax_Syntax.lbeff =
              (uu___373_28666.FStar_Syntax_Syntax.lbeff);
            FStar_Syntax_Syntax.lbdef = uu____28670;
            FStar_Syntax_Syntax.lbattrs =
              (uu___373_28666.FStar_Syntax_Syntax.lbattrs);
            FStar_Syntax_Syntax.lbpos =
              (uu___373_28666.FStar_Syntax_Syntax.lbpos)
          }  in
        let uu____28673 =
          let uu____28674 =
            let uu____28687 =
              let uu____28694 =
                FStar_List.map elim_lb (FStar_Pervasives_Native.snd lbs)  in
              ((FStar_Pervasives_Native.fst lbs), uu____28694)  in
            let uu____28703 = elim_delayed_subst_term t2  in
            (uu____28687, uu____28703)  in
          FStar_Syntax_Syntax.Tm_let uu____28674  in
        mk1 uu____28673
    | FStar_Syntax_Syntax.Tm_uvar (u,s) ->
        mk1 (FStar_Syntax_Syntax.Tm_uvar (u, s))
    | FStar_Syntax_Syntax.Tm_quoted (tm,qi) ->
        let qi1 =
          FStar_Syntax_Syntax.on_antiquoted elim_delayed_subst_term qi  in
        let uu____28747 =
          let uu____28748 =
            let uu____28755 = elim_delayed_subst_term tm  in
            (uu____28755, qi1)  in
          FStar_Syntax_Syntax.Tm_quoted uu____28748  in
        mk1 uu____28747
    | FStar_Syntax_Syntax.Tm_meta (t2,md) ->
        let uu____28766 =
          let uu____28767 =
            let uu____28774 = elim_delayed_subst_term t2  in
            let uu____28777 = elim_delayed_subst_meta md  in
            (uu____28774, uu____28777)  in
          FStar_Syntax_Syntax.Tm_meta uu____28767  in
        mk1 uu____28766

and (elim_delayed_subst_cflags :
  FStar_Syntax_Syntax.cflags Prims.list ->
    FStar_Syntax_Syntax.cflags Prims.list)
  =
  fun flags1  ->
    FStar_List.map
      (fun uu___255_28786  ->
         match uu___255_28786 with
         | FStar_Syntax_Syntax.DECREASES t ->
             let uu____28790 = elim_delayed_subst_term t  in
             FStar_Syntax_Syntax.DECREASES uu____28790
         | f -> f) flags1

and (elim_delayed_subst_comp :
  FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp) =
  fun c  ->
    let mk1 x =
      FStar_Syntax_Syntax.mk x FStar_Pervasives_Native.None
        c.FStar_Syntax_Syntax.pos
       in
    match c.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Total (t,uopt) ->
        let uu____28813 =
          let uu____28814 =
            let uu____28823 = elim_delayed_subst_term t  in
            (uu____28823, uopt)  in
          FStar_Syntax_Syntax.Total uu____28814  in
        mk1 uu____28813
    | FStar_Syntax_Syntax.GTotal (t,uopt) ->
        let uu____28840 =
          let uu____28841 =
            let uu____28850 = elim_delayed_subst_term t  in
            (uu____28850, uopt)  in
          FStar_Syntax_Syntax.GTotal uu____28841  in
        mk1 uu____28840
    | FStar_Syntax_Syntax.Comp ct ->
        let ct1 =
          let uu___374_28859 = ct  in
          let uu____28860 =
            elim_delayed_subst_term ct.FStar_Syntax_Syntax.result_typ  in
          let uu____28863 =
            elim_delayed_subst_args ct.FStar_Syntax_Syntax.effect_args  in
          let uu____28872 =
            elim_delayed_subst_cflags ct.FStar_Syntax_Syntax.flags  in
          {
            FStar_Syntax_Syntax.comp_univs =
              (uu___374_28859.FStar_Syntax_Syntax.comp_univs);
            FStar_Syntax_Syntax.effect_name =
              (uu___374_28859.FStar_Syntax_Syntax.effect_name);
            FStar_Syntax_Syntax.result_typ = uu____28860;
            FStar_Syntax_Syntax.effect_args = uu____28863;
            FStar_Syntax_Syntax.flags = uu____28872
          }  in
        mk1 (FStar_Syntax_Syntax.Comp ct1)

and (elim_delayed_subst_meta :
  FStar_Syntax_Syntax.metadata -> FStar_Syntax_Syntax.metadata) =
  fun uu___256_28875  ->
    match uu___256_28875 with
    | FStar_Syntax_Syntax.Meta_pattern args ->
        let uu____28887 = FStar_List.map elim_delayed_subst_args args  in
        FStar_Syntax_Syntax.Meta_pattern uu____28887
    | FStar_Syntax_Syntax.Meta_monadic (m,t) ->
        let uu____28920 =
          let uu____28927 = elim_delayed_subst_term t  in (m, uu____28927)
           in
        FStar_Syntax_Syntax.Meta_monadic uu____28920
    | FStar_Syntax_Syntax.Meta_monadic_lift (m1,m2,t) ->
        let uu____28939 =
          let uu____28948 = elim_delayed_subst_term t  in
          (m1, m2, uu____28948)  in
        FStar_Syntax_Syntax.Meta_monadic_lift uu____28939
    | m -> m

and (elim_delayed_subst_args :
  (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.aqual)
    FStar_Pervasives_Native.tuple2 Prims.list ->
    (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.aqual)
      FStar_Pervasives_Native.tuple2 Prims.list)
  =
  fun args  ->
    FStar_List.map
      (fun uu____28975  ->
         match uu____28975 with
         | (t,q) ->
             let uu____28986 = elim_delayed_subst_term t  in (uu____28986, q))
      args

and (elim_delayed_subst_binders :
  (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
    FStar_Pervasives_Native.tuple2 Prims.list ->
    (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
      FStar_Pervasives_Native.tuple2 Prims.list)
  =
  fun bs  ->
    FStar_List.map
      (fun uu____29006  ->
         match uu____29006 with
         | (x,q) ->
             let uu____29017 =
               let uu___375_29018 = x  in
               let uu____29019 =
                 elim_delayed_subst_term x.FStar_Syntax_Syntax.sort  in
               {
                 FStar_Syntax_Syntax.ppname =
                   (uu___375_29018.FStar_Syntax_Syntax.ppname);
                 FStar_Syntax_Syntax.index =
                   (uu___375_29018.FStar_Syntax_Syntax.index);
                 FStar_Syntax_Syntax.sort = uu____29019
               }  in
             (uu____29017, q)) bs

let (elim_uvars_aux_tc :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.univ_names ->
      FStar_Syntax_Syntax.binders ->
        (FStar_Syntax_Syntax.typ,FStar_Syntax_Syntax.comp) FStar_Util.either
          ->
          (FStar_Syntax_Syntax.univ_names,(FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
                                            FStar_Pervasives_Native.tuple2
                                            Prims.list,(FStar_Syntax_Syntax.term'
                                                          FStar_Syntax_Syntax.syntax,
                                                         FStar_Syntax_Syntax.comp'
                                                           FStar_Syntax_Syntax.syntax)
                                                         FStar_Util.either)
            FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun univ_names  ->
      fun binders  ->
        fun tc  ->
          let t =
            match (binders, tc) with
            | ([],FStar_Util.Inl t) -> t
            | ([],FStar_Util.Inr c) ->
                failwith "Impossible: empty bindes with a comp"
            | (uu____29111,FStar_Util.Inr c) ->
                FStar_Syntax_Syntax.mk
                  (FStar_Syntax_Syntax.Tm_arrow (binders, c))
                  FStar_Pervasives_Native.None c.FStar_Syntax_Syntax.pos
            | (uu____29137,FStar_Util.Inl t) ->
                let uu____29155 =
                  let uu____29162 =
                    let uu____29163 =
                      let uu____29176 = FStar_Syntax_Syntax.mk_Total t  in
                      (binders, uu____29176)  in
                    FStar_Syntax_Syntax.Tm_arrow uu____29163  in
                  FStar_Syntax_Syntax.mk uu____29162  in
                uu____29155 FStar_Pervasives_Native.None
                  t.FStar_Syntax_Syntax.pos
             in
          let uu____29190 = FStar_Syntax_Subst.open_univ_vars univ_names t
             in
          match uu____29190 with
          | (univ_names1,t1) ->
              let t2 = remove_uvar_solutions env t1  in
              let t3 = FStar_Syntax_Subst.close_univ_vars univ_names1 t2  in
              let t4 = elim_delayed_subst_term t3  in
              let uu____29220 =
                match binders with
                | [] -> ([], (FStar_Util.Inl t4))
                | uu____29283 ->
                    let uu____29284 =
                      let uu____29293 =
                        let uu____29294 = FStar_Syntax_Subst.compress t4  in
                        uu____29294.FStar_Syntax_Syntax.n  in
                      (uu____29293, tc)  in
                    (match uu____29284 with
                     | (FStar_Syntax_Syntax.Tm_arrow
                        (binders1,c),FStar_Util.Inr uu____29321) ->
                         (binders1, (FStar_Util.Inr c))
                     | (FStar_Syntax_Syntax.Tm_arrow
                        (binders1,c),FStar_Util.Inl uu____29362) ->
                         (binders1,
                           (FStar_Util.Inl (FStar_Syntax_Util.comp_result c)))
                     | (uu____29401,FStar_Util.Inl uu____29402) ->
                         ([], (FStar_Util.Inl t4))
                     | uu____29429 -> failwith "Impossible")
                 in
              (match uu____29220 with
               | (binders1,tc1) -> (univ_names1, binders1, tc1))
  
let (elim_uvars_aux_t :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.univ_names ->
      FStar_Syntax_Syntax.binders ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.univ_names,(FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
                                            FStar_Pervasives_Native.tuple2
                                            Prims.list,FStar_Syntax_Syntax.term'
                                                         FStar_Syntax_Syntax.syntax)
            FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun univ_names  ->
      fun binders  ->
        fun t  ->
          let uu____29554 =
            elim_uvars_aux_tc env univ_names binders (FStar_Util.Inl t)  in
          match uu____29554 with
          | (univ_names1,binders1,tc) ->
              let uu____29620 = FStar_Util.left tc  in
              (univ_names1, binders1, uu____29620)
  
let (elim_uvars_aux_c :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.univ_names ->
      FStar_Syntax_Syntax.binders ->
        FStar_Syntax_Syntax.comp ->
          (FStar_Syntax_Syntax.univ_names,(FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
                                            FStar_Pervasives_Native.tuple2
                                            Prims.list,FStar_Syntax_Syntax.comp'
                                                         FStar_Syntax_Syntax.syntax)
            FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun univ_names  ->
      fun binders  ->
        fun c  ->
          let uu____29669 =
            elim_uvars_aux_tc env univ_names binders (FStar_Util.Inr c)  in
          match uu____29669 with
          | (univ_names1,binders1,tc) ->
              let uu____29735 = FStar_Util.right tc  in
              (univ_names1, binders1, uu____29735)
  
let rec (elim_uvars :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.sigelt -> FStar_Syntax_Syntax.sigelt)
  =
  fun env  ->
    fun s  ->
      match s.FStar_Syntax_Syntax.sigel with
      | FStar_Syntax_Syntax.Sig_inductive_typ
          (lid,univ_names,binders,typ,lids,lids') ->
          let uu____29774 = elim_uvars_aux_t env univ_names binders typ  in
          (match uu____29774 with
           | (univ_names1,binders1,typ1) ->
               let uu___376_29808 = s  in
               {
                 FStar_Syntax_Syntax.sigel =
                   (FStar_Syntax_Syntax.Sig_inductive_typ
                      (lid, univ_names1, binders1, typ1, lids, lids'));
                 FStar_Syntax_Syntax.sigrng =
                   (uu___376_29808.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___376_29808.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___376_29808.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___376_29808.FStar_Syntax_Syntax.sigattrs)
               })
      | FStar_Syntax_Syntax.Sig_bundle (sigs,lids) ->
          let uu___377_29823 = s  in
          let uu____29824 =
            let uu____29825 =
              let uu____29834 = FStar_List.map (elim_uvars env) sigs  in
              (uu____29834, lids)  in
            FStar_Syntax_Syntax.Sig_bundle uu____29825  in
          {
            FStar_Syntax_Syntax.sigel = uu____29824;
            FStar_Syntax_Syntax.sigrng =
              (uu___377_29823.FStar_Syntax_Syntax.sigrng);
            FStar_Syntax_Syntax.sigquals =
              (uu___377_29823.FStar_Syntax_Syntax.sigquals);
            FStar_Syntax_Syntax.sigmeta =
              (uu___377_29823.FStar_Syntax_Syntax.sigmeta);
            FStar_Syntax_Syntax.sigattrs =
              (uu___377_29823.FStar_Syntax_Syntax.sigattrs)
          }
      | FStar_Syntax_Syntax.Sig_datacon (lid,univ_names,typ,lident,i,lids) ->
          let uu____29851 = elim_uvars_aux_t env univ_names [] typ  in
          (match uu____29851 with
           | (univ_names1,uu____29871,typ1) ->
               let uu___378_29889 = s  in
               {
                 FStar_Syntax_Syntax.sigel =
                   (FStar_Syntax_Syntax.Sig_datacon
                      (lid, univ_names1, typ1, lident, i, lids));
                 FStar_Syntax_Syntax.sigrng =
                   (uu___378_29889.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___378_29889.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___378_29889.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___378_29889.FStar_Syntax_Syntax.sigattrs)
               })
      | FStar_Syntax_Syntax.Sig_declare_typ (lid,univ_names,typ) ->
          let uu____29895 = elim_uvars_aux_t env univ_names [] typ  in
          (match uu____29895 with
           | (univ_names1,uu____29915,typ1) ->
               let uu___379_29933 = s  in
               {
                 FStar_Syntax_Syntax.sigel =
                   (FStar_Syntax_Syntax.Sig_declare_typ
                      (lid, univ_names1, typ1));
                 FStar_Syntax_Syntax.sigrng =
                   (uu___379_29933.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___379_29933.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___379_29933.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___379_29933.FStar_Syntax_Syntax.sigattrs)
               })
      | FStar_Syntax_Syntax.Sig_let ((b,lbs),lids) ->
          let lbs1 =
            FStar_All.pipe_right lbs
              (FStar_List.map
                 (fun lb  ->
                    let uu____29961 =
                      FStar_Syntax_Subst.univ_var_opening
                        lb.FStar_Syntax_Syntax.lbunivs
                       in
                    match uu____29961 with
                    | (opening,lbunivs) ->
                        let elim t =
                          let uu____29986 =
                            let uu____29987 =
                              let uu____29988 =
                                FStar_Syntax_Subst.subst opening t  in
                              remove_uvar_solutions env uu____29988  in
                            FStar_Syntax_Subst.close_univ_vars lbunivs
                              uu____29987
                             in
                          elim_delayed_subst_term uu____29986  in
                        let lbtyp = elim lb.FStar_Syntax_Syntax.lbtyp  in
                        let lbdef = elim lb.FStar_Syntax_Syntax.lbdef  in
                        let uu___380_29991 = lb  in
                        {
                          FStar_Syntax_Syntax.lbname =
                            (uu___380_29991.FStar_Syntax_Syntax.lbname);
                          FStar_Syntax_Syntax.lbunivs = lbunivs;
                          FStar_Syntax_Syntax.lbtyp = lbtyp;
                          FStar_Syntax_Syntax.lbeff =
                            (uu___380_29991.FStar_Syntax_Syntax.lbeff);
                          FStar_Syntax_Syntax.lbdef = lbdef;
                          FStar_Syntax_Syntax.lbattrs =
                            (uu___380_29991.FStar_Syntax_Syntax.lbattrs);
                          FStar_Syntax_Syntax.lbpos =
                            (uu___380_29991.FStar_Syntax_Syntax.lbpos)
                        }))
             in
          let uu___381_29992 = s  in
          {
            FStar_Syntax_Syntax.sigel =
              (FStar_Syntax_Syntax.Sig_let ((b, lbs1), lids));
            FStar_Syntax_Syntax.sigrng =
              (uu___381_29992.FStar_Syntax_Syntax.sigrng);
            FStar_Syntax_Syntax.sigquals =
              (uu___381_29992.FStar_Syntax_Syntax.sigquals);
            FStar_Syntax_Syntax.sigmeta =
              (uu___381_29992.FStar_Syntax_Syntax.sigmeta);
            FStar_Syntax_Syntax.sigattrs =
              (uu___381_29992.FStar_Syntax_Syntax.sigattrs)
          }
      | FStar_Syntax_Syntax.Sig_main t ->
          let uu___382_29998 = s  in
          let uu____29999 =
            let uu____30000 = remove_uvar_solutions env t  in
            FStar_Syntax_Syntax.Sig_main uu____30000  in
          {
            FStar_Syntax_Syntax.sigel = uu____29999;
            FStar_Syntax_Syntax.sigrng =
              (uu___382_29998.FStar_Syntax_Syntax.sigrng);
            FStar_Syntax_Syntax.sigquals =
              (uu___382_29998.FStar_Syntax_Syntax.sigquals);
            FStar_Syntax_Syntax.sigmeta =
              (uu___382_29998.FStar_Syntax_Syntax.sigmeta);
            FStar_Syntax_Syntax.sigattrs =
              (uu___382_29998.FStar_Syntax_Syntax.sigattrs)
          }
      | FStar_Syntax_Syntax.Sig_assume (l,us,t) ->
          let uu____30004 = elim_uvars_aux_t env us [] t  in
          (match uu____30004 with
           | (us1,uu____30024,t1) ->
               let uu___383_30042 = s  in
               {
                 FStar_Syntax_Syntax.sigel =
                   (FStar_Syntax_Syntax.Sig_assume (l, us1, t1));
                 FStar_Syntax_Syntax.sigrng =
                   (uu___383_30042.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___383_30042.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___383_30042.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___383_30042.FStar_Syntax_Syntax.sigattrs)
               })
      | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____30043 ->
          failwith "Impossible: should have been desugared already"
      | FStar_Syntax_Syntax.Sig_new_effect ed ->
          let uu____30045 =
            elim_uvars_aux_t env ed.FStar_Syntax_Syntax.univs
              ed.FStar_Syntax_Syntax.binders ed.FStar_Syntax_Syntax.signature
             in
          (match uu____30045 with
           | (univs1,binders,signature) ->
               let uu____30079 =
                 let uu____30084 = FStar_Syntax_Subst.univ_var_opening univs1
                    in
                 match uu____30084 with
                 | (univs_opening,univs2) ->
                     let uu____30107 =
                       FStar_Syntax_Subst.univ_var_closing univs2  in
                     (univs_opening, uu____30107)
                  in
               (match uu____30079 with
                | (univs_opening,univs_closing) ->
                    let uu____30110 =
                      let binders1 = FStar_Syntax_Subst.open_binders binders
                         in
                      let uu____30116 =
                        FStar_Syntax_Subst.opening_of_binders binders1  in
                      let uu____30117 =
                        FStar_Syntax_Subst.closing_of_binders binders1  in
                      (uu____30116, uu____30117)  in
                    (match uu____30110 with
                     | (b_opening,b_closing) ->
                         let n1 = FStar_List.length univs1  in
                         let n_binders = FStar_List.length binders  in
                         let elim_tscheme uu____30141 =
                           match uu____30141 with
                           | (us,t) ->
                               let n_us = FStar_List.length us  in
                               let uu____30159 =
                                 FStar_Syntax_Subst.open_univ_vars us t  in
                               (match uu____30159 with
                                | (us1,t1) ->
                                    let uu____30170 =
                                      let uu____30179 =
                                        FStar_All.pipe_right b_opening
                                          (FStar_Syntax_Subst.shift_subst
                                             n_us)
                                         in
                                      let uu____30190 =
                                        FStar_All.pipe_right b_closing
                                          (FStar_Syntax_Subst.shift_subst
                                             n_us)
                                         in
                                      (uu____30179, uu____30190)  in
                                    (match uu____30170 with
                                     | (b_opening1,b_closing1) ->
                                         let uu____30219 =
                                           let uu____30228 =
                                             FStar_All.pipe_right
                                               univs_opening
                                               (FStar_Syntax_Subst.shift_subst
                                                  n_us)
                                              in
                                           let uu____30239 =
                                             FStar_All.pipe_right
                                               univs_closing
                                               (FStar_Syntax_Subst.shift_subst
                                                  n_us)
                                              in
                                           (uu____30228, uu____30239)  in
                                         (match uu____30219 with
                                          | (univs_opening1,univs_closing1)
                                              ->
                                              let t2 =
                                                let uu____30269 =
                                                  FStar_Syntax_Subst.subst
                                                    b_opening1 t1
                                                   in
                                                FStar_Syntax_Subst.subst
                                                  univs_opening1 uu____30269
                                                 in
                                              let uu____30270 =
                                                elim_uvars_aux_t env [] [] t2
                                                 in
                                              (match uu____30270 with
                                               | (uu____30293,uu____30294,t3)
                                                   ->
                                                   let t4 =
                                                     let uu____30313 =
                                                       let uu____30314 =
                                                         FStar_Syntax_Subst.close_univ_vars
                                                           us1 t3
                                                          in
                                                       FStar_Syntax_Subst.subst
                                                         b_closing1
                                                         uu____30314
                                                        in
                                                     FStar_Syntax_Subst.subst
                                                       univs_closing1
                                                       uu____30313
                                                      in
                                                   (us1, t4)))))
                            in
                         let elim_term t =
                           let uu____30323 =
                             elim_uvars_aux_t env univs1 binders t  in
                           match uu____30323 with
                           | (uu____30340,uu____30341,t1) -> t1  in
                         let elim_action a =
                           let action_typ_templ =
                             let body =
                               FStar_Syntax_Syntax.mk
                                 (FStar_Syntax_Syntax.Tm_ascribed
                                    ((a.FStar_Syntax_Syntax.action_defn),
                                      ((FStar_Util.Inl
                                          (a.FStar_Syntax_Syntax.action_typ)),
                                        FStar_Pervasives_Native.None),
                                      FStar_Pervasives_Native.None))
                                 FStar_Pervasives_Native.None
                                 (a.FStar_Syntax_Syntax.action_defn).FStar_Syntax_Syntax.pos
                                in
                             match a.FStar_Syntax_Syntax.action_params with
                             | [] -> body
                             | uu____30411 ->
                                 FStar_Syntax_Syntax.mk
                                   (FStar_Syntax_Syntax.Tm_abs
                                      ((a.FStar_Syntax_Syntax.action_params),
                                        body, FStar_Pervasives_Native.None))
                                   FStar_Pervasives_Native.None
                                   (a.FStar_Syntax_Syntax.action_defn).FStar_Syntax_Syntax.pos
                              in
                           let destruct_action_body body =
                             let uu____30436 =
                               let uu____30437 =
                                 FStar_Syntax_Subst.compress body  in
                               uu____30437.FStar_Syntax_Syntax.n  in
                             match uu____30436 with
                             | FStar_Syntax_Syntax.Tm_ascribed
                                 (defn,(FStar_Util.Inl
                                        typ,FStar_Pervasives_Native.None ),FStar_Pervasives_Native.None
                                  )
                                 -> (defn, typ)
                             | uu____30496 -> failwith "Impossible"  in
                           let destruct_action_typ_templ t =
                             let uu____30527 =
                               let uu____30528 =
                                 FStar_Syntax_Subst.compress t  in
                               uu____30528.FStar_Syntax_Syntax.n  in
                             match uu____30527 with
                             | FStar_Syntax_Syntax.Tm_abs
                                 (pars,body,uu____30549) ->
                                 let uu____30570 = destruct_action_body body
                                    in
                                 (match uu____30570 with
                                  | (defn,typ) -> (pars, defn, typ))
                             | uu____30615 ->
                                 let uu____30616 = destruct_action_body t  in
                                 (match uu____30616 with
                                  | (defn,typ) -> ([], defn, typ))
                              in
                           let uu____30665 =
                             elim_tscheme
                               ((a.FStar_Syntax_Syntax.action_univs),
                                 action_typ_templ)
                              in
                           match uu____30665 with
                           | (action_univs,t) ->
                               let uu____30674 = destruct_action_typ_templ t
                                  in
                               (match uu____30674 with
                                | (action_params,action_defn,action_typ) ->
                                    let a' =
                                      let uu___384_30715 = a  in
                                      {
                                        FStar_Syntax_Syntax.action_name =
                                          (uu___384_30715.FStar_Syntax_Syntax.action_name);
                                        FStar_Syntax_Syntax.action_unqualified_name
                                          =
                                          (uu___384_30715.FStar_Syntax_Syntax.action_unqualified_name);
                                        FStar_Syntax_Syntax.action_univs =
                                          action_univs;
                                        FStar_Syntax_Syntax.action_params =
                                          action_params;
                                        FStar_Syntax_Syntax.action_defn =
                                          action_defn;
                                        FStar_Syntax_Syntax.action_typ =
                                          action_typ
                                      }  in
                                    a')
                            in
                         let ed1 =
                           let uu___385_30717 = ed  in
                           let uu____30718 =
                             elim_tscheme ed.FStar_Syntax_Syntax.ret_wp  in
                           let uu____30719 =
                             elim_tscheme ed.FStar_Syntax_Syntax.bind_wp  in
                           let uu____30720 =
                             elim_tscheme ed.FStar_Syntax_Syntax.if_then_else
                              in
                           let uu____30721 =
                             elim_tscheme ed.FStar_Syntax_Syntax.ite_wp  in
                           let uu____30722 =
                             elim_tscheme ed.FStar_Syntax_Syntax.stronger  in
                           let uu____30723 =
                             elim_tscheme ed.FStar_Syntax_Syntax.close_wp  in
                           let uu____30724 =
                             elim_tscheme ed.FStar_Syntax_Syntax.assert_p  in
                           let uu____30725 =
                             elim_tscheme ed.FStar_Syntax_Syntax.assume_p  in
                           let uu____30726 =
                             elim_tscheme ed.FStar_Syntax_Syntax.null_wp  in
                           let uu____30727 =
                             elim_tscheme ed.FStar_Syntax_Syntax.trivial  in
                           let uu____30728 =
                             elim_term ed.FStar_Syntax_Syntax.repr  in
                           let uu____30729 =
                             elim_tscheme ed.FStar_Syntax_Syntax.return_repr
                              in
                           let uu____30730 =
                             elim_tscheme ed.FStar_Syntax_Syntax.bind_repr
                              in
                           let uu____30731 =
                             FStar_List.map elim_action
                               ed.FStar_Syntax_Syntax.actions
                              in
                           {
                             FStar_Syntax_Syntax.cattributes =
                               (uu___385_30717.FStar_Syntax_Syntax.cattributes);
                             FStar_Syntax_Syntax.mname =
                               (uu___385_30717.FStar_Syntax_Syntax.mname);
                             FStar_Syntax_Syntax.univs = univs1;
                             FStar_Syntax_Syntax.binders = binders;
                             FStar_Syntax_Syntax.signature = signature;
                             FStar_Syntax_Syntax.ret_wp = uu____30718;
                             FStar_Syntax_Syntax.bind_wp = uu____30719;
                             FStar_Syntax_Syntax.if_then_else = uu____30720;
                             FStar_Syntax_Syntax.ite_wp = uu____30721;
                             FStar_Syntax_Syntax.stronger = uu____30722;
                             FStar_Syntax_Syntax.close_wp = uu____30723;
                             FStar_Syntax_Syntax.assert_p = uu____30724;
                             FStar_Syntax_Syntax.assume_p = uu____30725;
                             FStar_Syntax_Syntax.null_wp = uu____30726;
                             FStar_Syntax_Syntax.trivial = uu____30727;
                             FStar_Syntax_Syntax.repr = uu____30728;
                             FStar_Syntax_Syntax.return_repr = uu____30729;
                             FStar_Syntax_Syntax.bind_repr = uu____30730;
                             FStar_Syntax_Syntax.actions = uu____30731;
                             FStar_Syntax_Syntax.eff_attrs =
                               (uu___385_30717.FStar_Syntax_Syntax.eff_attrs)
                           }  in
                         let uu___386_30734 = s  in
                         {
                           FStar_Syntax_Syntax.sigel =
                             (FStar_Syntax_Syntax.Sig_new_effect ed1);
                           FStar_Syntax_Syntax.sigrng =
                             (uu___386_30734.FStar_Syntax_Syntax.sigrng);
                           FStar_Syntax_Syntax.sigquals =
                             (uu___386_30734.FStar_Syntax_Syntax.sigquals);
                           FStar_Syntax_Syntax.sigmeta =
                             (uu___386_30734.FStar_Syntax_Syntax.sigmeta);
                           FStar_Syntax_Syntax.sigattrs =
                             (uu___386_30734.FStar_Syntax_Syntax.sigattrs)
                         })))
      | FStar_Syntax_Syntax.Sig_sub_effect sub_eff ->
          let elim_tscheme_opt uu___257_30755 =
            match uu___257_30755 with
            | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
            | FStar_Pervasives_Native.Some (us,t) ->
                let uu____30786 = elim_uvars_aux_t env us [] t  in
                (match uu____30786 with
                 | (us1,uu____30814,t1) ->
                     FStar_Pervasives_Native.Some (us1, t1))
             in
          let sub_eff1 =
            let uu___387_30841 = sub_eff  in
            let uu____30842 =
              elim_tscheme_opt sub_eff.FStar_Syntax_Syntax.lift_wp  in
            let uu____30845 =
              elim_tscheme_opt sub_eff.FStar_Syntax_Syntax.lift  in
            {
              FStar_Syntax_Syntax.source =
                (uu___387_30841.FStar_Syntax_Syntax.source);
              FStar_Syntax_Syntax.target =
                (uu___387_30841.FStar_Syntax_Syntax.target);
              FStar_Syntax_Syntax.lift_wp = uu____30842;
              FStar_Syntax_Syntax.lift = uu____30845
            }  in
          let uu___388_30848 = s  in
          {
            FStar_Syntax_Syntax.sigel =
              (FStar_Syntax_Syntax.Sig_sub_effect sub_eff1);
            FStar_Syntax_Syntax.sigrng =
              (uu___388_30848.FStar_Syntax_Syntax.sigrng);
            FStar_Syntax_Syntax.sigquals =
              (uu___388_30848.FStar_Syntax_Syntax.sigquals);
            FStar_Syntax_Syntax.sigmeta =
              (uu___388_30848.FStar_Syntax_Syntax.sigmeta);
            FStar_Syntax_Syntax.sigattrs =
              (uu___388_30848.FStar_Syntax_Syntax.sigattrs)
          }
      | FStar_Syntax_Syntax.Sig_effect_abbrev
          (lid,univ_names,binders,comp,flags1) ->
          let uu____30858 = elim_uvars_aux_c env univ_names binders comp  in
          (match uu____30858 with
           | (univ_names1,binders1,comp1) ->
               let uu___389_30892 = s  in
               {
                 FStar_Syntax_Syntax.sigel =
                   (FStar_Syntax_Syntax.Sig_effect_abbrev
                      (lid, univ_names1, binders1, comp1, flags1));
                 FStar_Syntax_Syntax.sigrng =
                   (uu___389_30892.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___389_30892.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___389_30892.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___389_30892.FStar_Syntax_Syntax.sigattrs)
               })
      | FStar_Syntax_Syntax.Sig_pragma uu____30895 -> s
      | FStar_Syntax_Syntax.Sig_splice uu____30896 -> s
  
let (erase_universes :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t  -> normalize [EraseUniverses; AllowUnboundUniverses] env t
  