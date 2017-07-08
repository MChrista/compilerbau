{-# OPTIONS_GHC -w #-}
module ParseIntel  where

import Data.Int

import GenSym
import Frame -- Acc
import Intel
import TokenIntel hiding (Label, Temp, Reg)
import qualified TokenIntel as Tok
import LexIntel
import FrameIntel
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

data HappyAbsSyn 
	= HappyTerminal ((Token AlexPosn))
	| HappyErrorToken Int
	| HappyAbsSyn4 ([IntelFrame])
	| HappyAbsSyn5 ([Instr])
	| HappyAbsSyn6 (Instr)
	| HappyAbsSyn7 (Label)
	| HappyAbsSyn8 (DS)
	| HappyAbsSyn9 (D)
	| HappyAbsSyn10 (Cond)
	| HappyAbsSyn11 (Src)
	| HappyAbsSyn12 (Dest)
	| HappyAbsSyn13 (Reg)
	| HappyAbsSyn14 (EA)
	| HappyAbsSyn15 (Scale)
	| HappyAbsSyn16 (Int32)

{- to allow type-synonyms as our monads (likely
 - with explicitly-specified bind and return)
 - in Haskell98, it seems that with
 - /type M a = .../, then /(HappyReduction M)/
 - is not allowed.  But Happy is a
 - code-generator that can just substitute it.
type HappyReduction m = 
	   Int 
	-> ((Token AlexPosn))
	-> HappyState ((Token AlexPosn)) (HappyStk HappyAbsSyn -> [((Token AlexPosn))] -> m HappyAbsSyn)
	-> [HappyState ((Token AlexPosn)) (HappyStk HappyAbsSyn -> [((Token AlexPosn))] -> m HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [((Token AlexPosn))] -> m HappyAbsSyn
-}

action_0,
 action_1,
 action_2,
 action_3,
 action_4,
 action_5,
 action_6,
 action_7,
 action_8,
 action_9,
 action_10,
 action_11,
 action_12,
 action_13,
 action_14,
 action_15,
 action_16,
 action_17,
 action_18,
 action_19,
 action_20,
 action_21,
 action_22,
 action_23,
 action_24,
 action_25,
 action_26,
 action_27,
 action_28,
 action_29,
 action_30,
 action_31,
 action_32,
 action_33,
 action_34,
 action_35,
 action_36,
 action_37,
 action_38,
 action_39,
 action_40,
 action_41,
 action_42,
 action_43,
 action_44,
 action_45,
 action_46,
 action_47,
 action_48,
 action_49,
 action_50,
 action_51,
 action_52,
 action_53,
 action_54,
 action_55,
 action_56,
 action_57,
 action_58,
 action_59,
 action_60,
 action_61,
 action_62,
 action_63,
 action_64,
 action_65,
 action_66,
 action_67,
 action_68,
 action_69,
 action_70,
 action_71,
 action_72,
 action_73,
 action_74,
 action_75,
 action_76,
 action_77,
 action_78,
 action_79,
 action_80,
 action_81,
 action_82,
 action_83,
 action_84,
 action_85,
 action_86,
 action_87,
 action_88,
 action_89,
 action_90,
 action_91,
 action_92,
 action_93,
 action_94,
 action_95,
 action_96,
 action_97,
 action_98,
 action_99,
 action_100,
 action_101,
 action_102,
 action_103,
 action_104,
 action_105,
 action_106,
 action_107,
 action_108,
 action_109,
 action_110,
 action_111,
 action_112,
 action_113,
 action_114,
 action_115,
 action_116,
 action_117,
 action_118,
 action_119,
 action_120,
 action_121,
 action_122,
 action_123,
 action_124,
 action_125,
 action_126,
 action_127,
 action_128,
 action_129,
 action_130,
 action_131,
 action_132,
 action_133,
 action_134,
 action_135,
 action_136,
 action_137,
 action_138,
 action_139,
 action_140,
 action_141,
 action_142,
 action_143,
 action_144,
 action_145,
 action_146,
 action_147,
 action_148,
 action_149,
 action_150,
 action_151,
 action_152,
 action_153,
 action_154,
 action_155,
 action_156,
 action_157,
 action_158,
 action_159,
 action_160,
 action_161,
 action_162,
 action_163,
 action_164,
 action_165,
 action_166,
 action_167,
 action_168,
 action_169,
 action_170,
 action_171,
 action_172,
 action_173,
 action_174,
 action_175,
 action_176,
 action_177,
 action_178,
 action_179,
 action_180,
 action_181,
 action_182,
 action_183,
 action_184,
 action_185,
 action_186 :: () => Int -> ({-HappyReduction (HappyIdentity) = -}
	   Int 
	-> ((Token AlexPosn))
	-> HappyState ((Token AlexPosn)) (HappyStk HappyAbsSyn -> [((Token AlexPosn))] -> (HappyIdentity) HappyAbsSyn)
	-> [HappyState ((Token AlexPosn)) (HappyStk HappyAbsSyn -> [((Token AlexPosn))] -> (HappyIdentity) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [((Token AlexPosn))] -> (HappyIdentity) HappyAbsSyn)

happyReduce_1,
 happyReduce_2,
 happyReduce_3,
 happyReduce_4,
 happyReduce_5,
 happyReduce_6,
 happyReduce_7,
 happyReduce_8,
 happyReduce_9,
 happyReduce_10,
 happyReduce_11,
 happyReduce_12,
 happyReduce_13,
 happyReduce_14,
 happyReduce_15,
 happyReduce_16,
 happyReduce_17,
 happyReduce_18,
 happyReduce_19,
 happyReduce_20,
 happyReduce_21,
 happyReduce_22,
 happyReduce_23,
 happyReduce_24,
 happyReduce_25,
 happyReduce_26,
 happyReduce_27,
 happyReduce_28,
 happyReduce_29,
 happyReduce_30,
 happyReduce_31,
 happyReduce_32,
 happyReduce_33,
 happyReduce_34,
 happyReduce_35,
 happyReduce_36,
 happyReduce_37,
 happyReduce_38,
 happyReduce_39,
 happyReduce_40,
 happyReduce_41,
 happyReduce_42,
 happyReduce_43,
 happyReduce_44,
 happyReduce_45,
 happyReduce_46,
 happyReduce_47,
 happyReduce_48,
 happyReduce_49,
 happyReduce_50,
 happyReduce_51,
 happyReduce_52,
 happyReduce_53,
 happyReduce_54,
 happyReduce_55,
 happyReduce_56,
 happyReduce_57,
 happyReduce_58,
 happyReduce_59,
 happyReduce_60,
 happyReduce_61,
 happyReduce_62,
 happyReduce_63,
 happyReduce_64,
 happyReduce_65,
 happyReduce_66,
 happyReduce_67,
 happyReduce_68,
 happyReduce_69,
 happyReduce_70,
 happyReduce_71,
 happyReduce_72,
 happyReduce_73,
 happyReduce_74,
 happyReduce_75,
 happyReduce_76,
 happyReduce_77,
 happyReduce_78,
 happyReduce_79,
 happyReduce_80,
 happyReduce_81,
 happyReduce_82,
 happyReduce_83,
 happyReduce_84,
 happyReduce_85,
 happyReduce_86,
 happyReduce_87,
 happyReduce_88,
 happyReduce_89,
 happyReduce_90,
 happyReduce_91,
 happyReduce_92,
 happyReduce_93,
 happyReduce_94,
 happyReduce_95,
 happyReduce_96,
 happyReduce_97,
 happyReduce_98,
 happyReduce_99,
 happyReduce_100,
 happyReduce_101,
 happyReduce_102,
 happyReduce_103 :: () => ({-HappyReduction (HappyIdentity) = -}
	   Int 
	-> ((Token AlexPosn))
	-> HappyState ((Token AlexPosn)) (HappyStk HappyAbsSyn -> [((Token AlexPosn))] -> (HappyIdentity) HappyAbsSyn)
	-> [HappyState ((Token AlexPosn)) (HappyStk HappyAbsSyn -> [((Token AlexPosn))] -> (HappyIdentity) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [((Token AlexPosn))] -> (HappyIdentity) HappyAbsSyn)

action_0 (68) = happyShift action_4
action_0 (4) = happyGoto action_2
action_0 (7) = happyGoto action_3
action_0 _ = happyReduce_1

action_1 _ = happyFail

action_2 (69) = happyAccept
action_2 _ = happyFail

action_3 (30) = happyShift action_12
action_3 (31) = happyShift action_13
action_3 (32) = happyShift action_14
action_3 (33) = happyShift action_15
action_3 (34) = happyShift action_16
action_3 (35) = happyShift action_17
action_3 (36) = happyShift action_18
action_3 (37) = happyShift action_19
action_3 (38) = happyShift action_20
action_3 (39) = happyShift action_21
action_3 (40) = happyShift action_22
action_3 (41) = happyShift action_23
action_3 (42) = happyShift action_24
action_3 (43) = happyShift action_25
action_3 (44) = happyShift action_26
action_3 (45) = happyShift action_27
action_3 (46) = happyShift action_28
action_3 (47) = happyShift action_29
action_3 (48) = happyShift action_30
action_3 (49) = happyShift action_31
action_3 (50) = happyShift action_32
action_3 (51) = happyShift action_33
action_3 (52) = happyShift action_34
action_3 (53) = happyShift action_35
action_3 (54) = happyShift action_36
action_3 (55) = happyShift action_37
action_3 (56) = happyShift action_38
action_3 (57) = happyShift action_39
action_3 (58) = happyShift action_40
action_3 (60) = happyShift action_41
action_3 (61) = happyShift action_42
action_3 (62) = happyShift action_43
action_3 (68) = happyShift action_4
action_3 (5) = happyGoto action_6
action_3 (6) = happyGoto action_7
action_3 (7) = happyGoto action_8
action_3 (8) = happyGoto action_9
action_3 (9) = happyGoto action_10
action_3 (10) = happyGoto action_11
action_3 _ = happyReduce_4

action_4 (20) = happyShift action_5
action_4 _ = happyFail

action_5 _ = happyReduce_22

action_6 (59) = happyShift action_71
action_6 _ = happyReduce_2

action_7 (30) = happyShift action_12
action_7 (31) = happyShift action_13
action_7 (32) = happyShift action_14
action_7 (33) = happyShift action_15
action_7 (34) = happyShift action_16
action_7 (35) = happyShift action_17
action_7 (36) = happyShift action_18
action_7 (37) = happyShift action_19
action_7 (38) = happyShift action_20
action_7 (39) = happyShift action_21
action_7 (40) = happyShift action_22
action_7 (41) = happyShift action_23
action_7 (42) = happyShift action_24
action_7 (43) = happyShift action_25
action_7 (44) = happyShift action_26
action_7 (45) = happyShift action_27
action_7 (46) = happyShift action_28
action_7 (47) = happyShift action_29
action_7 (48) = happyShift action_30
action_7 (49) = happyShift action_31
action_7 (50) = happyShift action_32
action_7 (51) = happyShift action_33
action_7 (52) = happyShift action_34
action_7 (53) = happyShift action_35
action_7 (54) = happyShift action_36
action_7 (55) = happyShift action_37
action_7 (56) = happyShift action_38
action_7 (57) = happyShift action_39
action_7 (58) = happyShift action_40
action_7 (60) = happyShift action_41
action_7 (61) = happyShift action_42
action_7 (62) = happyShift action_43
action_7 (68) = happyShift action_4
action_7 (5) = happyGoto action_70
action_7 (6) = happyGoto action_7
action_7 (7) = happyGoto action_8
action_7 (8) = happyGoto action_9
action_7 (9) = happyGoto action_10
action_7 (10) = happyGoto action_11
action_7 _ = happyReduce_4

action_8 _ = happyReduce_6

action_9 (63) = happyShift action_54
action_9 (66) = happyShift action_55
action_9 (67) = happyShift action_56
action_9 (12) = happyGoto action_69
action_9 (13) = happyGoto action_53
action_9 _ = happyFail

action_10 (63) = happyShift action_54
action_10 (66) = happyShift action_55
action_10 (67) = happyShift action_56
action_10 (12) = happyGoto action_68
action_10 (13) = happyGoto action_53
action_10 _ = happyFail

action_11 (68) = happyShift action_67
action_11 _ = happyFail

action_12 _ = happyReduce_23

action_13 _ = happyReduce_24

action_14 _ = happyReduce_25

action_15 _ = happyReduce_26

action_16 _ = happyReduce_27

action_17 _ = happyReduce_28

action_18 _ = happyReduce_29

action_19 _ = happyReduce_30

action_20 _ = happyReduce_31

action_21 _ = happyReduce_32

action_22 _ = happyReduce_34

action_23 _ = happyReduce_35

action_24 _ = happyReduce_36

action_25 _ = happyReduce_37

action_26 _ = happyReduce_33

action_27 (23) = happyShift action_66
action_27 (25) = happyShift action_45
action_27 (26) = happyShift action_46
action_27 (27) = happyShift action_47
action_27 (28) = happyShift action_48
action_27 (29) = happyShift action_49
action_27 (63) = happyShift action_54
action_27 (65) = happyShift action_50
action_27 (66) = happyShift action_55
action_27 (67) = happyShift action_56
action_27 (11) = happyGoto action_62
action_27 (12) = happyGoto action_63
action_27 (13) = happyGoto action_53
action_27 (16) = happyGoto action_64
action_27 (17) = happyGoto action_65
action_27 _ = happyFail

action_28 (63) = happyShift action_54
action_28 (66) = happyShift action_55
action_28 (67) = happyShift action_56
action_28 (12) = happyGoto action_60
action_28 (13) = happyGoto action_61
action_28 _ = happyFail

action_29 (63) = happyShift action_54
action_29 (66) = happyShift action_55
action_29 (67) = happyShift action_56
action_29 (12) = happyGoto action_59
action_29 (13) = happyGoto action_53
action_29 _ = happyFail

action_30 (68) = happyShift action_58
action_30 _ = happyFail

action_31 (66) = happyShift action_55
action_31 (67) = happyShift action_56
action_31 (13) = happyGoto action_57
action_31 _ = happyFail

action_32 (63) = happyShift action_54
action_32 (66) = happyShift action_55
action_32 (67) = happyShift action_56
action_32 (12) = happyGoto action_52
action_32 (13) = happyGoto action_53
action_32 _ = happyFail

action_33 _ = happyReduce_19

action_34 _ = happyReduce_38

action_35 _ = happyReduce_39

action_36 _ = happyReduce_40

action_37 _ = happyReduce_41

action_38 _ = happyReduce_42

action_39 _ = happyReduce_43

action_40 (68) = happyShift action_51
action_40 _ = happyFail

action_41 (25) = happyShift action_45
action_41 (26) = happyShift action_46
action_41 (27) = happyShift action_47
action_41 (28) = happyShift action_48
action_41 (29) = happyShift action_49
action_41 (65) = happyShift action_50
action_41 (16) = happyGoto action_44
action_41 _ = happyFail

action_42 _ = happyReduce_20

action_43 _ = happyReduce_21

action_44 (21) = happyShift action_79
action_44 _ = happyFail

action_45 _ = happyReduce_96

action_46 _ = happyReduce_97

action_47 _ = happyReduce_98

action_48 _ = happyReduce_99

action_49 _ = happyReduce_100

action_50 _ = happyReduce_101

action_51 _ = happyReduce_17

action_52 (21) = happyShift action_78
action_52 _ = happyFail

action_53 _ = happyReduce_46

action_54 (64) = happyShift action_77
action_54 _ = happyFail

action_55 _ = happyReduce_49

action_56 _ = happyReduce_48

action_57 (21) = happyShift action_76
action_57 _ = happyFail

action_58 _ = happyReduce_15

action_59 _ = happyReduce_14

action_60 _ = happyReduce_13

action_61 (21) = happyShift action_75
action_61 _ = happyReduce_46

action_62 _ = happyReduce_11

action_63 _ = happyReduce_45

action_64 _ = happyReduce_102

action_65 _ = happyReduce_44

action_66 (25) = happyShift action_45
action_66 (26) = happyShift action_46
action_66 (27) = happyShift action_47
action_66 (28) = happyShift action_48
action_66 (29) = happyShift action_49
action_66 (65) = happyShift action_50
action_66 (16) = happyGoto action_74
action_66 _ = happyFail

action_67 _ = happyReduce_16

action_68 _ = happyReduce_8

action_69 (21) = happyShift action_73
action_69 _ = happyFail

action_70 _ = happyReduce_5

action_71 (68) = happyShift action_4
action_71 (4) = happyGoto action_72
action_71 (7) = happyGoto action_3
action_71 _ = happyReduce_1

action_72 _ = happyReduce_3

action_73 (23) = happyShift action_66
action_73 (25) = happyShift action_45
action_73 (26) = happyShift action_46
action_73 (27) = happyShift action_47
action_73 (28) = happyShift action_48
action_73 (29) = happyShift action_49
action_73 (63) = happyShift action_54
action_73 (65) = happyShift action_50
action_73 (66) = happyShift action_55
action_73 (67) = happyShift action_56
action_73 (11) = happyGoto action_85
action_73 (12) = happyGoto action_63
action_73 (13) = happyGoto action_53
action_73 (16) = happyGoto action_64
action_73 (17) = happyGoto action_65
action_73 _ = happyFail

action_74 _ = happyReduce_103

action_75 (23) = happyShift action_66
action_75 (25) = happyShift action_45
action_75 (26) = happyShift action_46
action_75 (27) = happyShift action_47
action_75 (28) = happyShift action_48
action_75 (29) = happyShift action_49
action_75 (63) = happyShift action_54
action_75 (65) = happyShift action_50
action_75 (66) = happyShift action_55
action_75 (67) = happyShift action_56
action_75 (11) = happyGoto action_84
action_75 (12) = happyGoto action_63
action_75 (13) = happyGoto action_53
action_75 (16) = happyGoto action_64
action_75 (17) = happyGoto action_65
action_75 _ = happyFail

action_76 (63) = happyShift action_83
action_76 _ = happyFail

action_77 (18) = happyShift action_82
action_77 _ = happyFail

action_78 (23) = happyShift action_66
action_78 (25) = happyShift action_45
action_78 (26) = happyShift action_46
action_78 (27) = happyShift action_47
action_78 (28) = happyShift action_48
action_78 (29) = happyShift action_49
action_78 (63) = happyShift action_54
action_78 (65) = happyShift action_50
action_78 (66) = happyShift action_55
action_78 (67) = happyShift action_56
action_78 (11) = happyGoto action_81
action_78 (12) = happyGoto action_63
action_78 (13) = happyGoto action_53
action_78 (16) = happyGoto action_64
action_78 (17) = happyGoto action_65
action_78 _ = happyFail

action_79 (25) = happyShift action_80
action_79 _ = happyFail

action_80 _ = happyReduce_18

action_81 _ = happyReduce_10

action_82 (23) = happyShift action_66
action_82 (25) = happyShift action_45
action_82 (26) = happyShift action_91
action_82 (27) = happyShift action_92
action_82 (28) = happyShift action_93
action_82 (29) = happyShift action_94
action_82 (65) = happyShift action_50
action_82 (66) = happyShift action_55
action_82 (67) = happyShift action_56
action_82 (13) = happyGoto action_87
action_82 (14) = happyGoto action_88
action_82 (15) = happyGoto action_89
action_82 (16) = happyGoto action_64
action_82 (17) = happyGoto action_90
action_82 _ = happyFail

action_83 (64) = happyShift action_86
action_83 _ = happyFail

action_84 _ = happyReduce_12

action_85 _ = happyReduce_7

action_86 (18) = happyShift action_101
action_86 _ = happyFail

action_87 (22) = happyShift action_98
action_87 (23) = happyShift action_99
action_87 (24) = happyShift action_100
action_87 _ = happyReduce_50

action_88 (19) = happyShift action_97
action_88 _ = happyFail

action_89 (24) = happyShift action_96
action_89 _ = happyFail

action_90 (22) = happyShift action_95
action_90 _ = happyFail

action_91 (24) = happyReduce_92
action_91 _ = happyReduce_97

action_92 (24) = happyReduce_93
action_92 _ = happyReduce_98

action_93 (24) = happyReduce_94
action_93 _ = happyReduce_99

action_94 (24) = happyReduce_95
action_94 _ = happyReduce_100

action_95 (26) = happyShift action_104
action_95 (27) = happyShift action_105
action_95 (28) = happyShift action_106
action_95 (29) = happyShift action_107
action_95 (66) = happyShift action_55
action_95 (67) = happyShift action_56
action_95 (13) = happyGoto action_113
action_95 (15) = happyGoto action_114
action_95 _ = happyFail

action_96 (66) = happyShift action_55
action_96 (67) = happyShift action_56
action_96 (13) = happyGoto action_112
action_96 _ = happyFail

action_97 _ = happyReduce_47

action_98 (23) = happyShift action_66
action_98 (25) = happyShift action_45
action_98 (26) = happyShift action_91
action_98 (27) = happyShift action_92
action_98 (28) = happyShift action_93
action_98 (29) = happyShift action_94
action_98 (65) = happyShift action_50
action_98 (66) = happyShift action_55
action_98 (67) = happyShift action_56
action_98 (13) = happyGoto action_109
action_98 (15) = happyGoto action_110
action_98 (16) = happyGoto action_64
action_98 (17) = happyGoto action_111
action_98 _ = happyFail

action_99 (23) = happyShift action_66
action_99 (25) = happyShift action_45
action_99 (26) = happyShift action_46
action_99 (27) = happyShift action_47
action_99 (28) = happyShift action_48
action_99 (29) = happyShift action_49
action_99 (65) = happyShift action_50
action_99 (16) = happyGoto action_64
action_99 (17) = happyGoto action_108
action_99 _ = happyFail

action_100 (26) = happyShift action_104
action_100 (27) = happyShift action_105
action_100 (28) = happyShift action_106
action_100 (29) = happyShift action_107
action_100 (15) = happyGoto action_103
action_100 _ = happyFail

action_101 (23) = happyShift action_66
action_101 (25) = happyShift action_45
action_101 (26) = happyShift action_91
action_101 (27) = happyShift action_92
action_101 (28) = happyShift action_93
action_101 (29) = happyShift action_94
action_101 (65) = happyShift action_50
action_101 (66) = happyShift action_55
action_101 (67) = happyShift action_56
action_101 (13) = happyGoto action_87
action_101 (14) = happyGoto action_102
action_101 (15) = happyGoto action_89
action_101 (16) = happyGoto action_64
action_101 (17) = happyGoto action_90
action_101 _ = happyFail

action_102 (19) = happyShift action_128
action_102 _ = happyFail

action_103 (22) = happyShift action_126
action_103 (23) = happyShift action_127
action_103 _ = happyReduce_57

action_104 _ = happyReduce_92

action_105 _ = happyReduce_93

action_106 _ = happyReduce_94

action_107 _ = happyReduce_95

action_108 (22) = happyShift action_125
action_108 _ = happyReduce_79

action_109 (22) = happyShift action_122
action_109 (23) = happyShift action_123
action_109 (24) = happyShift action_124
action_109 _ = happyReduce_52

action_110 (24) = happyShift action_121
action_110 _ = happyFail

action_111 (22) = happyShift action_120
action_111 _ = happyReduce_51

action_112 (22) = happyShift action_118
action_112 (23) = happyShift action_119
action_112 _ = happyReduce_58

action_113 (22) = happyShift action_116
action_113 (24) = happyShift action_117
action_113 _ = happyReduce_53

action_114 (24) = happyShift action_115
action_114 _ = happyFail

action_115 (66) = happyShift action_55
action_115 (67) = happyShift action_56
action_115 (13) = happyGoto action_146
action_115 _ = happyFail

action_116 (26) = happyShift action_104
action_116 (27) = happyShift action_105
action_116 (28) = happyShift action_106
action_116 (29) = happyShift action_107
action_116 (66) = happyShift action_55
action_116 (67) = happyShift action_56
action_116 (13) = happyGoto action_144
action_116 (15) = happyGoto action_145
action_116 _ = happyFail

action_117 (26) = happyShift action_104
action_117 (27) = happyShift action_105
action_117 (28) = happyShift action_106
action_117 (29) = happyShift action_107
action_117 (15) = happyGoto action_143
action_117 _ = happyFail

action_118 (23) = happyShift action_66
action_118 (25) = happyShift action_45
action_118 (26) = happyShift action_46
action_118 (27) = happyShift action_47
action_118 (28) = happyShift action_48
action_118 (29) = happyShift action_49
action_118 (65) = happyShift action_50
action_118 (66) = happyShift action_55
action_118 (67) = happyShift action_56
action_118 (13) = happyGoto action_141
action_118 (16) = happyGoto action_64
action_118 (17) = happyGoto action_142
action_118 _ = happyFail

action_119 (23) = happyShift action_66
action_119 (25) = happyShift action_45
action_119 (26) = happyShift action_46
action_119 (27) = happyShift action_47
action_119 (28) = happyShift action_48
action_119 (29) = happyShift action_49
action_119 (65) = happyShift action_50
action_119 (16) = happyGoto action_64
action_119 (17) = happyGoto action_140
action_119 _ = happyFail

action_120 (26) = happyShift action_104
action_120 (27) = happyShift action_105
action_120 (28) = happyShift action_106
action_120 (29) = happyShift action_107
action_120 (66) = happyShift action_55
action_120 (67) = happyShift action_56
action_120 (13) = happyGoto action_138
action_120 (15) = happyGoto action_139
action_120 _ = happyFail

action_121 (66) = happyShift action_55
action_121 (67) = happyShift action_56
action_121 (13) = happyGoto action_137
action_121 _ = happyFail

action_122 (23) = happyShift action_66
action_122 (25) = happyShift action_45
action_122 (26) = happyShift action_46
action_122 (27) = happyShift action_47
action_122 (28) = happyShift action_48
action_122 (29) = happyShift action_49
action_122 (65) = happyShift action_50
action_122 (16) = happyGoto action_64
action_122 (17) = happyGoto action_136
action_122 _ = happyFail

action_123 (23) = happyShift action_66
action_123 (25) = happyShift action_45
action_123 (26) = happyShift action_46
action_123 (27) = happyShift action_47
action_123 (28) = happyShift action_48
action_123 (29) = happyShift action_49
action_123 (65) = happyShift action_50
action_123 (16) = happyGoto action_64
action_123 (17) = happyGoto action_135
action_123 _ = happyFail

action_124 (26) = happyShift action_104
action_124 (27) = happyShift action_105
action_124 (28) = happyShift action_106
action_124 (29) = happyShift action_107
action_124 (15) = happyGoto action_134
action_124 _ = happyFail

action_125 (26) = happyShift action_104
action_125 (27) = happyShift action_105
action_125 (28) = happyShift action_106
action_125 (29) = happyShift action_107
action_125 (66) = happyShift action_55
action_125 (67) = happyShift action_56
action_125 (13) = happyGoto action_132
action_125 (15) = happyGoto action_133
action_125 _ = happyFail

action_126 (23) = happyShift action_66
action_126 (25) = happyShift action_45
action_126 (26) = happyShift action_46
action_126 (27) = happyShift action_47
action_126 (28) = happyShift action_48
action_126 (29) = happyShift action_49
action_126 (65) = happyShift action_50
action_126 (66) = happyShift action_55
action_126 (67) = happyShift action_56
action_126 (13) = happyGoto action_130
action_126 (16) = happyGoto action_64
action_126 (17) = happyGoto action_131
action_126 _ = happyFail

action_127 (23) = happyShift action_66
action_127 (25) = happyShift action_45
action_127 (26) = happyShift action_46
action_127 (27) = happyShift action_47
action_127 (28) = happyShift action_48
action_127 (29) = happyShift action_49
action_127 (65) = happyShift action_50
action_127 (16) = happyGoto action_64
action_127 (17) = happyGoto action_129
action_127 _ = happyFail

action_128 _ = happyReduce_9

action_129 (22) = happyShift action_166
action_129 _ = happyReduce_82

action_130 (22) = happyShift action_164
action_130 (23) = happyShift action_165
action_130 _ = happyReduce_61

action_131 (22) = happyShift action_163
action_131 _ = happyReduce_59

action_132 (24) = happyShift action_162
action_132 _ = happyReduce_81

action_133 (24) = happyShift action_161
action_133 _ = happyFail

action_134 (22) = happyShift action_159
action_134 (23) = happyShift action_160
action_134 _ = happyReduce_65

action_135 _ = happyReduce_80

action_136 _ = happyReduce_54

action_137 (22) = happyShift action_157
action_137 (23) = happyShift action_158
action_137 _ = happyReduce_66

action_138 (24) = happyShift action_156
action_138 _ = happyReduce_55

action_139 (24) = happyShift action_155
action_139 _ = happyFail

action_140 (22) = happyShift action_154
action_140 _ = happyReduce_83

action_141 (22) = happyShift action_152
action_141 (23) = happyShift action_153
action_141 _ = happyReduce_62

action_142 (22) = happyShift action_151
action_142 _ = happyReduce_60

action_143 (22) = happyShift action_150
action_143 _ = happyReduce_63

action_144 (24) = happyShift action_149
action_144 _ = happyReduce_56

action_145 (24) = happyShift action_148
action_145 _ = happyFail

action_146 (22) = happyShift action_147
action_146 _ = happyReduce_64

action_147 (66) = happyShift action_55
action_147 (67) = happyShift action_56
action_147 (13) = happyGoto action_186
action_147 _ = happyFail

action_148 (66) = happyShift action_55
action_148 (67) = happyShift action_56
action_148 (13) = happyGoto action_185
action_148 _ = happyFail

action_149 (26) = happyShift action_104
action_149 (27) = happyShift action_105
action_149 (28) = happyShift action_106
action_149 (29) = happyShift action_107
action_149 (15) = happyGoto action_184
action_149 _ = happyFail

action_150 (66) = happyShift action_55
action_150 (67) = happyShift action_56
action_150 (13) = happyGoto action_183
action_150 _ = happyFail

action_151 (66) = happyShift action_55
action_151 (67) = happyShift action_56
action_151 (13) = happyGoto action_182
action_151 _ = happyFail

action_152 (23) = happyShift action_66
action_152 (25) = happyShift action_45
action_152 (26) = happyShift action_46
action_152 (27) = happyShift action_47
action_152 (28) = happyShift action_48
action_152 (29) = happyShift action_49
action_152 (65) = happyShift action_50
action_152 (16) = happyGoto action_64
action_152 (17) = happyGoto action_181
action_152 _ = happyFail

action_153 (23) = happyShift action_66
action_153 (25) = happyShift action_45
action_153 (26) = happyShift action_46
action_153 (27) = happyShift action_47
action_153 (28) = happyShift action_48
action_153 (29) = happyShift action_49
action_153 (65) = happyShift action_50
action_153 (16) = happyGoto action_64
action_153 (17) = happyGoto action_180
action_153 _ = happyFail

action_154 (66) = happyShift action_55
action_154 (67) = happyShift action_56
action_154 (13) = happyGoto action_179
action_154 _ = happyFail

action_155 (66) = happyShift action_55
action_155 (67) = happyShift action_56
action_155 (13) = happyGoto action_178
action_155 _ = happyFail

action_156 (26) = happyShift action_104
action_156 (27) = happyShift action_105
action_156 (28) = happyShift action_106
action_156 (29) = happyShift action_107
action_156 (15) = happyGoto action_177
action_156 _ = happyFail

action_157 (23) = happyShift action_66
action_157 (25) = happyShift action_45
action_157 (26) = happyShift action_46
action_157 (27) = happyShift action_47
action_157 (28) = happyShift action_48
action_157 (29) = happyShift action_49
action_157 (65) = happyShift action_50
action_157 (16) = happyGoto action_64
action_157 (17) = happyGoto action_176
action_157 _ = happyFail

action_158 (23) = happyShift action_66
action_158 (25) = happyShift action_45
action_158 (26) = happyShift action_46
action_158 (27) = happyShift action_47
action_158 (28) = happyShift action_48
action_158 (29) = happyShift action_49
action_158 (65) = happyShift action_50
action_158 (16) = happyGoto action_64
action_158 (17) = happyGoto action_175
action_158 _ = happyFail

action_159 (23) = happyShift action_66
action_159 (25) = happyShift action_45
action_159 (26) = happyShift action_46
action_159 (27) = happyShift action_47
action_159 (28) = happyShift action_48
action_159 (29) = happyShift action_49
action_159 (65) = happyShift action_50
action_159 (16) = happyGoto action_64
action_159 (17) = happyGoto action_174
action_159 _ = happyFail

action_160 (23) = happyShift action_66
action_160 (25) = happyShift action_45
action_160 (26) = happyShift action_46
action_160 (27) = happyShift action_47
action_160 (28) = happyShift action_48
action_160 (29) = happyShift action_49
action_160 (65) = happyShift action_50
action_160 (16) = happyGoto action_64
action_160 (17) = happyGoto action_173
action_160 _ = happyFail

action_161 (66) = happyShift action_55
action_161 (67) = happyShift action_56
action_161 (13) = happyGoto action_172
action_161 _ = happyFail

action_162 (26) = happyShift action_104
action_162 (27) = happyShift action_105
action_162 (28) = happyShift action_106
action_162 (29) = happyShift action_107
action_162 (15) = happyGoto action_171
action_162 _ = happyFail

action_163 (66) = happyShift action_55
action_163 (67) = happyShift action_56
action_163 (13) = happyGoto action_170
action_163 _ = happyFail

action_164 (23) = happyShift action_66
action_164 (25) = happyShift action_45
action_164 (26) = happyShift action_46
action_164 (27) = happyShift action_47
action_164 (28) = happyShift action_48
action_164 (29) = happyShift action_49
action_164 (65) = happyShift action_50
action_164 (16) = happyGoto action_64
action_164 (17) = happyGoto action_169
action_164 _ = happyFail

action_165 (23) = happyShift action_66
action_165 (25) = happyShift action_45
action_165 (26) = happyShift action_46
action_165 (27) = happyShift action_47
action_165 (28) = happyShift action_48
action_165 (29) = happyShift action_49
action_165 (65) = happyShift action_50
action_165 (16) = happyGoto action_64
action_165 (17) = happyGoto action_168
action_165 _ = happyFail

action_166 (66) = happyShift action_55
action_166 (67) = happyShift action_56
action_166 (13) = happyGoto action_167
action_166 _ = happyFail

action_167 _ = happyReduce_84

action_168 _ = happyReduce_86

action_169 _ = happyReduce_69

action_170 _ = happyReduce_67

action_171 _ = happyReduce_90

action_172 _ = happyReduce_91

action_173 _ = happyReduce_88

action_174 _ = happyReduce_73

action_175 _ = happyReduce_89

action_176 _ = happyReduce_74

action_177 _ = happyReduce_75

action_178 _ = happyReduce_76

action_179 _ = happyReduce_85

action_180 _ = happyReduce_87

action_181 _ = happyReduce_70

action_182 _ = happyReduce_68

action_183 _ = happyReduce_71

action_184 _ = happyReduce_77

action_185 _ = happyReduce_78

action_186 _ = happyReduce_72

happyReduce_1 = happySpecReduce_0  4 happyReduction_1
happyReduction_1  =  HappyAbsSyn4
		 ([]
	)

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn4
		 ([Frame happy_var_1 (mkFrameData []) happy_var_2]
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 4 4 happyReduction_3
happyReduction_3 ((HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 ((Frame happy_var_1 (mkFrameData []) (happy_var_2 ++ [RET])) : happy_var_4
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_0  5 happyReduction_4
happyReduction_4  =  HappyAbsSyn5
		 ([ ]
	)

happyReduce_5 = happySpecReduce_2  5 happyReduction_5
happyReduction_5 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 : happy_var_2
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (LABEL happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happyReduce 4 6 happyReduction_7
happyReduction_7 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	(HappyAbsSyn8  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (DS happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_2  6 happyReduction_8
happyReduction_8 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 (D  happy_var_1 happy_var_2
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happyReduce 8 6 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (LEA happy_var_2 happy_var_7
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 4 6 happyReduction_10
happyReduction_10 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (CMP happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_2  6 happyReduction_11
happyReduction_11 (HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (PUSH happy_var_2
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 4 6 happyReduction_12
happyReduction_12 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (DS IMUL2 (Reg happy_var_2) happy_var_4
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_2  6 happyReduction_13
happyReduction_13 (HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (IMUL happy_var_2
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  6 happyReduction_14
happyReduction_14 (HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (IDIV happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  6 happyReduction_15
happyReduction_15 (HappyTerminal (Id happy_var_2 _))
	_
	 =  HappyAbsSyn6
		 (JMP  happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  6 happyReduction_16
happyReduction_16 (HappyTerminal (Id happy_var_2 _))
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn6
		 (J happy_var_1 happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  6 happyReduction_17
happyReduction_17 (HappyTerminal (Id happy_var_2 _))
	_
	 =  HappyAbsSyn6
		 (CALL happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happyReduce 4 6 happyReduction_18
happyReduction_18 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (ENTER happy_var_2
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_1  6 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn6
		 (CDQ
	)

happyReduce_20 = happySpecReduce_1  6 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn6
		 (LEAVE
	)

happyReduce_21 = happySpecReduce_1  6 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn6
		 (NOP
	)

happyReduce_22 = happySpecReduce_2  7 happyReduction_22
happyReduction_22 _
	(HappyTerminal (Id happy_var_1 _))
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  8 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn8
		 (MOV
	)

happyReduce_24 = happySpecReduce_1  8 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn8
		 (ADD
	)

happyReduce_25 = happySpecReduce_1  8 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn8
		 (SUB
	)

happyReduce_26 = happySpecReduce_1  8 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn8
		 (SHL
	)

happyReduce_27 = happySpecReduce_1  8 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn8
		 (SHR
	)

happyReduce_28 = happySpecReduce_1  8 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn8
		 (SAL
	)

happyReduce_29 = happySpecReduce_1  8 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn8
		 (SAR
	)

happyReduce_30 = happySpecReduce_1  8 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn8
		 (AND
	)

happyReduce_31 = happySpecReduce_1  8 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn8
		 (OR
	)

happyReduce_32 = happySpecReduce_1  8 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn8
		 (XOR
	)

happyReduce_33 = happySpecReduce_1  9 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn9
		 (POP
	)

happyReduce_34 = happySpecReduce_1  9 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn9
		 (NEG
	)

happyReduce_35 = happySpecReduce_1  9 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn9
		 (NOT
	)

happyReduce_36 = happySpecReduce_1  9 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn9
		 (INC
	)

happyReduce_37 = happySpecReduce_1  9 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn9
		 (DEC
	)

happyReduce_38 = happySpecReduce_1  10 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn10
		 (E
	)

happyReduce_39 = happySpecReduce_1  10 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn10
		 (NE
	)

happyReduce_40 = happySpecReduce_1  10 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn10
		 (L
	)

happyReduce_41 = happySpecReduce_1  10 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn10
		 (LE
	)

happyReduce_42 = happySpecReduce_1  10 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn10
		 (G
	)

happyReduce_43 = happySpecReduce_1  10 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn10
		 (GE
	)

happyReduce_44 = happySpecReduce_1  11 happyReduction_44
happyReduction_44 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn11
		 (Imm happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  11 happyReduction_45
happyReduction_45 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (Dest happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  12 happyReduction_46
happyReduction_46 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (Reg happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happyReduce 5 12 happyReduction_47
happyReduction_47 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (( \ (a,b,c,d) -> Mem a b c d) happy_var_4
	) `HappyStk` happyRest

happyReduce_48 = happySpecReduce_1  13 happyReduction_48
happyReduction_48 (HappyTerminal (Tok.Reg happy_var_1 _))
	 =  HappyAbsSyn13
		 (Fixed happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  13 happyReduction_49
happyReduction_49 (HappyTerminal (Tok.Temp happy_var_1 _))
	 =  HappyAbsSyn13
		 (Flex (Temp happy_var_1)
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_1  14 happyReduction_50
happyReduction_50 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn14
		 ((,,,) happy_var_1 Nothing Nothing 0
	)
happyReduction_50 _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  14 happyReduction_51
happyReduction_51 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn14
		 ((,,,) happy_var_1 Nothing Nothing happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  14 happyReduction_52
happyReduction_52 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn14
		 ((,,,) happy_var_1 Nothing (Just happy_var_3) 0
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  14 happyReduction_53
happyReduction_53 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn14
		 ((,,,) happy_var_3 Nothing Nothing happy_var_1
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happyReduce 5 14 happyReduction_54
happyReduction_54 ((HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_1 Nothing (Just happy_var_3) happy_var_5
	) `HappyStk` happyRest

happyReduce_55 = happyReduce 5 14 happyReduction_55
happyReduction_55 ((HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_1 Nothing (Just happy_var_5) happy_var_3
	) `HappyStk` happyRest

happyReduce_56 = happyReduce 5 14 happyReduction_56
happyReduction_56 ((HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_3 Nothing (Just happy_var_5) happy_var_1
	) `HappyStk` happyRest

happyReduce_57 = happySpecReduce_3  14 happyReduction_57
happyReduction_57 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn14
		 ((,,,) happy_var_1 (Just happy_var_3) Nothing 0
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  14 happyReduction_58
happyReduction_58 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 ((,,,) happy_var_3 (Just happy_var_1) Nothing 0
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happyReduce 5 14 happyReduction_59
happyReduction_59 ((HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_1 (Just happy_var_3) Nothing happy_var_5
	) `HappyStk` happyRest

happyReduce_60 = happyReduce 5 14 happyReduction_60
happyReduction_60 ((HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_3 (Just happy_var_1) Nothing happy_var_5
	) `HappyStk` happyRest

happyReduce_61 = happyReduce 5 14 happyReduction_61
happyReduction_61 ((HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_1 (Just happy_var_3) (Just happy_var_5) 0
	) `HappyStk` happyRest

happyReduce_62 = happyReduce 5 14 happyReduction_62
happyReduction_62 ((HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_3 (Just happy_var_1) (Just happy_var_5) 0
	) `HappyStk` happyRest

happyReduce_63 = happyReduce 5 14 happyReduction_63
happyReduction_63 ((HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_3 (Just happy_var_5) Nothing happy_var_1
	) `HappyStk` happyRest

happyReduce_64 = happyReduce 5 14 happyReduction_64
happyReduction_64 ((HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_5 (Just happy_var_3) Nothing happy_var_1
	) `HappyStk` happyRest

happyReduce_65 = happyReduce 5 14 happyReduction_65
happyReduction_65 ((HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_3 (Just happy_var_5) (Just happy_var_1) 0
	) `HappyStk` happyRest

happyReduce_66 = happyReduce 5 14 happyReduction_66
happyReduction_66 ((HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_5 (Just happy_var_3) (Just happy_var_1) 0
	) `HappyStk` happyRest

happyReduce_67 = happyReduce 7 14 happyReduction_67
happyReduction_67 ((HappyAbsSyn13  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_1 (Just happy_var_3) (Just happy_var_7) happy_var_5
	) `HappyStk` happyRest

happyReduce_68 = happyReduce 7 14 happyReduction_68
happyReduction_68 ((HappyAbsSyn13  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_3 (Just happy_var_1) (Just happy_var_7) happy_var_5
	) `HappyStk` happyRest

happyReduce_69 = happyReduce 7 14 happyReduction_69
happyReduction_69 ((HappyAbsSyn16  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_1 (Just happy_var_3) (Just happy_var_5) happy_var_7
	) `HappyStk` happyRest

happyReduce_70 = happyReduce 7 14 happyReduction_70
happyReduction_70 ((HappyAbsSyn16  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_3 (Just happy_var_1) (Just happy_var_5) happy_var_7
	) `HappyStk` happyRest

happyReduce_71 = happyReduce 7 14 happyReduction_71
happyReduction_71 ((HappyAbsSyn13  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_3 (Just happy_var_5) (Just happy_var_7) happy_var_1
	) `HappyStk` happyRest

happyReduce_72 = happyReduce 7 14 happyReduction_72
happyReduction_72 ((HappyAbsSyn13  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_5 (Just happy_var_3) (Just happy_var_7) happy_var_1
	) `HappyStk` happyRest

happyReduce_73 = happyReduce 7 14 happyReduction_73
happyReduction_73 ((HappyAbsSyn16  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_3 (Just happy_var_5) (Just happy_var_1) happy_var_7
	) `HappyStk` happyRest

happyReduce_74 = happyReduce 7 14 happyReduction_74
happyReduction_74 ((HappyAbsSyn16  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_5 (Just happy_var_3) (Just happy_var_1) happy_var_7
	) `HappyStk` happyRest

happyReduce_75 = happyReduce 7 14 happyReduction_75
happyReduction_75 ((HappyAbsSyn15  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_5 (Just happy_var_7) (Just happy_var_1) happy_var_3
	) `HappyStk` happyRest

happyReduce_76 = happyReduce 7 14 happyReduction_76
happyReduction_76 ((HappyAbsSyn13  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_7 (Just happy_var_5) (Just happy_var_1) happy_var_3
	) `HappyStk` happyRest

happyReduce_77 = happyReduce 7 14 happyReduction_77
happyReduction_77 ((HappyAbsSyn15  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_5 (Just happy_var_7) (Just happy_var_3) happy_var_1
	) `HappyStk` happyRest

happyReduce_78 = happyReduce 7 14 happyReduction_78
happyReduction_78 ((HappyAbsSyn13  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_7 (Just happy_var_5) (Just happy_var_3) happy_var_1
	) `HappyStk` happyRest

happyReduce_79 = happySpecReduce_3  14 happyReduction_79
happyReduction_79 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn14
		 ((,,,) happy_var_1 Nothing Nothing (- happy_var_3)
	)
happyReduction_79 _ _ _  = notHappyAtAll 

happyReduce_80 = happyReduce 5 14 happyReduction_80
happyReduction_80 ((HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_1 Nothing (Just happy_var_3) (- happy_var_5)
	) `HappyStk` happyRest

happyReduce_81 = happyReduce 5 14 happyReduction_81
happyReduction_81 ((HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_1 Nothing (Just happy_var_5) (- happy_var_3)
	) `HappyStk` happyRest

happyReduce_82 = happyReduce 5 14 happyReduction_82
happyReduction_82 ((HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_1 (Just happy_var_3) Nothing (- happy_var_5)
	) `HappyStk` happyRest

happyReduce_83 = happyReduce 5 14 happyReduction_83
happyReduction_83 ((HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_3 (Just happy_var_1) Nothing (- happy_var_5)
	) `HappyStk` happyRest

happyReduce_84 = happyReduce 7 14 happyReduction_84
happyReduction_84 ((HappyAbsSyn13  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_1 (Just happy_var_3) (Just happy_var_7) (- happy_var_5)
	) `HappyStk` happyRest

happyReduce_85 = happyReduce 7 14 happyReduction_85
happyReduction_85 ((HappyAbsSyn13  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_3 (Just happy_var_1) (Just happy_var_7) (- happy_var_5)
	) `HappyStk` happyRest

happyReduce_86 = happyReduce 7 14 happyReduction_86
happyReduction_86 ((HappyAbsSyn16  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_1 (Just happy_var_3) (Just happy_var_5) (- happy_var_7)
	) `HappyStk` happyRest

happyReduce_87 = happyReduce 7 14 happyReduction_87
happyReduction_87 ((HappyAbsSyn16  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_3 (Just happy_var_1) (Just happy_var_5) (- happy_var_7)
	) `HappyStk` happyRest

happyReduce_88 = happyReduce 7 14 happyReduction_88
happyReduction_88 ((HappyAbsSyn16  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_3 (Just happy_var_5) (Just happy_var_1) (- happy_var_7)
	) `HappyStk` happyRest

happyReduce_89 = happyReduce 7 14 happyReduction_89
happyReduction_89 ((HappyAbsSyn16  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_5 (Just happy_var_3) (Just happy_var_1) (- happy_var_7)
	) `HappyStk` happyRest

happyReduce_90 = happyReduce 7 14 happyReduction_90
happyReduction_90 ((HappyAbsSyn15  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_5 (Just happy_var_7) (Just happy_var_1) (- happy_var_3)
	) `HappyStk` happyRest

happyReduce_91 = happyReduce 7 14 happyReduction_91
happyReduction_91 ((HappyAbsSyn13  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((,,,) happy_var_7 (Just happy_var_5) (Just happy_var_1) (- happy_var_3)
	) `HappyStk` happyRest

happyReduce_92 = happySpecReduce_1  15 happyReduction_92
happyReduction_92 _
	 =  HappyAbsSyn15
		 (S1
	)

happyReduce_93 = happySpecReduce_1  15 happyReduction_93
happyReduction_93 _
	 =  HappyAbsSyn15
		 (S2
	)

happyReduce_94 = happySpecReduce_1  15 happyReduction_94
happyReduction_94 _
	 =  HappyAbsSyn15
		 (S4
	)

happyReduce_95 = happySpecReduce_1  15 happyReduction_95
happyReduction_95 _
	 =  HappyAbsSyn15
		 (S8
	)

happyReduce_96 = happySpecReduce_1  16 happyReduction_96
happyReduction_96 _
	 =  HappyAbsSyn16
		 (fromIntegral 0
	)

happyReduce_97 = happySpecReduce_1  16 happyReduction_97
happyReduction_97 _
	 =  HappyAbsSyn16
		 (fromIntegral 1
	)

happyReduce_98 = happySpecReduce_1  16 happyReduction_98
happyReduction_98 _
	 =  HappyAbsSyn16
		 (fromIntegral 2
	)

happyReduce_99 = happySpecReduce_1  16 happyReduction_99
happyReduction_99 _
	 =  HappyAbsSyn16
		 (fromIntegral 4
	)

happyReduce_100 = happySpecReduce_1  16 happyReduction_100
happyReduction_100 _
	 =  HappyAbsSyn16
		 (fromIntegral 8
	)

happyReduce_101 = happySpecReduce_1  16 happyReduction_101
happyReduction_101 (HappyTerminal (Nat happy_var_1 _))
	 =  HappyAbsSyn16
		 (fromIntegral happy_var_1
	)
happyReduction_101 _  = notHappyAtAll 

happyReduce_102 = happySpecReduce_1  17 happyReduction_102
happyReduction_102 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_102 _  = notHappyAtAll 

happyReduce_103 = happySpecReduce_2  17 happyReduction_103
happyReduction_103 (HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn16
		 ((- happy_var_2)
	)
happyReduction_103 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 69 69 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	LBrack _ -> cont 18;
	RBrack _ -> cont 19;
	Colon _ -> cont 20;
	Comma _ -> cont 21;
	Plus _ -> cont 22;
	Minus _ -> cont 23;
	Times _ -> cont 24;
	Nat 0 _ -> cont 25;
	Nat 1 _ -> cont 26;
	Nat 2 _ -> cont 27;
	Nat 4 _ -> cont 28;
	Nat 8 _ -> cont 29;
	Mov _ -> cont 30;
	Add _ -> cont 31;
	Sub _ -> cont 32;
	Shl _ -> cont 33;
	Shr _ -> cont 34;
	Sal _ -> cont 35;
	Sar _ -> cont 36;
	And _ -> cont 37;
	Or _ -> cont 38;
	Xor _ -> cont 39;
	Neg _ -> cont 40;
	Not _ -> cont 41;
	Inc _ -> cont 42;
	Dec _ -> cont 43;
	Pop _ -> cont 44;
	Push _ -> cont 45;
	Imul _ -> cont 46;
	Idiv _ -> cont 47;
	Jmp _ -> cont 48;
	Lea _ -> cont 49;
	Cmp _ -> cont 50;
	Cdq _ -> cont 51;
	Je _ -> cont 52;
	Jne _ -> cont 53;
	Jl _ -> cont 54;
	Jle _ -> cont 55;
	Jg _ -> cont 56;
	Jge _ -> cont 57;
	Call _ -> cont 58;
	Ret _ -> cont 59;
	Enter _ -> cont 60;
	Leave _ -> cont 61;
	Nop _ -> cont 62;
	Dword _ -> cont 63;
	Ptr _ -> cont 64;
	Nat happy_dollar_dollar _ -> cont 65;
	Tok.Temp happy_dollar_dollar _ -> cont 66;
	Tok.Reg happy_dollar_dollar _ -> cont 67;
	Id happy_dollar_dollar _ -> cont 68;
	_ -> happyError' (tk:tks)
	}

happyError_ 69 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = return
    (<*>) = ap
instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [((Token AlexPosn))] -> HappyIdentity a
happyError' = HappyIdentity . happyError

parse tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


happyError :: [Token AlexPosn] -> a
happyError tks = error ("Parse error at " ++ lcn ++ "\n")
        where
        lcn =   case tks of
                  [] -> "end of file"
                  (tk:_) -> "line " ++ show l ++ ", column " ++ show c ++ " (token " ++ filterPn (show tk) ++ ")"
                        where AlexPn _ l c = token_pos tk
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4










































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}

















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates/GenericTemplate.hs" #-}

{-# LINE 46 "templates/GenericTemplate.hs" #-}








{-# LINE 67 "templates/GenericTemplate.hs" #-}

{-# LINE 77 "templates/GenericTemplate.hs" #-}

{-# LINE 86 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 155 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 256 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 322 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
