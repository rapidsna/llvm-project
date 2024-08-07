; NOTE: Assertions have been autogenerated by utils/update_test_checks.py

; RUN: opt -passes=lower-matrix-intrinsics -matrix-default-layout=row-major -S < %s | FileCheck --check-prefix=RM %s



define <4 x i32> @multiply_2x2(<4 x i32> %a, <4 x i32> %b) {
; RM-LABEL: @multiply_2x2(
; RM-NEXT:  entry:
; RM-NEXT:    [[SPLIT:%.*]] = shufflevector <4 x i32> [[A:%.*]], <4 x i32> poison, <2 x i32> <i32 0, i32 1>
; RM-NEXT:    [[SPLIT1:%.*]] = shufflevector <4 x i32> [[A]], <4 x i32> poison, <2 x i32> <i32 2, i32 3>
; RM-NEXT:    [[SPLIT2:%.*]] = shufflevector <4 x i32> [[B:%.*]], <4 x i32> poison, <2 x i32> <i32 0, i32 1>
; RM-NEXT:    [[SPLIT3:%.*]] = shufflevector <4 x i32> [[B]], <4 x i32> poison, <2 x i32> <i32 2, i32 3>
; RM-NEXT:    [[BLOCK:%.*]] = shufflevector <2 x i32> [[SPLIT2]], <2 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP0:%.*]] = extractelement <2 x i32> [[SPLIT]], i64 0
; RM-NEXT:    [[SPLAT_SPLATINSERT:%.*]] = insertelement <1 x i32> poison, i32 [[TMP0]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP1:%.*]] = mul <1 x i32> [[SPLAT_SPLAT]], [[BLOCK]]
; RM-NEXT:    [[BLOCK4:%.*]] = shufflevector <2 x i32> [[SPLIT3]], <2 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP2:%.*]] = extractelement <2 x i32> [[SPLIT]], i64 1
; RM-NEXT:    [[SPLAT_SPLATINSERT5:%.*]] = insertelement <1 x i32> poison, i32 [[TMP2]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT6:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT5]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP3:%.*]] = mul <1 x i32> [[SPLAT_SPLAT6]], [[BLOCK4]]
; RM-NEXT:    [[TMP4:%.*]] = add <1 x i32> [[TMP1]], [[TMP3]]
; RM-NEXT:    [[TMP5:%.*]] = shufflevector <1 x i32> [[TMP4]], <1 x i32> poison, <2 x i32> <i32 0, i32 poison>
; RM-NEXT:    [[TMP6:%.*]] = shufflevector <2 x i32> poison, <2 x i32> [[TMP5]], <2 x i32> <i32 2, i32 1>
; RM-NEXT:    [[BLOCK7:%.*]] = shufflevector <2 x i32> [[SPLIT2]], <2 x i32> poison, <1 x i32> <i32 1>
; RM-NEXT:    [[TMP7:%.*]] = extractelement <2 x i32> [[SPLIT]], i64 0
; RM-NEXT:    [[SPLAT_SPLATINSERT8:%.*]] = insertelement <1 x i32> poison, i32 [[TMP7]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT9:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT8]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP8:%.*]] = mul <1 x i32> [[SPLAT_SPLAT9]], [[BLOCK7]]
; RM-NEXT:    [[BLOCK10:%.*]] = shufflevector <2 x i32> [[SPLIT3]], <2 x i32> poison, <1 x i32> <i32 1>
; RM-NEXT:    [[TMP9:%.*]] = extractelement <2 x i32> [[SPLIT]], i64 1
; RM-NEXT:    [[SPLAT_SPLATINSERT11:%.*]] = insertelement <1 x i32> poison, i32 [[TMP9]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT12:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT11]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP10:%.*]] = mul <1 x i32> [[SPLAT_SPLAT12]], [[BLOCK10]]
; RM-NEXT:    [[TMP11:%.*]] = add <1 x i32> [[TMP8]], [[TMP10]]
; RM-NEXT:    [[TMP12:%.*]] = shufflevector <1 x i32> [[TMP11]], <1 x i32> poison, <2 x i32> <i32 0, i32 poison>
; RM-NEXT:    [[TMP13:%.*]] = shufflevector <2 x i32> [[TMP6]], <2 x i32> [[TMP12]], <2 x i32> <i32 0, i32 2>
; RM-NEXT:    [[BLOCK13:%.*]] = shufflevector <2 x i32> [[SPLIT2]], <2 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP14:%.*]] = extractelement <2 x i32> [[SPLIT1]], i64 0
; RM-NEXT:    [[SPLAT_SPLATINSERT14:%.*]] = insertelement <1 x i32> poison, i32 [[TMP14]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT15:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT14]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP15:%.*]] = mul <1 x i32> [[SPLAT_SPLAT15]], [[BLOCK13]]
; RM-NEXT:    [[BLOCK16:%.*]] = shufflevector <2 x i32> [[SPLIT3]], <2 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP16:%.*]] = extractelement <2 x i32> [[SPLIT1]], i64 1
; RM-NEXT:    [[SPLAT_SPLATINSERT17:%.*]] = insertelement <1 x i32> poison, i32 [[TMP16]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT18:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT17]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP17:%.*]] = mul <1 x i32> [[SPLAT_SPLAT18]], [[BLOCK16]]
; RM-NEXT:    [[TMP18:%.*]] = add <1 x i32> [[TMP15]], [[TMP17]]
; RM-NEXT:    [[TMP19:%.*]] = shufflevector <1 x i32> [[TMP18]], <1 x i32> poison, <2 x i32> <i32 0, i32 poison>
; RM-NEXT:    [[TMP20:%.*]] = shufflevector <2 x i32> poison, <2 x i32> [[TMP19]], <2 x i32> <i32 2, i32 1>
; RM-NEXT:    [[BLOCK19:%.*]] = shufflevector <2 x i32> [[SPLIT2]], <2 x i32> poison, <1 x i32> <i32 1>
; RM-NEXT:    [[TMP21:%.*]] = extractelement <2 x i32> [[SPLIT1]], i64 0
; RM-NEXT:    [[SPLAT_SPLATINSERT20:%.*]] = insertelement <1 x i32> poison, i32 [[TMP21]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT21:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT20]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP22:%.*]] = mul <1 x i32> [[SPLAT_SPLAT21]], [[BLOCK19]]
; RM-NEXT:    [[BLOCK22:%.*]] = shufflevector <2 x i32> [[SPLIT3]], <2 x i32> poison, <1 x i32> <i32 1>
; RM-NEXT:    [[TMP23:%.*]] = extractelement <2 x i32> [[SPLIT1]], i64 1
; RM-NEXT:    [[SPLAT_SPLATINSERT23:%.*]] = insertelement <1 x i32> poison, i32 [[TMP23]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT24:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT23]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP24:%.*]] = mul <1 x i32> [[SPLAT_SPLAT24]], [[BLOCK22]]
; RM-NEXT:    [[TMP25:%.*]] = add <1 x i32> [[TMP22]], [[TMP24]]
; RM-NEXT:    [[TMP26:%.*]] = shufflevector <1 x i32> [[TMP25]], <1 x i32> poison, <2 x i32> <i32 0, i32 poison>
; RM-NEXT:    [[TMP27:%.*]] = shufflevector <2 x i32> [[TMP20]], <2 x i32> [[TMP26]], <2 x i32> <i32 0, i32 2>
; RM-NEXT:    [[TMP28:%.*]] = shufflevector <2 x i32> [[TMP13]], <2 x i32> [[TMP27]], <4 x i32> <i32 0, i32 1, i32 2, i32 3>
; RM-NEXT:    ret <4 x i32> [[TMP28]]
;
entry:
  %c = call <4 x i32> @llvm.matrix.multiply.v4i32.v4i32.v4i32(<4 x i32> %a, <4 x i32> %b, i32 2, i32 2, i32 2)
  ret <4 x i32> %c
}

declare <4 x i32> @llvm.matrix.multiply.v4i32.v4i32.v4i32(<4 x i32>, <4 x i32>, i32, i32, i32)

define <4 x i32> @multiply_1x2(<2 x i32> %a, <2 x i32> %b) {
; RM-LABEL: @multiply_1x2(
; RM-NEXT:  entry:
; RM-NEXT:    [[SPLIT:%.*]] = shufflevector <2 x i32> [[A:%.*]], <2 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[SPLIT1:%.*]] = shufflevector <2 x i32> [[A]], <2 x i32> poison, <1 x i32> <i32 1>
; RM-NEXT:    [[SPLIT2:%.*]] = shufflevector <2 x i32> [[B:%.*]], <2 x i32> poison, <2 x i32> <i32 0, i32 1>
; RM-NEXT:    [[BLOCK:%.*]] = shufflevector <2 x i32> [[SPLIT2]], <2 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP0:%.*]] = extractelement <1 x i32> [[SPLIT]], i64 0
; RM-NEXT:    [[SPLAT_SPLATINSERT:%.*]] = insertelement <1 x i32> poison, i32 [[TMP0]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP1:%.*]] = mul <1 x i32> [[SPLAT_SPLAT]], [[BLOCK]]
; RM-NEXT:    [[TMP2:%.*]] = shufflevector <1 x i32> [[TMP1]], <1 x i32> poison, <2 x i32> <i32 0, i32 poison>
; RM-NEXT:    [[TMP3:%.*]] = shufflevector <2 x i32> poison, <2 x i32> [[TMP2]], <2 x i32> <i32 2, i32 1>
; RM-NEXT:    [[BLOCK3:%.*]] = shufflevector <2 x i32> [[SPLIT2]], <2 x i32> poison, <1 x i32> <i32 1>
; RM-NEXT:    [[TMP4:%.*]] = extractelement <1 x i32> [[SPLIT]], i64 0
; RM-NEXT:    [[SPLAT_SPLATINSERT4:%.*]] = insertelement <1 x i32> poison, i32 [[TMP4]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT5:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT4]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP5:%.*]] = mul <1 x i32> [[SPLAT_SPLAT5]], [[BLOCK3]]
; RM-NEXT:    [[TMP6:%.*]] = shufflevector <1 x i32> [[TMP5]], <1 x i32> poison, <2 x i32> <i32 0, i32 poison>
; RM-NEXT:    [[TMP7:%.*]] = shufflevector <2 x i32> [[TMP3]], <2 x i32> [[TMP6]], <2 x i32> <i32 0, i32 2>
; RM-NEXT:    [[BLOCK6:%.*]] = shufflevector <2 x i32> [[SPLIT2]], <2 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP8:%.*]] = extractelement <1 x i32> [[SPLIT1]], i64 0
; RM-NEXT:    [[SPLAT_SPLATINSERT7:%.*]] = insertelement <1 x i32> poison, i32 [[TMP8]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT8:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT7]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP9:%.*]] = mul <1 x i32> [[SPLAT_SPLAT8]], [[BLOCK6]]
; RM-NEXT:    [[TMP10:%.*]] = shufflevector <1 x i32> [[TMP9]], <1 x i32> poison, <2 x i32> <i32 0, i32 poison>
; RM-NEXT:    [[TMP11:%.*]] = shufflevector <2 x i32> poison, <2 x i32> [[TMP10]], <2 x i32> <i32 2, i32 1>
; RM-NEXT:    [[BLOCK9:%.*]] = shufflevector <2 x i32> [[SPLIT2]], <2 x i32> poison, <1 x i32> <i32 1>
; RM-NEXT:    [[TMP12:%.*]] = extractelement <1 x i32> [[SPLIT1]], i64 0
; RM-NEXT:    [[SPLAT_SPLATINSERT10:%.*]] = insertelement <1 x i32> poison, i32 [[TMP12]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT11:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT10]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP13:%.*]] = mul <1 x i32> [[SPLAT_SPLAT11]], [[BLOCK9]]
; RM-NEXT:    [[TMP14:%.*]] = shufflevector <1 x i32> [[TMP13]], <1 x i32> poison, <2 x i32> <i32 0, i32 poison>
; RM-NEXT:    [[TMP15:%.*]] = shufflevector <2 x i32> [[TMP11]], <2 x i32> [[TMP14]], <2 x i32> <i32 0, i32 2>
; RM-NEXT:    [[TMP16:%.*]] = shufflevector <2 x i32> [[TMP7]], <2 x i32> [[TMP15]], <4 x i32> <i32 0, i32 1, i32 2, i32 3>
; RM-NEXT:    ret <4 x i32> [[TMP16]]
;
entry:
  %c = call <4 x i32> @llvm.matrix.multiply.v4i32.v2i32.v2i32(<2 x i32> %a, <2 x i32> %b, i32 2, i32 1, i32 2)
  ret <4 x i32> %c
}

declare <4 x i32> @llvm.matrix.multiply.v4i32.v2i32.v2i32(<2 x i32>, <2 x i32>, i32, i32, i32)

define <9 x i32> @multiply_2x3(<6 x i32> %a, <6 x i32> %b) {
; RM-LABEL: @multiply_2x3(
; RM-NEXT:  entry:
; RM-NEXT:    [[SPLIT:%.*]] = shufflevector <6 x i32> [[A:%.*]], <6 x i32> poison, <2 x i32> <i32 0, i32 1>
; RM-NEXT:    [[SPLIT1:%.*]] = shufflevector <6 x i32> [[A]], <6 x i32> poison, <2 x i32> <i32 2, i32 3>
; RM-NEXT:    [[SPLIT2:%.*]] = shufflevector <6 x i32> [[A]], <6 x i32> poison, <2 x i32> <i32 4, i32 5>
; RM-NEXT:    [[SPLIT3:%.*]] = shufflevector <6 x i32> [[B:%.*]], <6 x i32> poison, <3 x i32> <i32 0, i32 1, i32 2>
; RM-NEXT:    [[SPLIT4:%.*]] = shufflevector <6 x i32> [[B]], <6 x i32> poison, <3 x i32> <i32 3, i32 4, i32 5>
; RM-NEXT:    [[BLOCK:%.*]] = shufflevector <3 x i32> [[SPLIT3]], <3 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP0:%.*]] = extractelement <2 x i32> [[SPLIT]], i64 0
; RM-NEXT:    [[SPLAT_SPLATINSERT:%.*]] = insertelement <1 x i32> poison, i32 [[TMP0]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP1:%.*]] = mul <1 x i32> [[SPLAT_SPLAT]], [[BLOCK]]
; RM-NEXT:    [[BLOCK5:%.*]] = shufflevector <3 x i32> [[SPLIT4]], <3 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP2:%.*]] = extractelement <2 x i32> [[SPLIT]], i64 1
; RM-NEXT:    [[SPLAT_SPLATINSERT6:%.*]] = insertelement <1 x i32> poison, i32 [[TMP2]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT7:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT6]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP3:%.*]] = mul <1 x i32> [[SPLAT_SPLAT7]], [[BLOCK5]]
; RM-NEXT:    [[TMP4:%.*]] = add <1 x i32> [[TMP1]], [[TMP3]]
; RM-NEXT:    [[TMP5:%.*]] = shufflevector <1 x i32> [[TMP4]], <1 x i32> poison, <3 x i32> <i32 0, i32 poison, i32 poison>
; RM-NEXT:    [[TMP6:%.*]] = shufflevector <3 x i32> poison, <3 x i32> [[TMP5]], <3 x i32> <i32 3, i32 1, i32 2>
; RM-NEXT:    [[BLOCK8:%.*]] = shufflevector <3 x i32> [[SPLIT3]], <3 x i32> poison, <1 x i32> <i32 1>
; RM-NEXT:    [[TMP7:%.*]] = extractelement <2 x i32> [[SPLIT]], i64 0
; RM-NEXT:    [[SPLAT_SPLATINSERT9:%.*]] = insertelement <1 x i32> poison, i32 [[TMP7]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT10:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT9]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP8:%.*]] = mul <1 x i32> [[SPLAT_SPLAT10]], [[BLOCK8]]
; RM-NEXT:    [[BLOCK11:%.*]] = shufflevector <3 x i32> [[SPLIT4]], <3 x i32> poison, <1 x i32> <i32 1>
; RM-NEXT:    [[TMP9:%.*]] = extractelement <2 x i32> [[SPLIT]], i64 1
; RM-NEXT:    [[SPLAT_SPLATINSERT12:%.*]] = insertelement <1 x i32> poison, i32 [[TMP9]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT13:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT12]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP10:%.*]] = mul <1 x i32> [[SPLAT_SPLAT13]], [[BLOCK11]]
; RM-NEXT:    [[TMP11:%.*]] = add <1 x i32> [[TMP8]], [[TMP10]]
; RM-NEXT:    [[TMP12:%.*]] = shufflevector <1 x i32> [[TMP11]], <1 x i32> poison, <3 x i32> <i32 0, i32 poison, i32 poison>
; RM-NEXT:    [[TMP13:%.*]] = shufflevector <3 x i32> [[TMP6]], <3 x i32> [[TMP12]], <3 x i32> <i32 0, i32 3, i32 2>
; RM-NEXT:    [[BLOCK14:%.*]] = shufflevector <3 x i32> [[SPLIT3]], <3 x i32> poison, <1 x i32> <i32 2>
; RM-NEXT:    [[TMP14:%.*]] = extractelement <2 x i32> [[SPLIT]], i64 0
; RM-NEXT:    [[SPLAT_SPLATINSERT15:%.*]] = insertelement <1 x i32> poison, i32 [[TMP14]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT16:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT15]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP15:%.*]] = mul <1 x i32> [[SPLAT_SPLAT16]], [[BLOCK14]]
; RM-NEXT:    [[BLOCK17:%.*]] = shufflevector <3 x i32> [[SPLIT4]], <3 x i32> poison, <1 x i32> <i32 2>
; RM-NEXT:    [[TMP16:%.*]] = extractelement <2 x i32> [[SPLIT]], i64 1
; RM-NEXT:    [[SPLAT_SPLATINSERT18:%.*]] = insertelement <1 x i32> poison, i32 [[TMP16]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT19:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT18]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP17:%.*]] = mul <1 x i32> [[SPLAT_SPLAT19]], [[BLOCK17]]
; RM-NEXT:    [[TMP18:%.*]] = add <1 x i32> [[TMP15]], [[TMP17]]
; RM-NEXT:    [[TMP19:%.*]] = shufflevector <1 x i32> [[TMP18]], <1 x i32> poison, <3 x i32> <i32 0, i32 poison, i32 poison>
; RM-NEXT:    [[TMP20:%.*]] = shufflevector <3 x i32> [[TMP13]], <3 x i32> [[TMP19]], <3 x i32> <i32 0, i32 1, i32 3>
; RM-NEXT:    [[BLOCK20:%.*]] = shufflevector <3 x i32> [[SPLIT3]], <3 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP21:%.*]] = extractelement <2 x i32> [[SPLIT1]], i64 0
; RM-NEXT:    [[SPLAT_SPLATINSERT21:%.*]] = insertelement <1 x i32> poison, i32 [[TMP21]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT22:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT21]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP22:%.*]] = mul <1 x i32> [[SPLAT_SPLAT22]], [[BLOCK20]]
; RM-NEXT:    [[BLOCK23:%.*]] = shufflevector <3 x i32> [[SPLIT4]], <3 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP23:%.*]] = extractelement <2 x i32> [[SPLIT1]], i64 1
; RM-NEXT:    [[SPLAT_SPLATINSERT24:%.*]] = insertelement <1 x i32> poison, i32 [[TMP23]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT25:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT24]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP24:%.*]] = mul <1 x i32> [[SPLAT_SPLAT25]], [[BLOCK23]]
; RM-NEXT:    [[TMP25:%.*]] = add <1 x i32> [[TMP22]], [[TMP24]]
; RM-NEXT:    [[TMP26:%.*]] = shufflevector <1 x i32> [[TMP25]], <1 x i32> poison, <3 x i32> <i32 0, i32 poison, i32 poison>
; RM-NEXT:    [[TMP27:%.*]] = shufflevector <3 x i32> poison, <3 x i32> [[TMP26]], <3 x i32> <i32 3, i32 1, i32 2>
; RM-NEXT:    [[BLOCK26:%.*]] = shufflevector <3 x i32> [[SPLIT3]], <3 x i32> poison, <1 x i32> <i32 1>
; RM-NEXT:    [[TMP28:%.*]] = extractelement <2 x i32> [[SPLIT1]], i64 0
; RM-NEXT:    [[SPLAT_SPLATINSERT27:%.*]] = insertelement <1 x i32> poison, i32 [[TMP28]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT28:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT27]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP29:%.*]] = mul <1 x i32> [[SPLAT_SPLAT28]], [[BLOCK26]]
; RM-NEXT:    [[BLOCK29:%.*]] = shufflevector <3 x i32> [[SPLIT4]], <3 x i32> poison, <1 x i32> <i32 1>
; RM-NEXT:    [[TMP30:%.*]] = extractelement <2 x i32> [[SPLIT1]], i64 1
; RM-NEXT:    [[SPLAT_SPLATINSERT30:%.*]] = insertelement <1 x i32> poison, i32 [[TMP30]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT31:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT30]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP31:%.*]] = mul <1 x i32> [[SPLAT_SPLAT31]], [[BLOCK29]]
; RM-NEXT:    [[TMP32:%.*]] = add <1 x i32> [[TMP29]], [[TMP31]]
; RM-NEXT:    [[TMP33:%.*]] = shufflevector <1 x i32> [[TMP32]], <1 x i32> poison, <3 x i32> <i32 0, i32 poison, i32 poison>
; RM-NEXT:    [[TMP34:%.*]] = shufflevector <3 x i32> [[TMP27]], <3 x i32> [[TMP33]], <3 x i32> <i32 0, i32 3, i32 2>
; RM-NEXT:    [[BLOCK32:%.*]] = shufflevector <3 x i32> [[SPLIT3]], <3 x i32> poison, <1 x i32> <i32 2>
; RM-NEXT:    [[TMP35:%.*]] = extractelement <2 x i32> [[SPLIT1]], i64 0
; RM-NEXT:    [[SPLAT_SPLATINSERT33:%.*]] = insertelement <1 x i32> poison, i32 [[TMP35]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT34:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT33]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP36:%.*]] = mul <1 x i32> [[SPLAT_SPLAT34]], [[BLOCK32]]
; RM-NEXT:    [[BLOCK35:%.*]] = shufflevector <3 x i32> [[SPLIT4]], <3 x i32> poison, <1 x i32> <i32 2>
; RM-NEXT:    [[TMP37:%.*]] = extractelement <2 x i32> [[SPLIT1]], i64 1
; RM-NEXT:    [[SPLAT_SPLATINSERT36:%.*]] = insertelement <1 x i32> poison, i32 [[TMP37]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT37:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT36]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP38:%.*]] = mul <1 x i32> [[SPLAT_SPLAT37]], [[BLOCK35]]
; RM-NEXT:    [[TMP39:%.*]] = add <1 x i32> [[TMP36]], [[TMP38]]
; RM-NEXT:    [[TMP40:%.*]] = shufflevector <1 x i32> [[TMP39]], <1 x i32> poison, <3 x i32> <i32 0, i32 poison, i32 poison>
; RM-NEXT:    [[TMP41:%.*]] = shufflevector <3 x i32> [[TMP34]], <3 x i32> [[TMP40]], <3 x i32> <i32 0, i32 1, i32 3>
; RM-NEXT:    [[BLOCK38:%.*]] = shufflevector <3 x i32> [[SPLIT3]], <3 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP42:%.*]] = extractelement <2 x i32> [[SPLIT2]], i64 0
; RM-NEXT:    [[SPLAT_SPLATINSERT39:%.*]] = insertelement <1 x i32> poison, i32 [[TMP42]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT40:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT39]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP43:%.*]] = mul <1 x i32> [[SPLAT_SPLAT40]], [[BLOCK38]]
; RM-NEXT:    [[BLOCK41:%.*]] = shufflevector <3 x i32> [[SPLIT4]], <3 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP44:%.*]] = extractelement <2 x i32> [[SPLIT2]], i64 1
; RM-NEXT:    [[SPLAT_SPLATINSERT42:%.*]] = insertelement <1 x i32> poison, i32 [[TMP44]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT43:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT42]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP45:%.*]] = mul <1 x i32> [[SPLAT_SPLAT43]], [[BLOCK41]]
; RM-NEXT:    [[TMP46:%.*]] = add <1 x i32> [[TMP43]], [[TMP45]]
; RM-NEXT:    [[TMP47:%.*]] = shufflevector <1 x i32> [[TMP46]], <1 x i32> poison, <3 x i32> <i32 0, i32 poison, i32 poison>
; RM-NEXT:    [[TMP48:%.*]] = shufflevector <3 x i32> poison, <3 x i32> [[TMP47]], <3 x i32> <i32 3, i32 1, i32 2>
; RM-NEXT:    [[BLOCK44:%.*]] = shufflevector <3 x i32> [[SPLIT3]], <3 x i32> poison, <1 x i32> <i32 1>
; RM-NEXT:    [[TMP49:%.*]] = extractelement <2 x i32> [[SPLIT2]], i64 0
; RM-NEXT:    [[SPLAT_SPLATINSERT45:%.*]] = insertelement <1 x i32> poison, i32 [[TMP49]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT46:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT45]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP50:%.*]] = mul <1 x i32> [[SPLAT_SPLAT46]], [[BLOCK44]]
; RM-NEXT:    [[BLOCK47:%.*]] = shufflevector <3 x i32> [[SPLIT4]], <3 x i32> poison, <1 x i32> <i32 1>
; RM-NEXT:    [[TMP51:%.*]] = extractelement <2 x i32> [[SPLIT2]], i64 1
; RM-NEXT:    [[SPLAT_SPLATINSERT48:%.*]] = insertelement <1 x i32> poison, i32 [[TMP51]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT49:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT48]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP52:%.*]] = mul <1 x i32> [[SPLAT_SPLAT49]], [[BLOCK47]]
; RM-NEXT:    [[TMP53:%.*]] = add <1 x i32> [[TMP50]], [[TMP52]]
; RM-NEXT:    [[TMP54:%.*]] = shufflevector <1 x i32> [[TMP53]], <1 x i32> poison, <3 x i32> <i32 0, i32 poison, i32 poison>
; RM-NEXT:    [[TMP55:%.*]] = shufflevector <3 x i32> [[TMP48]], <3 x i32> [[TMP54]], <3 x i32> <i32 0, i32 3, i32 2>
; RM-NEXT:    [[BLOCK50:%.*]] = shufflevector <3 x i32> [[SPLIT3]], <3 x i32> poison, <1 x i32> <i32 2>
; RM-NEXT:    [[TMP56:%.*]] = extractelement <2 x i32> [[SPLIT2]], i64 0
; RM-NEXT:    [[SPLAT_SPLATINSERT51:%.*]] = insertelement <1 x i32> poison, i32 [[TMP56]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT52:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT51]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP57:%.*]] = mul <1 x i32> [[SPLAT_SPLAT52]], [[BLOCK50]]
; RM-NEXT:    [[BLOCK53:%.*]] = shufflevector <3 x i32> [[SPLIT4]], <3 x i32> poison, <1 x i32> <i32 2>
; RM-NEXT:    [[TMP58:%.*]] = extractelement <2 x i32> [[SPLIT2]], i64 1
; RM-NEXT:    [[SPLAT_SPLATINSERT54:%.*]] = insertelement <1 x i32> poison, i32 [[TMP58]], i64 0
; RM-NEXT:    [[SPLAT_SPLAT55:%.*]] = shufflevector <1 x i32> [[SPLAT_SPLATINSERT54]], <1 x i32> poison, <1 x i32> zeroinitializer
; RM-NEXT:    [[TMP59:%.*]] = mul <1 x i32> [[SPLAT_SPLAT55]], [[BLOCK53]]
; RM-NEXT:    [[TMP60:%.*]] = add <1 x i32> [[TMP57]], [[TMP59]]
; RM-NEXT:    [[TMP61:%.*]] = shufflevector <1 x i32> [[TMP60]], <1 x i32> poison, <3 x i32> <i32 0, i32 poison, i32 poison>
; RM-NEXT:    [[TMP62:%.*]] = shufflevector <3 x i32> [[TMP55]], <3 x i32> [[TMP61]], <3 x i32> <i32 0, i32 1, i32 3>
; RM-NEXT:    [[TMP63:%.*]] = shufflevector <3 x i32> [[TMP20]], <3 x i32> [[TMP41]], <6 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5>
; RM-NEXT:    [[TMP64:%.*]] = shufflevector <3 x i32> [[TMP62]], <3 x i32> poison, <6 x i32> <i32 0, i32 1, i32 2, i32 poison, i32 poison, i32 poison>
; RM-NEXT:    [[TMP65:%.*]] = shufflevector <6 x i32> [[TMP63]], <6 x i32> [[TMP64]], <9 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8>
; RM-NEXT:    ret <9 x i32> [[TMP65]]
;
entry:
  %c = call <9 x i32> @llvm.matrix.multiply.v9i32.v6i32.v6i32(<6 x i32> %a, <6 x i32> %b, i32 3, i32 2, i32 3)
  ret <9 x i32> %c
}

declare <9 x i32> @llvm.matrix.multiply.v9i32.v6i32.v6i32(<6 x i32>, <6 x i32>, i32, i32, i32)
