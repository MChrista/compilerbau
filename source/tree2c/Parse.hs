{-# OPTIONS_GHC -w #-}
module Parse  where

import Data.Int
import Lex
import qualified Tokens
import Names
import Tree
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

data HappyAbsSyn t10 t11 t12 t13 t14 t15 t16
	= HappyTerminal ((Tokens.Token AlexPosn))
	| HappyErrorToken Int
	| HappyAbsSyn4 ((Prg))
	| HappyAbsSyn5 ([Method])
	| HappyAbsSyn6 (Method)
	| HappyAbsSyn7 ([Tree.Stm])
	| HappyAbsSyn8 (Tree.Stm)
	| HappyAbsSyn9 (Tree.Exp)
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 ([Tree.Exp])
	| HappyAbsSyn18 ([Label])
	| HappyAbsSyn20 (Tree.BinOp)
	| HappyAbsSyn21 (Tree.RelOp)

action_0 (64) = happyShift action_4
action_0 (4) = happyGoto action_5
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 _ = happyReduce_2

action_1 (64) = happyShift action_4
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 _ = happyFail

action_2 _ = happyReduce_1

action_3 (64) = happyShift action_4
action_3 (5) = happyGoto action_7
action_3 (6) = happyGoto action_3
action_3 _ = happyReduce_2

action_4 (23) = happyShift action_6
action_4 _ = happyFail

action_5 (65) = happyAccept
action_5 _ = happyFail

action_6 (63) = happyShift action_8
action_6 _ = happyFail

action_7 _ = happyReduce_3

action_8 (24) = happyShift action_9
action_8 _ = happyFail

action_9 (25) = happyShift action_10
action_9 _ = happyFail

action_10 (23) = happyShift action_13
action_10 (29) = happyShift action_14
action_10 (31) = happyShift action_15
action_10 (38) = happyShift action_16
action_10 (40) = happyShift action_17
action_10 (41) = happyShift action_18
action_10 (7) = happyGoto action_11
action_10 (8) = happyGoto action_12
action_10 _ = happyReduce_5

action_11 (62) = happyShift action_26
action_11 _ = happyFail

action_12 (23) = happyShift action_13
action_12 (29) = happyShift action_14
action_12 (31) = happyShift action_15
action_12 (38) = happyShift action_16
action_12 (40) = happyShift action_17
action_12 (41) = happyShift action_18
action_12 (7) = happyGoto action_25
action_12 (8) = happyGoto action_12
action_12 _ = happyReduce_5

action_13 (23) = happyShift action_13
action_13 (29) = happyShift action_14
action_13 (31) = happyShift action_15
action_13 (38) = happyShift action_16
action_13 (40) = happyShift action_17
action_13 (41) = happyShift action_18
action_13 (8) = happyGoto action_24
action_13 _ = happyFail

action_14 (23) = happyShift action_23
action_14 _ = happyFail

action_15 (23) = happyShift action_22
action_15 _ = happyFail

action_16 (23) = happyShift action_21
action_16 _ = happyFail

action_17 (23) = happyShift action_20
action_17 _ = happyFail

action_18 (23) = happyShift action_19
action_18 _ = happyFail

action_19 (23) = happyShift action_44
action_19 (52) = happyShift action_45
action_19 (53) = happyShift action_46
action_19 (54) = happyShift action_47
action_19 (55) = happyShift action_48
action_19 (56) = happyShift action_49
action_19 (57) = happyShift action_50
action_19 (58) = happyShift action_51
action_19 (59) = happyShift action_52
action_19 (60) = happyShift action_53
action_19 (61) = happyShift action_54
action_19 (21) = happyGoto action_43
action_19 _ = happyFail

action_20 (23) = happyShift action_30
action_20 (30) = happyShift action_31
action_20 (32) = happyShift action_32
action_20 (33) = happyShift action_33
action_20 (34) = happyShift action_34
action_20 (35) = happyShift action_35
action_20 (36) = happyShift action_36
action_20 (37) = happyShift action_37
action_20 (39) = happyShift action_38
action_20 (9) = happyGoto action_42
action_20 _ = happyFail

action_21 (23) = happyShift action_13
action_21 (29) = happyShift action_14
action_21 (31) = happyShift action_15
action_21 (38) = happyShift action_16
action_21 (40) = happyShift action_17
action_21 (41) = happyShift action_18
action_21 (8) = happyGoto action_40
action_21 (15) = happyGoto action_41
action_21 _ = happyReduce_35

action_22 (64) = happyShift action_39
action_22 _ = happyFail

action_23 (23) = happyShift action_30
action_23 (30) = happyShift action_31
action_23 (32) = happyShift action_32
action_23 (33) = happyShift action_33
action_23 (34) = happyShift action_34
action_23 (35) = happyShift action_35
action_23 (36) = happyShift action_36
action_23 (37) = happyShift action_37
action_23 (39) = happyShift action_38
action_23 (9) = happyGoto action_29
action_23 _ = happyFail

action_24 (24) = happyShift action_28
action_24 _ = happyFail

action_25 _ = happyReduce_6

action_26 (64) = happyShift action_27
action_26 _ = happyFail

action_27 (26) = happyShift action_72
action_27 _ = happyFail

action_28 _ = happyReduce_12

action_29 (27) = happyShift action_71
action_29 _ = happyFail

action_30 (23) = happyShift action_30
action_30 (30) = happyShift action_31
action_30 (32) = happyShift action_32
action_30 (33) = happyShift action_33
action_30 (34) = happyShift action_34
action_30 (35) = happyShift action_35
action_30 (36) = happyShift action_36
action_30 (37) = happyShift action_37
action_30 (39) = happyShift action_38
action_30 (9) = happyGoto action_70
action_30 _ = happyFail

action_31 (23) = happyShift action_69
action_31 _ = happyFail

action_32 (23) = happyShift action_68
action_32 _ = happyFail

action_33 (23) = happyShift action_67
action_33 _ = happyFail

action_34 (23) = happyShift action_66
action_34 _ = happyFail

action_35 (23) = happyShift action_65
action_35 _ = happyFail

action_36 (23) = happyShift action_64
action_36 _ = happyFail

action_37 (23) = happyShift action_63
action_37 _ = happyFail

action_38 (23) = happyShift action_62
action_38 _ = happyFail

action_39 (24) = happyShift action_61
action_39 _ = happyFail

action_40 (27) = happyShift action_60
action_40 (16) = happyGoto action_59
action_40 _ = happyReduce_37

action_41 (24) = happyShift action_58
action_41 _ = happyFail

action_42 (27) = happyShift action_57
action_42 _ = happyFail

action_43 (27) = happyShift action_56
action_43 _ = happyFail

action_44 (23) = happyShift action_44
action_44 (52) = happyShift action_45
action_44 (53) = happyShift action_46
action_44 (54) = happyShift action_47
action_44 (55) = happyShift action_48
action_44 (56) = happyShift action_49
action_44 (57) = happyShift action_50
action_44 (58) = happyShift action_51
action_44 (59) = happyShift action_52
action_44 (60) = happyShift action_53
action_44 (61) = happyShift action_54
action_44 (21) = happyGoto action_55
action_44 _ = happyFail

action_45 _ = happyReduce_57

action_46 _ = happyReduce_58

action_47 _ = happyReduce_59

action_48 _ = happyReduce_60

action_49 _ = happyReduce_61

action_50 _ = happyReduce_62

action_51 _ = happyReduce_63

action_52 _ = happyReduce_64

action_53 _ = happyReduce_65

action_54 _ = happyReduce_66

action_55 (24) = happyShift action_110
action_55 _ = happyFail

action_56 (23) = happyShift action_30
action_56 (30) = happyShift action_31
action_56 (32) = happyShift action_32
action_56 (33) = happyShift action_33
action_56 (34) = happyShift action_34
action_56 (35) = happyShift action_35
action_56 (36) = happyShift action_36
action_56 (37) = happyShift action_37
action_56 (39) = happyShift action_38
action_56 (9) = happyGoto action_109
action_56 _ = happyFail

action_57 (23) = happyShift action_107
action_57 (64) = happyShift action_108
action_57 (18) = happyGoto action_106
action_57 _ = happyReduce_41

action_58 _ = happyReduce_10

action_59 _ = happyReduce_36

action_60 (23) = happyShift action_13
action_60 (29) = happyShift action_14
action_60 (31) = happyShift action_15
action_60 (38) = happyShift action_16
action_60 (40) = happyShift action_17
action_60 (41) = happyShift action_18
action_60 (8) = happyGoto action_105
action_60 _ = happyFail

action_61 _ = happyReduce_11

action_62 (23) = happyShift action_30
action_62 (30) = happyShift action_31
action_62 (32) = happyShift action_32
action_62 (33) = happyShift action_33
action_62 (34) = happyShift action_34
action_62 (35) = happyShift action_35
action_62 (36) = happyShift action_36
action_62 (37) = happyShift action_37
action_62 (39) = happyShift action_38
action_62 (9) = happyGoto action_104
action_62 _ = happyFail

action_63 (23) = happyShift action_93
action_63 (42) = happyShift action_94
action_63 (43) = happyShift action_95
action_63 (44) = happyShift action_96
action_63 (45) = happyShift action_97
action_63 (46) = happyShift action_98
action_63 (47) = happyShift action_99
action_63 (48) = happyShift action_100
action_63 (49) = happyShift action_101
action_63 (50) = happyShift action_102
action_63 (51) = happyShift action_103
action_63 (20) = happyGoto action_92
action_63 _ = happyFail

action_64 (23) = happyShift action_30
action_64 (30) = happyShift action_31
action_64 (32) = happyShift action_32
action_64 (33) = happyShift action_33
action_64 (34) = happyShift action_34
action_64 (35) = happyShift action_35
action_64 (36) = happyShift action_36
action_64 (37) = happyShift action_37
action_64 (39) = happyShift action_38
action_64 (9) = happyGoto action_91
action_64 _ = happyFail

action_65 (63) = happyShift action_90
action_65 _ = happyFail

action_66 (23) = happyShift action_88
action_66 (64) = happyShift action_89
action_66 (11) = happyGoto action_87
action_66 _ = happyFail

action_67 (23) = happyShift action_86
action_67 (29) = happyShift action_14
action_67 (30) = happyShift action_31
action_67 (31) = happyShift action_15
action_67 (32) = happyShift action_32
action_67 (33) = happyShift action_33
action_67 (34) = happyShift action_34
action_67 (35) = happyShift action_35
action_67 (36) = happyShift action_36
action_67 (37) = happyShift action_37
action_67 (38) = happyShift action_16
action_67 (39) = happyShift action_38
action_67 (40) = happyShift action_17
action_67 (41) = happyShift action_18
action_67 (8) = happyGoto action_83
action_67 (9) = happyGoto action_84
action_67 (13) = happyGoto action_85
action_67 _ = happyFail

action_68 (23) = happyShift action_80
action_68 (28) = happyShift action_81
action_68 (63) = happyShift action_82
action_68 (10) = happyGoto action_79
action_68 _ = happyFail

action_69 (22) = happyShift action_76
action_69 (23) = happyShift action_77
action_69 (64) = happyShift action_78
action_69 (12) = happyGoto action_75
action_69 _ = happyFail

action_70 (24) = happyShift action_74
action_70 _ = happyFail

action_71 (23) = happyShift action_30
action_71 (30) = happyShift action_31
action_71 (32) = happyShift action_32
action_71 (33) = happyShift action_33
action_71 (34) = happyShift action_34
action_71 (35) = happyShift action_35
action_71 (36) = happyShift action_36
action_71 (37) = happyShift action_37
action_71 (39) = happyShift action_38
action_71 (9) = happyGoto action_73
action_71 _ = happyFail

action_72 _ = happyReduce_4

action_73 (24) = happyShift action_134
action_73 _ = happyFail

action_74 _ = happyReduce_22

action_75 (24) = happyShift action_133
action_75 _ = happyFail

action_76 (64) = happyShift action_132
action_76 _ = happyFail

action_77 (22) = happyShift action_76
action_77 (23) = happyShift action_77
action_77 (64) = happyShift action_78
action_77 (12) = happyGoto action_131
action_77 _ = happyFail

action_78 _ = happyReduce_28

action_79 (24) = happyShift action_130
action_79 _ = happyFail

action_80 (23) = happyShift action_80
action_80 (28) = happyShift action_81
action_80 (63) = happyShift action_82
action_80 (10) = happyGoto action_129
action_80 _ = happyFail

action_81 (63) = happyShift action_128
action_81 _ = happyFail

action_82 _ = happyReduce_23

action_83 (27) = happyShift action_127
action_83 (14) = happyGoto action_126
action_83 _ = happyFail

action_84 _ = happyReduce_31

action_85 (24) = happyShift action_125
action_85 _ = happyFail

action_86 (23) = happyShift action_86
action_86 (29) = happyShift action_14
action_86 (30) = happyShift action_31
action_86 (31) = happyShift action_15
action_86 (32) = happyShift action_32
action_86 (33) = happyShift action_33
action_86 (34) = happyShift action_34
action_86 (35) = happyShift action_35
action_86 (36) = happyShift action_36
action_86 (37) = happyShift action_37
action_86 (38) = happyShift action_16
action_86 (39) = happyShift action_38
action_86 (40) = happyShift action_17
action_86 (41) = happyShift action_18
action_86 (8) = happyGoto action_24
action_86 (9) = happyGoto action_70
action_86 _ = happyFail

action_87 (24) = happyShift action_124
action_87 _ = happyFail

action_88 (23) = happyShift action_88
action_88 (64) = happyShift action_89
action_88 (11) = happyGoto action_123
action_88 _ = happyFail

action_89 _ = happyReduce_26

action_90 (24) = happyShift action_122
action_90 _ = happyFail

action_91 (24) = happyShift action_121
action_91 _ = happyFail

action_92 (27) = happyShift action_120
action_92 _ = happyFail

action_93 (23) = happyShift action_93
action_93 (42) = happyShift action_94
action_93 (43) = happyShift action_95
action_93 (44) = happyShift action_96
action_93 (45) = happyShift action_97
action_93 (46) = happyShift action_98
action_93 (47) = happyShift action_99
action_93 (48) = happyShift action_100
action_93 (49) = happyShift action_101
action_93 (50) = happyShift action_102
action_93 (51) = happyShift action_103
action_93 (20) = happyGoto action_119
action_93 _ = happyFail

action_94 _ = happyReduce_46

action_95 _ = happyReduce_47

action_96 _ = happyReduce_48

action_97 _ = happyReduce_49

action_98 _ = happyReduce_50

action_99 _ = happyReduce_51

action_100 _ = happyReduce_52

action_101 _ = happyReduce_53

action_102 _ = happyReduce_54

action_103 _ = happyReduce_55

action_104 (24) = happyShift action_117
action_104 (27) = happyShift action_118
action_104 _ = happyFail

action_105 (27) = happyShift action_60
action_105 (16) = happyGoto action_116
action_105 _ = happyReduce_37

action_106 (24) = happyShift action_115
action_106 _ = happyFail

action_107 (23) = happyShift action_107
action_107 (64) = happyShift action_108
action_107 (18) = happyGoto action_114
action_107 _ = happyReduce_41

action_108 (27) = happyShift action_113
action_108 (19) = happyGoto action_112
action_108 _ = happyReduce_44

action_109 (27) = happyShift action_111
action_109 _ = happyFail

action_110 _ = happyReduce_67

action_111 (23) = happyShift action_30
action_111 (30) = happyShift action_31
action_111 (32) = happyShift action_32
action_111 (33) = happyShift action_33
action_111 (34) = happyShift action_34
action_111 (35) = happyShift action_35
action_111 (36) = happyShift action_36
action_111 (37) = happyShift action_37
action_111 (39) = happyShift action_38
action_111 (9) = happyGoto action_147
action_111 _ = happyFail

action_112 _ = happyReduce_42

action_113 (64) = happyShift action_146
action_113 _ = happyFail

action_114 (24) = happyShift action_145
action_114 _ = happyFail

action_115 _ = happyReduce_8

action_116 _ = happyReduce_38

action_117 _ = happyReduce_19

action_118 (23) = happyShift action_30
action_118 (30) = happyShift action_31
action_118 (32) = happyShift action_32
action_118 (33) = happyShift action_33
action_118 (34) = happyShift action_34
action_118 (35) = happyShift action_35
action_118 (36) = happyShift action_36
action_118 (37) = happyShift action_37
action_118 (39) = happyShift action_38
action_118 (9) = happyGoto action_143
action_118 (17) = happyGoto action_144
action_118 _ = happyFail

action_119 (24) = happyShift action_142
action_119 _ = happyFail

action_120 (23) = happyShift action_30
action_120 (30) = happyShift action_31
action_120 (32) = happyShift action_32
action_120 (33) = happyShift action_33
action_120 (34) = happyShift action_34
action_120 (35) = happyShift action_35
action_120 (36) = happyShift action_36
action_120 (37) = happyShift action_37
action_120 (39) = happyShift action_38
action_120 (9) = happyGoto action_141
action_120 _ = happyFail

action_121 _ = happyReduce_18

action_122 _ = happyReduce_15

action_123 (24) = happyShift action_140
action_123 _ = happyFail

action_124 _ = happyReduce_14

action_125 _ = happyReduce_21

action_126 _ = happyReduce_32

action_127 (23) = happyShift action_86
action_127 (29) = happyShift action_14
action_127 (30) = happyShift action_31
action_127 (31) = happyShift action_15
action_127 (32) = happyShift action_32
action_127 (33) = happyShift action_33
action_127 (34) = happyShift action_34
action_127 (35) = happyShift action_35
action_127 (36) = happyShift action_36
action_127 (37) = happyShift action_37
action_127 (38) = happyShift action_16
action_127 (39) = happyShift action_38
action_127 (40) = happyShift action_17
action_127 (41) = happyShift action_18
action_127 (8) = happyGoto action_138
action_127 (9) = happyGoto action_139
action_127 _ = happyFail

action_128 _ = happyReduce_24

action_129 (24) = happyShift action_137
action_129 _ = happyFail

action_130 _ = happyReduce_16

action_131 (24) = happyShift action_136
action_131 _ = happyFail

action_132 (22) = happyShift action_135
action_132 _ = happyFail

action_133 _ = happyReduce_13

action_134 _ = happyReduce_7

action_135 _ = happyReduce_29

action_136 _ = happyReduce_30

action_137 _ = happyReduce_25

action_138 (27) = happyShift action_127
action_138 (14) = happyGoto action_153
action_138 _ = happyFail

action_139 _ = happyReduce_33

action_140 _ = happyReduce_27

action_141 (27) = happyShift action_152
action_141 _ = happyFail

action_142 _ = happyReduce_56

action_143 (27) = happyShift action_151
action_143 _ = happyReduce_39

action_144 (24) = happyShift action_150
action_144 _ = happyFail

action_145 _ = happyReduce_43

action_146 (27) = happyShift action_113
action_146 (19) = happyGoto action_149
action_146 _ = happyReduce_44

action_147 (27) = happyShift action_148
action_147 _ = happyFail

action_148 (64) = happyShift action_156
action_148 _ = happyFail

action_149 _ = happyReduce_45

action_150 _ = happyReduce_20

action_151 (23) = happyShift action_30
action_151 (30) = happyShift action_31
action_151 (32) = happyShift action_32
action_151 (33) = happyShift action_33
action_151 (34) = happyShift action_34
action_151 (35) = happyShift action_35
action_151 (36) = happyShift action_36
action_151 (37) = happyShift action_37
action_151 (39) = happyShift action_38
action_151 (9) = happyGoto action_143
action_151 (17) = happyGoto action_155
action_151 _ = happyFail

action_152 (23) = happyShift action_30
action_152 (30) = happyShift action_31
action_152 (32) = happyShift action_32
action_152 (33) = happyShift action_33
action_152 (34) = happyShift action_34
action_152 (35) = happyShift action_35
action_152 (36) = happyShift action_36
action_152 (37) = happyShift action_37
action_152 (39) = happyShift action_38
action_152 (9) = happyGoto action_154
action_152 _ = happyFail

action_153 _ = happyReduce_34

action_154 (24) = happyShift action_158
action_154 _ = happyFail

action_155 _ = happyReduce_40

action_156 (27) = happyShift action_157
action_156 _ = happyFail

action_157 (64) = happyShift action_159
action_157 _ = happyFail

action_158 _ = happyReduce_17

action_159 (24) = happyShift action_160
action_159 _ = happyFail

action_160 _ = happyReduce_9

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Prg { methods = happy_var_1 }
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_0  5 happyReduction_2
happyReduction_2  =  HappyAbsSyn5
		 ([]
	)

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1:happy_var_2
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happyReduce 9 6 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyTerminal (Tokens.Token (Tokens.Id happy_var_8) _)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Tokens.Token (Tokens.Const happy_var_3) _)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Tokens.Token (Tokens.Id happy_var_1) _)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Method { methodname = happy_var_1, nparams = happy_var_3, body = happy_var_6, returnTemp = mkNamedTemp happy_var_8 }
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_0  7 happyReduction_5
happyReduction_5  =  HappyAbsSyn7
		 ([]
	)

happyReduce_6 = happySpecReduce_2  7 happyReduction_6
happyReduction_6 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1:happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happyReduce 6 8 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Tree.MOVE happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 6 8 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Tree.JUMP happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 12 8 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyTerminal (Tokens.Token (Tokens.Id happy_var_11) _)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Tokens.Token (Tokens.Id happy_var_9) _)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Tree.CJUMP happy_var_3 happy_var_5 happy_var_7 happy_var_9 happy_var_11
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 4 8 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Tree.SEQ happy_var_3
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 4 8 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyTerminal (Tokens.Token (Tokens.Id happy_var_3) _)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Tree.LABEL happy_var_3
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_3  8 happyReduction_12
happyReduction_12 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happyReduce 4 9 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Tree.NAME happy_var_3
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 4 9 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Tree.TEMP (mkNamedTemp happy_var_3)
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 4 9 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyTerminal (Tokens.Token (Tokens.Const happy_var_3) _)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Tree.PARAM happy_var_3
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 4 9 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Tree.CONST (asInt32 happy_var_3)
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 8 9 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Tree.BINOP happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 4 9 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Tree.MEM happy_var_3
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 4 9 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Tree.CALL happy_var_3 []
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 6 9 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Tree.CALL happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 4 9 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (let (s,e) = happy_var_3 in Tree.ESEQ (Tree.SEQ s) e
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_3  9 happyReduction_22
happyReduction_22 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (happy_var_2
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  10 happyReduction_23
happyReduction_23 (HappyTerminal (Tokens.Token (Tokens.Const happy_var_1) _))
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  10 happyReduction_24
happyReduction_24 (HappyTerminal (Tokens.Token (Tokens.Const happy_var_2) _))
	_
	 =  HappyAbsSyn10
		 (0-happy_var_2
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  10 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  11 happyReduction_26
happyReduction_26 (HappyTerminal (Tokens.Token (Tokens.Id happy_var_1) _))
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  11 happyReduction_27
happyReduction_27 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  12 happyReduction_28
happyReduction_28 (HappyTerminal (Tokens.Token (Tokens.Id happy_var_1) _))
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  12 happyReduction_29
happyReduction_29 _
	(HappyTerminal (Tokens.Token (Tokens.Id happy_var_2) _))
	_
	 =  HappyAbsSyn12
		 (happy_var_2
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  12 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  13 happyReduction_31
happyReduction_31 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn13
		 (([], happy_var_1)
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_2  13 happyReduction_32
happyReduction_32 (HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn13
		 (let (s,e)=happy_var_2 in (happy_var_1:s, e)
	)
happyReduction_32 _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_2  14 happyReduction_33
happyReduction_33 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (([], happy_var_2)
	)
happyReduction_33 _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  14 happyReduction_34
happyReduction_34 (HappyAbsSyn14  happy_var_3)
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (let (s,e)=happy_var_3 in (happy_var_2:s, e)
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_0  15 happyReduction_35
happyReduction_35  =  HappyAbsSyn15
		 ([]
	)

happyReduce_36 = happySpecReduce_2  15 happyReduction_36
happyReduction_36 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1:happy_var_2
	)
happyReduction_36 _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_0  16 happyReduction_37
happyReduction_37  =  HappyAbsSyn16
		 ([]
	)

happyReduce_38 = happySpecReduce_3  16 happyReduction_38
happyReduction_38 (HappyAbsSyn16  happy_var_3)
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2:happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  17 happyReduction_39
happyReduction_39 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn17
		 ([happy_var_1]
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  17 happyReduction_40
happyReduction_40 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1:happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_0  18 happyReduction_41
happyReduction_41  =  HappyAbsSyn18
		 ([]
	)

happyReduce_42 = happySpecReduce_2  18 happyReduction_42
happyReduction_42 (HappyAbsSyn18  happy_var_2)
	(HappyTerminal (Tokens.Token (Tokens.Id happy_var_1) _))
	 =  HappyAbsSyn18
		 (happy_var_1:happy_var_2
	)
happyReduction_42 _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  18 happyReduction_43
happyReduction_43 _
	(HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (happy_var_2
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_0  19 happyReduction_44
happyReduction_44  =  HappyAbsSyn18
		 ([]
	)

happyReduce_45 = happySpecReduce_3  19 happyReduction_45
happyReduction_45 (HappyAbsSyn18  happy_var_3)
	(HappyTerminal (Tokens.Token (Tokens.Id happy_var_2) _))
	_
	 =  HappyAbsSyn18
		 (happy_var_2:happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  20 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn20
		 (Tree.MUL
	)

happyReduce_47 = happySpecReduce_1  20 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn20
		 (Tree.PLUS
	)

happyReduce_48 = happySpecReduce_1  20 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn20
		 (Tree.MINUS
	)

happyReduce_49 = happySpecReduce_1  20 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn20
		 (Tree.DIV
	)

happyReduce_50 = happySpecReduce_1  20 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn20
		 (Tree.AND
	)

happyReduce_51 = happySpecReduce_1  20 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn20
		 (Tree.OR
	)

happyReduce_52 = happySpecReduce_1  20 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn20
		 (Tree.XOR
	)

happyReduce_53 = happySpecReduce_1  20 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn20
		 (Tree.LSHIFT
	)

happyReduce_54 = happySpecReduce_1  20 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn20
		 (Tree.RSHIFT
	)

happyReduce_55 = happySpecReduce_1  20 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn20
		 (Tree.ARSHIFT
	)

happyReduce_56 = happySpecReduce_3  20 happyReduction_56
happyReduction_56 _
	(HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (happy_var_2
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  21 happyReduction_57
happyReduction_57 _
	 =  HappyAbsSyn21
		 (Tree.EQ
	)

happyReduce_58 = happySpecReduce_1  21 happyReduction_58
happyReduction_58 _
	 =  HappyAbsSyn21
		 (Tree.NE
	)

happyReduce_59 = happySpecReduce_1  21 happyReduction_59
happyReduction_59 _
	 =  HappyAbsSyn21
		 (Tree.LT
	)

happyReduce_60 = happySpecReduce_1  21 happyReduction_60
happyReduction_60 _
	 =  HappyAbsSyn21
		 (Tree.GT
	)

happyReduce_61 = happySpecReduce_1  21 happyReduction_61
happyReduction_61 _
	 =  HappyAbsSyn21
		 (Tree.LE
	)

happyReduce_62 = happySpecReduce_1  21 happyReduction_62
happyReduction_62 _
	 =  HappyAbsSyn21
		 (Tree.GE
	)

happyReduce_63 = happySpecReduce_1  21 happyReduction_63
happyReduction_63 _
	 =  HappyAbsSyn21
		 (Tree.ULT
	)

happyReduce_64 = happySpecReduce_1  21 happyReduction_64
happyReduction_64 _
	 =  HappyAbsSyn21
		 (Tree.UGT
	)

happyReduce_65 = happySpecReduce_1  21 happyReduction_65
happyReduction_65 _
	 =  HappyAbsSyn21
		 (Tree.ULE
	)

happyReduce_66 = happySpecReduce_1  21 happyReduction_66
happyReduction_66 _
	 =  HappyAbsSyn21
		 (Tree.UGE
	)

happyReduce_67 = happySpecReduce_3  21 happyReduction_67
happyReduction_67 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn21
		 (happy_var_2
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 65 65 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Tokens.Token Tokens.Quote _ -> cont 22;
	Tokens.Token Tokens.LPar _ -> cont 23;
	Tokens.Token Tokens.RPar _ -> cont 24;
	Tokens.Token Tokens.LBrace _ -> cont 25;
	Tokens.Token Tokens.RBrace _ -> cont 26;
	Tokens.Token Tokens.Comma _ -> cont 27;
	Tokens.Token Tokens.Minus _ -> cont 28;
	Tokens.Token Tokens.KwMOVE _ -> cont 29;
	Tokens.Token Tokens.KwNAME _ -> cont 30;
	Tokens.Token Tokens.KwLABEL _ -> cont 31;
	Tokens.Token Tokens.KwCONST _ -> cont 32;
	Tokens.Token Tokens.KwESEQ _ -> cont 33;
	Tokens.Token Tokens.KwTEMP _ -> cont 34;
	Tokens.Token Tokens.KwPARAM _ -> cont 35;
	Tokens.Token Tokens.KwMEM _ -> cont 36;
	Tokens.Token Tokens.KwBINOP _ -> cont 37;
	Tokens.Token Tokens.KwSEQ _ -> cont 38;
	Tokens.Token Tokens.KwCALL _ -> cont 39;
	Tokens.Token Tokens.KwJUMP _ -> cont 40;
	Tokens.Token Tokens.KwCJUMP _ -> cont 41;
	Tokens.Token Tokens.KwMUL _ -> cont 42;
	Tokens.Token Tokens.KwPLUS _ -> cont 43;
	Tokens.Token Tokens.KwMINUS _ -> cont 44;
	Tokens.Token Tokens.KwDIV _ -> cont 45;
	Tokens.Token Tokens.KwAND _ -> cont 46;
	Tokens.Token Tokens.KwOR _ -> cont 47;
	Tokens.Token Tokens.KwXOR _ -> cont 48;
	Tokens.Token Tokens.KwLSHIFT _ -> cont 49;
	Tokens.Token Tokens.KwRSHIFT _ -> cont 50;
	Tokens.Token Tokens.KwARSHIFT _ -> cont 51;
	Tokens.Token Tokens.KwEQ _ -> cont 52;
	Tokens.Token Tokens.KwNE _ -> cont 53;
	Tokens.Token Tokens.KwLT _ -> cont 54;
	Tokens.Token Tokens.KwGT _ -> cont 55;
	Tokens.Token Tokens.KwLE _ -> cont 56;
	Tokens.Token Tokens.KwGE _ -> cont 57;
	Tokens.Token Tokens.KwULT _ -> cont 58;
	Tokens.Token Tokens.KwUGT _ -> cont 59;
	Tokens.Token Tokens.KwULE _ -> cont 60;
	Tokens.Token Tokens.KwUGE _ -> cont 61;
	Tokens.Token Tokens.KwReturn _ -> cont 62;
	Tokens.Token (Tokens.Const happy_dollar_dollar) _ -> cont 63;
	Tokens.Token (Tokens.Id happy_dollar_dollar) _ -> cont 64;
	_ -> happyError' (tk:tks)
	}

happyError_ 65 tk tks = happyError' tks
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
happyError' :: () => [((Tokens.Token AlexPosn))] -> HappyIdentity a
happyError' = HappyIdentity . happyError

parse tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


asInt32 :: Integer -> Int32
asInt32 x = if x == fromIntegral y then y
            else error $ "Parse error: constant " ++ show x
                         ++ " does not fit in 32 bits."
  where y = (fromIntegral x :: Int32)

happyError :: [Tokens.Token AlexPosn] -> a
happyError tks = error ("Parse error at " ++ lcn ++ "\n")
	where
	lcn = case tks of
		  [] -> "end of file"
		  (tk : _) -> "line " ++ show l ++ ", column " ++ show c
			where AlexPn _ l c = Tokens.token_pos tk
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
