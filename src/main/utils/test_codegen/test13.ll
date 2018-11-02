@fmtlli = private unnamed_addr constant [5 x i8] c"%lli\00"
declare i32 @putchar(i32)
declare i32 @printf(i8* noalias nocapture, ...) nounwind
declare i64* @malloc(i64)
@flglobal_test = global i64* null
@flglobal_pb = global i64* null
@flglobal_and = global i64* null
@flglobal_or = global i64* null
@flglobal_not = global i64* null
@flglobal_main = global i64* null
define i64* @flrtn_2(i64* %fun, i64* %arg) {
  %flvar_4 = call i64* @malloc(i64 16)
  %flvar_8 = getelementptr i64, i64* %flvar_4, i64 0
  store i64 5, i64* %flvar_8
  %flvar_9 = getelementptr i64, i64* %flvar_4, i64 1
  store i64 84, i64* %flvar_9
  %flvar_5 = getelementptr i64, i64* %flvar_4, i64 1
  %flvar_6 = load i64, i64* %flvar_5
  %flvar_7 = trunc i64 %flvar_6 to i32
  call i32 @putchar(i32 %flvar_7)
  %flvar_10 = call i64* @malloc(i64 16)
  %flvar_14 = getelementptr i64, i64* %flvar_10, i64 0
  store i64 5, i64* %flvar_14
  %flvar_15 = getelementptr i64, i64* %flvar_10, i64 1
  store i64 69, i64* %flvar_15
  %flvar_11 = getelementptr i64, i64* %flvar_10, i64 1
  %flvar_12 = load i64, i64* %flvar_11
  %flvar_13 = trunc i64 %flvar_12 to i32
  call i32 @putchar(i32 %flvar_13)
  %flvar_16 = call i64* @malloc(i64 16)
  %flvar_20 = getelementptr i64, i64* %flvar_16, i64 0
  store i64 5, i64* %flvar_20
  %flvar_21 = getelementptr i64, i64* %flvar_16, i64 1
  store i64 83, i64* %flvar_21
  %flvar_17 = getelementptr i64, i64* %flvar_16, i64 1
  %flvar_18 = load i64, i64* %flvar_17
  %flvar_19 = trunc i64 %flvar_18 to i32
  call i32 @putchar(i32 %flvar_19)
  %flvar_22 = call i64* @malloc(i64 16)
  %flvar_26 = getelementptr i64, i64* %flvar_22, i64 0
  store i64 5, i64* %flvar_26
  %flvar_27 = getelementptr i64, i64* %flvar_22, i64 1
  store i64 84, i64* %flvar_27
  %flvar_23 = getelementptr i64, i64* %flvar_22, i64 1
  %flvar_24 = load i64, i64* %flvar_23
  %flvar_25 = trunc i64 %flvar_24 to i32
  call i32 @putchar(i32 %flvar_25)
  %flvar_28 = call i64* @malloc(i64 16)
  %flvar_32 = getelementptr i64, i64* %flvar_28, i64 0
  store i64 5, i64* %flvar_32
  %flvar_33 = getelementptr i64, i64* %flvar_28, i64 1
  store i64 32, i64* %flvar_33
  %flvar_29 = getelementptr i64, i64* %flvar_28, i64 1
  %flvar_30 = load i64, i64* %flvar_29
  %flvar_31 = trunc i64 %flvar_30 to i32
  call i32 @putchar(i32 %flvar_31)
  %flvar_38 = getelementptr i64, i64* %fun, i64 2
  %flvar_39 = load i64, i64* %flvar_38
  %flvar_34 = inttoptr i64 %flvar_39 to i64*
  %flvar_35 = getelementptr [5 x i8], [5 x i8]* @fmtlli, i64 0, i64 0
  %flvar_36 = getelementptr i64, i64* %flvar_34, i64 1
  %flvar_37 = load i64, i64* %flvar_36
  call i32 (i8*, ...) @printf(i8* %flvar_35, i64 %flvar_37)
  %flvar_40 = call i64* @malloc(i64 16)
  %flvar_44 = getelementptr i64, i64* %flvar_40, i64 0
  store i64 5, i64* %flvar_44
  %flvar_45 = getelementptr i64, i64* %flvar_40, i64 1
  store i64 10, i64* %flvar_45
  %flvar_41 = getelementptr i64, i64* %flvar_40, i64 1
  %flvar_42 = load i64, i64* %flvar_41
  %flvar_43 = trunc i64 %flvar_42 to i32
  call i32 @putchar(i32 %flvar_43)
  %flvar_46 = call i64* @malloc(i64 16)
  %flvar_50 = getelementptr i64, i64* %flvar_46, i64 0
  store i64 5, i64* %flvar_50
  %flvar_51 = getelementptr i64, i64* %flvar_46, i64 1
  store i64 9, i64* %flvar_51
  %flvar_47 = getelementptr i64, i64* %flvar_46, i64 1
  %flvar_48 = load i64, i64* %flvar_47
  %flvar_49 = trunc i64 %flvar_48 to i32
  call i32 @putchar(i32 %flvar_49)
  %flvar_58 = getelementptr i64, i64* %fun, i64 3
  %flvar_59 = load i64, i64* %flvar_58
  %flvar_53 = inttoptr i64 %flvar_59 to i64*
  %flvar_54 = bitcast i64* %arg to i64*
  %flvar_55 = getelementptr i64, i64* %flvar_53, i64 1
  %flvar_56 = load i64, i64* %flvar_55
  %flvar_57 = inttoptr i64 %flvar_56 to i64* (i64*, i64*)*
  %flvar_52 = call i64* %flvar_57(i64* %flvar_53, i64* %flvar_54)
  %flvar_3 = call i64* @malloc(i64 16)
  %flvar_63 = getelementptr i64, i64* %flvar_3, i64 0
  store i64 5, i64* %flvar_63
  %flvar_64 = getelementptr i64, i64* %flvar_3, i64 1
  store i64 10, i64* %flvar_64
  %flvar_60 = getelementptr i64, i64* %flvar_3, i64 1
  %flvar_61 = load i64, i64* %flvar_60
  %flvar_62 = trunc i64 %flvar_61 to i32
  call i32 @putchar(i32 %flvar_62)
  ret i64* %flvar_3
}
define i64* @flrtn_1(i64* %fun, i64* %arg) {
  %flvar_2 = call i64* @malloc(i64 32)
  %flvar_66 = getelementptr i64, i64* %flvar_2, i64 0
  store i64 3, i64* %flvar_66
  %flvar_65 = ptrtoint i64* (i64*, i64*)* @flrtn_2 to i64
  %flvar_67 = getelementptr i64, i64* %flvar_2, i64 1
  store i64 %flvar_65, i64* %flvar_67
  %flvar_70 = getelementptr i64, i64* %fun, i64 2
  %flvar_71 = load i64, i64* %flvar_70
  %flvar_68 = inttoptr i64 %flvar_71 to i64*
  %flvar_69 = ptrtoint i64* %flvar_68 to i64
  %flvar_72 = getelementptr i64, i64* %flvar_2, i64 2
  store i64 %flvar_69, i64* %flvar_72
  %flvar_73 = bitcast i64* %arg to i64*
  %flvar_74 = ptrtoint i64* %flvar_73 to i64
  %flvar_75 = getelementptr i64, i64* %flvar_2, i64 3
  store i64 %flvar_74, i64* %flvar_75
  ret i64* %flvar_2
}
define i64* @flrtn_0(i64* %fun, i64* %arg) {
  %flvar_1 = call i64* @malloc(i64 24)
  %flvar_77 = getelementptr i64, i64* %flvar_1, i64 0
  store i64 3, i64* %flvar_77
  %flvar_76 = ptrtoint i64* (i64*, i64*)* @flrtn_1 to i64
  %flvar_78 = getelementptr i64, i64* %flvar_1, i64 1
  store i64 %flvar_76, i64* %flvar_78
  %flvar_79 = bitcast i64* %arg to i64*
  %flvar_80 = ptrtoint i64* %flvar_79 to i64
  %flvar_81 = getelementptr i64, i64* %flvar_1, i64 2
  store i64 %flvar_80, i64* %flvar_81
  ret i64* %flvar_1
}
define i64* @flrtn_3(i64* %fun, i64* %arg) {
  %flvar_90 = bitcast i64* %arg to i64*
  br label %fllab_2
fllab_2:
  %flvar_93 = getelementptr i64, i64* %flvar_90, i64 0
  %flvar_94 = load i64, i64* %flvar_93
  %flvar_95 = icmp eq i64 %flvar_94, 1
  br i1 %flvar_95, label %fllab_4, label %fllab_3
fllab_4:
  %flvar_91 = call i64* @malloc(i64 16)
  %flvar_96 = getelementptr i64, i64* %flvar_91, i64 0
  store i64 5, i64* %flvar_96
  %flvar_97 = getelementptr i64, i64* %flvar_91, i64 1
  store i64 84, i64* %flvar_97
  br label %fllab_1
fllab_3:
  %flvar_98 = getelementptr i64, i64* %flvar_90, i64 0
  %flvar_99 = load i64, i64* %flvar_98
  %flvar_100 = icmp eq i64 %flvar_99, 0
  br i1 %flvar_100, label %fllab_5, label %fllab_0
fllab_5:
  %flvar_92 = call i64* @malloc(i64 16)
  %flvar_101 = getelementptr i64, i64* %flvar_92, i64 0
  store i64 5, i64* %flvar_101
  %flvar_102 = getelementptr i64, i64* %flvar_92, i64 1
  store i64 70, i64* %flvar_102
  br label %fllab_1
fllab_0:
  unreachable
fllab_1:
  %flvar_86 = phi i64* [%flvar_91, %fllab_4], [%flvar_92, %fllab_5]
  %flvar_87 = getelementptr i64, i64* %flvar_86, i64 1
  %flvar_88 = load i64, i64* %flvar_87
  %flvar_89 = trunc i64 %flvar_88 to i32
  call i32 @putchar(i32 %flvar_89)
  ret i64* %flvar_86
}
define i64* @flrtn_5(i64* %fun, i64* %arg) {
  %flvar_112 = getelementptr i64, i64* %fun, i64 2
  %flvar_113 = load i64, i64* %flvar_112
  %flvar_109 = inttoptr i64 %flvar_113 to i64*
  br label %fllab_8
fllab_8:
  %flvar_114 = getelementptr i64, i64* %flvar_109, i64 0
  %flvar_115 = load i64, i64* %flvar_114
  %flvar_116 = icmp eq i64 %flvar_115, 1
  br i1 %flvar_116, label %fllab_10, label %fllab_9
fllab_10:
  %flvar_110 = bitcast i64* %arg to i64*
  br label %fllab_7
fllab_9:
  %flvar_117 = getelementptr i64, i64* %flvar_109, i64 0
  %flvar_118 = load i64, i64* %flvar_117
  %flvar_119 = icmp eq i64 %flvar_118, 0
  br i1 %flvar_119, label %fllab_11, label %fllab_6
fllab_11:
  %flvar_111 = call i64* @malloc(i64 16)
  %flvar_120 = getelementptr i64, i64* %flvar_111, i64 0
  store i64 0, i64* %flvar_120
  br label %fllab_7
fllab_6:
  unreachable
fllab_7:
  %flvar_108 = phi i64* [%flvar_110, %fllab_10], [%flvar_111, %fllab_11]
  ret i64* %flvar_108
}
define i64* @flrtn_4(i64* %fun, i64* %arg) {
  %flvar_107 = call i64* @malloc(i64 24)
  %flvar_122 = getelementptr i64, i64* %flvar_107, i64 0
  store i64 3, i64* %flvar_122
  %flvar_121 = ptrtoint i64* (i64*, i64*)* @flrtn_5 to i64
  %flvar_123 = getelementptr i64, i64* %flvar_107, i64 1
  store i64 %flvar_121, i64* %flvar_123
  %flvar_124 = bitcast i64* %arg to i64*
  %flvar_125 = ptrtoint i64* %flvar_124 to i64
  %flvar_126 = getelementptr i64, i64* %flvar_107, i64 2
  store i64 %flvar_125, i64* %flvar_126
  ret i64* %flvar_107
}
define i64* @flrtn_7(i64* %fun, i64* %arg) {
  %flvar_136 = getelementptr i64, i64* %fun, i64 2
  %flvar_137 = load i64, i64* %flvar_136
  %flvar_133 = inttoptr i64 %flvar_137 to i64*
  br label %fllab_14
fllab_14:
  %flvar_138 = getelementptr i64, i64* %flvar_133, i64 0
  %flvar_139 = load i64, i64* %flvar_138
  %flvar_140 = icmp eq i64 %flvar_139, 1
  br i1 %flvar_140, label %fllab_16, label %fllab_15
fllab_16:
  %flvar_134 = call i64* @malloc(i64 16)
  %flvar_141 = getelementptr i64, i64* %flvar_134, i64 0
  store i64 1, i64* %flvar_141
  br label %fllab_13
fllab_15:
  %flvar_142 = getelementptr i64, i64* %flvar_133, i64 0
  %flvar_143 = load i64, i64* %flvar_142
  %flvar_144 = icmp eq i64 %flvar_143, 0
  br i1 %flvar_144, label %fllab_17, label %fllab_12
fllab_17:
  %flvar_135 = bitcast i64* %arg to i64*
  br label %fllab_13
fllab_12:
  unreachable
fllab_13:
  %flvar_132 = phi i64* [%flvar_134, %fllab_16], [%flvar_135, %fllab_17]
  ret i64* %flvar_132
}
define i64* @flrtn_6(i64* %fun, i64* %arg) {
  %flvar_131 = call i64* @malloc(i64 24)
  %flvar_146 = getelementptr i64, i64* %flvar_131, i64 0
  store i64 3, i64* %flvar_146
  %flvar_145 = ptrtoint i64* (i64*, i64*)* @flrtn_7 to i64
  %flvar_147 = getelementptr i64, i64* %flvar_131, i64 1
  store i64 %flvar_145, i64* %flvar_147
  %flvar_148 = bitcast i64* %arg to i64*
  %flvar_149 = ptrtoint i64* %flvar_148 to i64
  %flvar_150 = getelementptr i64, i64* %flvar_131, i64 2
  store i64 %flvar_149, i64* %flvar_150
  ret i64* %flvar_131
}
define i64* @flrtn_8(i64* %fun, i64* %arg) {
  %flvar_156 = bitcast i64* %arg to i64*
  br label %fllab_20
fllab_20:
  %flvar_159 = getelementptr i64, i64* %flvar_156, i64 0
  %flvar_160 = load i64, i64* %flvar_159
  %flvar_161 = icmp eq i64 %flvar_160, 1
  br i1 %flvar_161, label %fllab_22, label %fllab_21
fllab_22:
  %flvar_157 = call i64* @malloc(i64 16)
  %flvar_162 = getelementptr i64, i64* %flvar_157, i64 0
  store i64 0, i64* %flvar_162
  br label %fllab_19
fllab_21:
  %flvar_163 = getelementptr i64, i64* %flvar_156, i64 0
  %flvar_164 = load i64, i64* %flvar_163
  %flvar_165 = icmp eq i64 %flvar_164, 0
  br i1 %flvar_165, label %fllab_23, label %fllab_18
fllab_23:
  %flvar_158 = call i64* @malloc(i64 16)
  %flvar_166 = getelementptr i64, i64* %flvar_158, i64 0
  store i64 1, i64* %flvar_166
  br label %fllab_19
fllab_18:
  unreachable
fllab_19:
  %flvar_155 = phi i64* [%flvar_157, %fllab_22], [%flvar_158, %fllab_23]
  ret i64* %flvar_155
}
define i32 @main() {
  %flvar_0 = call i64* @malloc(i64 16)
  %flvar_83 = getelementptr i64, i64* %flvar_0, i64 0
  store i64 3, i64* %flvar_83
  %flvar_82 = ptrtoint i64* (i64*, i64*)* @flrtn_0 to i64
  %flvar_84 = getelementptr i64, i64* %flvar_0, i64 1
  store i64 %flvar_82, i64* %flvar_84
  store i64* %flvar_0, i64** @flglobal_test
  %flvar_85 = call i64* @malloc(i64 16)
  %flvar_104 = getelementptr i64, i64* %flvar_85, i64 0
  store i64 3, i64* %flvar_104
  %flvar_103 = ptrtoint i64* (i64*, i64*)* @flrtn_3 to i64
  %flvar_105 = getelementptr i64, i64* %flvar_85, i64 1
  store i64 %flvar_103, i64* %flvar_105
  store i64* %flvar_85, i64** @flglobal_pb
  %flvar_106 = call i64* @malloc(i64 16)
  %flvar_128 = getelementptr i64, i64* %flvar_106, i64 0
  store i64 3, i64* %flvar_128
  %flvar_127 = ptrtoint i64* (i64*, i64*)* @flrtn_4 to i64
  %flvar_129 = getelementptr i64, i64* %flvar_106, i64 1
  store i64 %flvar_127, i64* %flvar_129
  store i64* %flvar_106, i64** @flglobal_and
  %flvar_130 = call i64* @malloc(i64 16)
  %flvar_152 = getelementptr i64, i64* %flvar_130, i64 0
  store i64 3, i64* %flvar_152
  %flvar_151 = ptrtoint i64* (i64*, i64*)* @flrtn_6 to i64
  %flvar_153 = getelementptr i64, i64* %flvar_130, i64 1
  store i64 %flvar_151, i64* %flvar_153
  store i64* %flvar_130, i64** @flglobal_or
  %flvar_154 = call i64* @malloc(i64 16)
  %flvar_168 = getelementptr i64, i64* %flvar_154, i64 0
  store i64 3, i64* %flvar_168
  %flvar_167 = ptrtoint i64* (i64*, i64*)* @flrtn_8 to i64
  %flvar_169 = getelementptr i64, i64* %flvar_154, i64 1
  store i64 %flvar_167, i64* %flvar_169
  store i64* %flvar_154, i64** @flglobal_not
  %flvar_182 = load i64*, i64** @flglobal_test
  %flvar_183 = call i64* @malloc(i64 16)
  %flvar_187 = getelementptr i64, i64* %flvar_183, i64 0
  store i64 4, i64* %flvar_187
  %flvar_188 = getelementptr i64, i64* %flvar_183, i64 1
  store i64 0, i64* %flvar_188
  %flvar_184 = getelementptr i64, i64* %flvar_182, i64 1
  %flvar_185 = load i64, i64* %flvar_184
  %flvar_186 = inttoptr i64 %flvar_185 to i64* (i64*, i64*)*
  %flvar_177 = call i64* %flvar_186(i64* %flvar_182, i64* %flvar_183)
  %flvar_178 = load i64*, i64** @flglobal_pb
  %flvar_179 = getelementptr i64, i64* %flvar_177, i64 1
  %flvar_180 = load i64, i64* %flvar_179
  %flvar_181 = inttoptr i64 %flvar_180 to i64* (i64*, i64*)*
  %flvar_172 = call i64* %flvar_181(i64* %flvar_177, i64* %flvar_178)
  %flvar_194 = load i64*, i64** @flglobal_and
  %flvar_195 = call i64* @malloc(i64 16)
  %flvar_199 = getelementptr i64, i64* %flvar_195, i64 0
  store i64 1, i64* %flvar_199
  %flvar_196 = getelementptr i64, i64* %flvar_194, i64 1
  %flvar_197 = load i64, i64* %flvar_196
  %flvar_198 = inttoptr i64 %flvar_197 to i64* (i64*, i64*)*
  %flvar_189 = call i64* %flvar_198(i64* %flvar_194, i64* %flvar_195)
  %flvar_190 = call i64* @malloc(i64 16)
  %flvar_200 = getelementptr i64, i64* %flvar_190, i64 0
  store i64 1, i64* %flvar_200
  %flvar_191 = getelementptr i64, i64* %flvar_189, i64 1
  %flvar_192 = load i64, i64* %flvar_191
  %flvar_193 = inttoptr i64 %flvar_192 to i64* (i64*, i64*)*
  %flvar_173 = call i64* %flvar_193(i64* %flvar_189, i64* %flvar_190)
  %flvar_174 = getelementptr i64, i64* %flvar_172, i64 1
  %flvar_175 = load i64, i64* %flvar_174
  %flvar_176 = inttoptr i64 %flvar_175 to i64* (i64*, i64*)*
  %flvar_171 = call i64* %flvar_176(i64* %flvar_172, i64* %flvar_173)
  %flvar_212 = load i64*, i64** @flglobal_test
  %flvar_213 = call i64* @malloc(i64 16)
  %flvar_217 = getelementptr i64, i64* %flvar_213, i64 0
  store i64 4, i64* %flvar_217
  %flvar_218 = getelementptr i64, i64* %flvar_213, i64 1
  store i64 1, i64* %flvar_218
  %flvar_214 = getelementptr i64, i64* %flvar_212, i64 1
  %flvar_215 = load i64, i64* %flvar_214
  %flvar_216 = inttoptr i64 %flvar_215 to i64* (i64*, i64*)*
  %flvar_207 = call i64* %flvar_216(i64* %flvar_212, i64* %flvar_213)
  %flvar_208 = load i64*, i64** @flglobal_pb
  %flvar_209 = getelementptr i64, i64* %flvar_207, i64 1
  %flvar_210 = load i64, i64* %flvar_209
  %flvar_211 = inttoptr i64 %flvar_210 to i64* (i64*, i64*)*
  %flvar_202 = call i64* %flvar_211(i64* %flvar_207, i64* %flvar_208)
  %flvar_224 = load i64*, i64** @flglobal_and
  %flvar_225 = call i64* @malloc(i64 16)
  %flvar_229 = getelementptr i64, i64* %flvar_225, i64 0
  store i64 1, i64* %flvar_229
  %flvar_226 = getelementptr i64, i64* %flvar_224, i64 1
  %flvar_227 = load i64, i64* %flvar_226
  %flvar_228 = inttoptr i64 %flvar_227 to i64* (i64*, i64*)*
  %flvar_219 = call i64* %flvar_228(i64* %flvar_224, i64* %flvar_225)
  %flvar_220 = call i64* @malloc(i64 16)
  %flvar_230 = getelementptr i64, i64* %flvar_220, i64 0
  store i64 0, i64* %flvar_230
  %flvar_221 = getelementptr i64, i64* %flvar_219, i64 1
  %flvar_222 = load i64, i64* %flvar_221
  %flvar_223 = inttoptr i64 %flvar_222 to i64* (i64*, i64*)*
  %flvar_203 = call i64* %flvar_223(i64* %flvar_219, i64* %flvar_220)
  %flvar_204 = getelementptr i64, i64* %flvar_202, i64 1
  %flvar_205 = load i64, i64* %flvar_204
  %flvar_206 = inttoptr i64 %flvar_205 to i64* (i64*, i64*)*
  %flvar_201 = call i64* %flvar_206(i64* %flvar_202, i64* %flvar_203)
  %flvar_242 = load i64*, i64** @flglobal_test
  %flvar_243 = call i64* @malloc(i64 16)
  %flvar_247 = getelementptr i64, i64* %flvar_243, i64 0
  store i64 4, i64* %flvar_247
  %flvar_248 = getelementptr i64, i64* %flvar_243, i64 1
  store i64 2, i64* %flvar_248
  %flvar_244 = getelementptr i64, i64* %flvar_242, i64 1
  %flvar_245 = load i64, i64* %flvar_244
  %flvar_246 = inttoptr i64 %flvar_245 to i64* (i64*, i64*)*
  %flvar_237 = call i64* %flvar_246(i64* %flvar_242, i64* %flvar_243)
  %flvar_238 = load i64*, i64** @flglobal_pb
  %flvar_239 = getelementptr i64, i64* %flvar_237, i64 1
  %flvar_240 = load i64, i64* %flvar_239
  %flvar_241 = inttoptr i64 %flvar_240 to i64* (i64*, i64*)*
  %flvar_232 = call i64* %flvar_241(i64* %flvar_237, i64* %flvar_238)
  %flvar_254 = load i64*, i64** @flglobal_and
  %flvar_255 = call i64* @malloc(i64 16)
  %flvar_259 = getelementptr i64, i64* %flvar_255, i64 0
  store i64 0, i64* %flvar_259
  %flvar_256 = getelementptr i64, i64* %flvar_254, i64 1
  %flvar_257 = load i64, i64* %flvar_256
  %flvar_258 = inttoptr i64 %flvar_257 to i64* (i64*, i64*)*
  %flvar_249 = call i64* %flvar_258(i64* %flvar_254, i64* %flvar_255)
  %flvar_250 = call i64* @malloc(i64 16)
  %flvar_260 = getelementptr i64, i64* %flvar_250, i64 0
  store i64 1, i64* %flvar_260
  %flvar_251 = getelementptr i64, i64* %flvar_249, i64 1
  %flvar_252 = load i64, i64* %flvar_251
  %flvar_253 = inttoptr i64 %flvar_252 to i64* (i64*, i64*)*
  %flvar_233 = call i64* %flvar_253(i64* %flvar_249, i64* %flvar_250)
  %flvar_234 = getelementptr i64, i64* %flvar_232, i64 1
  %flvar_235 = load i64, i64* %flvar_234
  %flvar_236 = inttoptr i64 %flvar_235 to i64* (i64*, i64*)*
  %flvar_231 = call i64* %flvar_236(i64* %flvar_232, i64* %flvar_233)
  %flvar_272 = load i64*, i64** @flglobal_test
  %flvar_273 = call i64* @malloc(i64 16)
  %flvar_277 = getelementptr i64, i64* %flvar_273, i64 0
  store i64 4, i64* %flvar_277
  %flvar_278 = getelementptr i64, i64* %flvar_273, i64 1
  store i64 3, i64* %flvar_278
  %flvar_274 = getelementptr i64, i64* %flvar_272, i64 1
  %flvar_275 = load i64, i64* %flvar_274
  %flvar_276 = inttoptr i64 %flvar_275 to i64* (i64*, i64*)*
  %flvar_267 = call i64* %flvar_276(i64* %flvar_272, i64* %flvar_273)
  %flvar_268 = load i64*, i64** @flglobal_pb
  %flvar_269 = getelementptr i64, i64* %flvar_267, i64 1
  %flvar_270 = load i64, i64* %flvar_269
  %flvar_271 = inttoptr i64 %flvar_270 to i64* (i64*, i64*)*
  %flvar_262 = call i64* %flvar_271(i64* %flvar_267, i64* %flvar_268)
  %flvar_284 = load i64*, i64** @flglobal_and
  %flvar_285 = call i64* @malloc(i64 16)
  %flvar_289 = getelementptr i64, i64* %flvar_285, i64 0
  store i64 0, i64* %flvar_289
  %flvar_286 = getelementptr i64, i64* %flvar_284, i64 1
  %flvar_287 = load i64, i64* %flvar_286
  %flvar_288 = inttoptr i64 %flvar_287 to i64* (i64*, i64*)*
  %flvar_279 = call i64* %flvar_288(i64* %flvar_284, i64* %flvar_285)
  %flvar_280 = call i64* @malloc(i64 16)
  %flvar_290 = getelementptr i64, i64* %flvar_280, i64 0
  store i64 0, i64* %flvar_290
  %flvar_281 = getelementptr i64, i64* %flvar_279, i64 1
  %flvar_282 = load i64, i64* %flvar_281
  %flvar_283 = inttoptr i64 %flvar_282 to i64* (i64*, i64*)*
  %flvar_263 = call i64* %flvar_283(i64* %flvar_279, i64* %flvar_280)
  %flvar_264 = getelementptr i64, i64* %flvar_262, i64 1
  %flvar_265 = load i64, i64* %flvar_264
  %flvar_266 = inttoptr i64 %flvar_265 to i64* (i64*, i64*)*
  %flvar_261 = call i64* %flvar_266(i64* %flvar_262, i64* %flvar_263)
  %flvar_302 = load i64*, i64** @flglobal_test
  %flvar_303 = call i64* @malloc(i64 16)
  %flvar_307 = getelementptr i64, i64* %flvar_303, i64 0
  store i64 4, i64* %flvar_307
  %flvar_308 = getelementptr i64, i64* %flvar_303, i64 1
  store i64 4, i64* %flvar_308
  %flvar_304 = getelementptr i64, i64* %flvar_302, i64 1
  %flvar_305 = load i64, i64* %flvar_304
  %flvar_306 = inttoptr i64 %flvar_305 to i64* (i64*, i64*)*
  %flvar_297 = call i64* %flvar_306(i64* %flvar_302, i64* %flvar_303)
  %flvar_298 = load i64*, i64** @flglobal_pb
  %flvar_299 = getelementptr i64, i64* %flvar_297, i64 1
  %flvar_300 = load i64, i64* %flvar_299
  %flvar_301 = inttoptr i64 %flvar_300 to i64* (i64*, i64*)*
  %flvar_292 = call i64* %flvar_301(i64* %flvar_297, i64* %flvar_298)
  %flvar_314 = load i64*, i64** @flglobal_or
  %flvar_315 = call i64* @malloc(i64 16)
  %flvar_319 = getelementptr i64, i64* %flvar_315, i64 0
  store i64 1, i64* %flvar_319
  %flvar_316 = getelementptr i64, i64* %flvar_314, i64 1
  %flvar_317 = load i64, i64* %flvar_316
  %flvar_318 = inttoptr i64 %flvar_317 to i64* (i64*, i64*)*
  %flvar_309 = call i64* %flvar_318(i64* %flvar_314, i64* %flvar_315)
  %flvar_310 = call i64* @malloc(i64 16)
  %flvar_320 = getelementptr i64, i64* %flvar_310, i64 0
  store i64 1, i64* %flvar_320
  %flvar_311 = getelementptr i64, i64* %flvar_309, i64 1
  %flvar_312 = load i64, i64* %flvar_311
  %flvar_313 = inttoptr i64 %flvar_312 to i64* (i64*, i64*)*
  %flvar_293 = call i64* %flvar_313(i64* %flvar_309, i64* %flvar_310)
  %flvar_294 = getelementptr i64, i64* %flvar_292, i64 1
  %flvar_295 = load i64, i64* %flvar_294
  %flvar_296 = inttoptr i64 %flvar_295 to i64* (i64*, i64*)*
  %flvar_291 = call i64* %flvar_296(i64* %flvar_292, i64* %flvar_293)
  %flvar_332 = load i64*, i64** @flglobal_test
  %flvar_333 = call i64* @malloc(i64 16)
  %flvar_337 = getelementptr i64, i64* %flvar_333, i64 0
  store i64 4, i64* %flvar_337
  %flvar_338 = getelementptr i64, i64* %flvar_333, i64 1
  store i64 5, i64* %flvar_338
  %flvar_334 = getelementptr i64, i64* %flvar_332, i64 1
  %flvar_335 = load i64, i64* %flvar_334
  %flvar_336 = inttoptr i64 %flvar_335 to i64* (i64*, i64*)*
  %flvar_327 = call i64* %flvar_336(i64* %flvar_332, i64* %flvar_333)
  %flvar_328 = load i64*, i64** @flglobal_pb
  %flvar_329 = getelementptr i64, i64* %flvar_327, i64 1
  %flvar_330 = load i64, i64* %flvar_329
  %flvar_331 = inttoptr i64 %flvar_330 to i64* (i64*, i64*)*
  %flvar_322 = call i64* %flvar_331(i64* %flvar_327, i64* %flvar_328)
  %flvar_344 = load i64*, i64** @flglobal_or
  %flvar_345 = call i64* @malloc(i64 16)
  %flvar_349 = getelementptr i64, i64* %flvar_345, i64 0
  store i64 1, i64* %flvar_349
  %flvar_346 = getelementptr i64, i64* %flvar_344, i64 1
  %flvar_347 = load i64, i64* %flvar_346
  %flvar_348 = inttoptr i64 %flvar_347 to i64* (i64*, i64*)*
  %flvar_339 = call i64* %flvar_348(i64* %flvar_344, i64* %flvar_345)
  %flvar_340 = call i64* @malloc(i64 16)
  %flvar_350 = getelementptr i64, i64* %flvar_340, i64 0
  store i64 0, i64* %flvar_350
  %flvar_341 = getelementptr i64, i64* %flvar_339, i64 1
  %flvar_342 = load i64, i64* %flvar_341
  %flvar_343 = inttoptr i64 %flvar_342 to i64* (i64*, i64*)*
  %flvar_323 = call i64* %flvar_343(i64* %flvar_339, i64* %flvar_340)
  %flvar_324 = getelementptr i64, i64* %flvar_322, i64 1
  %flvar_325 = load i64, i64* %flvar_324
  %flvar_326 = inttoptr i64 %flvar_325 to i64* (i64*, i64*)*
  %flvar_321 = call i64* %flvar_326(i64* %flvar_322, i64* %flvar_323)
  %flvar_362 = load i64*, i64** @flglobal_test
  %flvar_363 = call i64* @malloc(i64 16)
  %flvar_367 = getelementptr i64, i64* %flvar_363, i64 0
  store i64 4, i64* %flvar_367
  %flvar_368 = getelementptr i64, i64* %flvar_363, i64 1
  store i64 6, i64* %flvar_368
  %flvar_364 = getelementptr i64, i64* %flvar_362, i64 1
  %flvar_365 = load i64, i64* %flvar_364
  %flvar_366 = inttoptr i64 %flvar_365 to i64* (i64*, i64*)*
  %flvar_357 = call i64* %flvar_366(i64* %flvar_362, i64* %flvar_363)
  %flvar_358 = load i64*, i64** @flglobal_pb
  %flvar_359 = getelementptr i64, i64* %flvar_357, i64 1
  %flvar_360 = load i64, i64* %flvar_359
  %flvar_361 = inttoptr i64 %flvar_360 to i64* (i64*, i64*)*
  %flvar_352 = call i64* %flvar_361(i64* %flvar_357, i64* %flvar_358)
  %flvar_374 = load i64*, i64** @flglobal_or
  %flvar_375 = call i64* @malloc(i64 16)
  %flvar_379 = getelementptr i64, i64* %flvar_375, i64 0
  store i64 0, i64* %flvar_379
  %flvar_376 = getelementptr i64, i64* %flvar_374, i64 1
  %flvar_377 = load i64, i64* %flvar_376
  %flvar_378 = inttoptr i64 %flvar_377 to i64* (i64*, i64*)*
  %flvar_369 = call i64* %flvar_378(i64* %flvar_374, i64* %flvar_375)
  %flvar_370 = call i64* @malloc(i64 16)
  %flvar_380 = getelementptr i64, i64* %flvar_370, i64 0
  store i64 1, i64* %flvar_380
  %flvar_371 = getelementptr i64, i64* %flvar_369, i64 1
  %flvar_372 = load i64, i64* %flvar_371
  %flvar_373 = inttoptr i64 %flvar_372 to i64* (i64*, i64*)*
  %flvar_353 = call i64* %flvar_373(i64* %flvar_369, i64* %flvar_370)
  %flvar_354 = getelementptr i64, i64* %flvar_352, i64 1
  %flvar_355 = load i64, i64* %flvar_354
  %flvar_356 = inttoptr i64 %flvar_355 to i64* (i64*, i64*)*
  %flvar_351 = call i64* %flvar_356(i64* %flvar_352, i64* %flvar_353)
  %flvar_392 = load i64*, i64** @flglobal_test
  %flvar_393 = call i64* @malloc(i64 16)
  %flvar_397 = getelementptr i64, i64* %flvar_393, i64 0
  store i64 4, i64* %flvar_397
  %flvar_398 = getelementptr i64, i64* %flvar_393, i64 1
  store i64 7, i64* %flvar_398
  %flvar_394 = getelementptr i64, i64* %flvar_392, i64 1
  %flvar_395 = load i64, i64* %flvar_394
  %flvar_396 = inttoptr i64 %flvar_395 to i64* (i64*, i64*)*
  %flvar_387 = call i64* %flvar_396(i64* %flvar_392, i64* %flvar_393)
  %flvar_388 = load i64*, i64** @flglobal_pb
  %flvar_389 = getelementptr i64, i64* %flvar_387, i64 1
  %flvar_390 = load i64, i64* %flvar_389
  %flvar_391 = inttoptr i64 %flvar_390 to i64* (i64*, i64*)*
  %flvar_382 = call i64* %flvar_391(i64* %flvar_387, i64* %flvar_388)
  %flvar_404 = load i64*, i64** @flglobal_or
  %flvar_405 = call i64* @malloc(i64 16)
  %flvar_409 = getelementptr i64, i64* %flvar_405, i64 0
  store i64 0, i64* %flvar_409
  %flvar_406 = getelementptr i64, i64* %flvar_404, i64 1
  %flvar_407 = load i64, i64* %flvar_406
  %flvar_408 = inttoptr i64 %flvar_407 to i64* (i64*, i64*)*
  %flvar_399 = call i64* %flvar_408(i64* %flvar_404, i64* %flvar_405)
  %flvar_400 = call i64* @malloc(i64 16)
  %flvar_410 = getelementptr i64, i64* %flvar_400, i64 0
  store i64 0, i64* %flvar_410
  %flvar_401 = getelementptr i64, i64* %flvar_399, i64 1
  %flvar_402 = load i64, i64* %flvar_401
  %flvar_403 = inttoptr i64 %flvar_402 to i64* (i64*, i64*)*
  %flvar_383 = call i64* %flvar_403(i64* %flvar_399, i64* %flvar_400)
  %flvar_384 = getelementptr i64, i64* %flvar_382, i64 1
  %flvar_385 = load i64, i64* %flvar_384
  %flvar_386 = inttoptr i64 %flvar_385 to i64* (i64*, i64*)*
  %flvar_381 = call i64* %flvar_386(i64* %flvar_382, i64* %flvar_383)
  %flvar_422 = load i64*, i64** @flglobal_test
  %flvar_423 = call i64* @malloc(i64 16)
  %flvar_427 = getelementptr i64, i64* %flvar_423, i64 0
  store i64 4, i64* %flvar_427
  %flvar_428 = getelementptr i64, i64* %flvar_423, i64 1
  store i64 8, i64* %flvar_428
  %flvar_424 = getelementptr i64, i64* %flvar_422, i64 1
  %flvar_425 = load i64, i64* %flvar_424
  %flvar_426 = inttoptr i64 %flvar_425 to i64* (i64*, i64*)*
  %flvar_417 = call i64* %flvar_426(i64* %flvar_422, i64* %flvar_423)
  %flvar_418 = load i64*, i64** @flglobal_pb
  %flvar_419 = getelementptr i64, i64* %flvar_417, i64 1
  %flvar_420 = load i64, i64* %flvar_419
  %flvar_421 = inttoptr i64 %flvar_420 to i64* (i64*, i64*)*
  %flvar_412 = call i64* %flvar_421(i64* %flvar_417, i64* %flvar_418)
  %flvar_429 = load i64*, i64** @flglobal_not
  %flvar_430 = call i64* @malloc(i64 16)
  %flvar_434 = getelementptr i64, i64* %flvar_430, i64 0
  store i64 1, i64* %flvar_434
  %flvar_431 = getelementptr i64, i64* %flvar_429, i64 1
  %flvar_432 = load i64, i64* %flvar_431
  %flvar_433 = inttoptr i64 %flvar_432 to i64* (i64*, i64*)*
  %flvar_413 = call i64* %flvar_433(i64* %flvar_429, i64* %flvar_430)
  %flvar_414 = getelementptr i64, i64* %flvar_412, i64 1
  %flvar_415 = load i64, i64* %flvar_414
  %flvar_416 = inttoptr i64 %flvar_415 to i64* (i64*, i64*)*
  %flvar_411 = call i64* %flvar_416(i64* %flvar_412, i64* %flvar_413)
  %flvar_445 = load i64*, i64** @flglobal_test
  %flvar_446 = call i64* @malloc(i64 16)
  %flvar_450 = getelementptr i64, i64* %flvar_446, i64 0
  store i64 4, i64* %flvar_450
  %flvar_451 = getelementptr i64, i64* %flvar_446, i64 1
  store i64 9, i64* %flvar_451
  %flvar_447 = getelementptr i64, i64* %flvar_445, i64 1
  %flvar_448 = load i64, i64* %flvar_447
  %flvar_449 = inttoptr i64 %flvar_448 to i64* (i64*, i64*)*
  %flvar_440 = call i64* %flvar_449(i64* %flvar_445, i64* %flvar_446)
  %flvar_441 = load i64*, i64** @flglobal_pb
  %flvar_442 = getelementptr i64, i64* %flvar_440, i64 1
  %flvar_443 = load i64, i64* %flvar_442
  %flvar_444 = inttoptr i64 %flvar_443 to i64* (i64*, i64*)*
  %flvar_435 = call i64* %flvar_444(i64* %flvar_440, i64* %flvar_441)
  %flvar_452 = load i64*, i64** @flglobal_not
  %flvar_453 = call i64* @malloc(i64 16)
  %flvar_457 = getelementptr i64, i64* %flvar_453, i64 0
  store i64 0, i64* %flvar_457
  %flvar_454 = getelementptr i64, i64* %flvar_452, i64 1
  %flvar_455 = load i64, i64* %flvar_454
  %flvar_456 = inttoptr i64 %flvar_455 to i64* (i64*, i64*)*
  %flvar_436 = call i64* %flvar_456(i64* %flvar_452, i64* %flvar_453)
  %flvar_437 = getelementptr i64, i64* %flvar_435, i64 1
  %flvar_438 = load i64, i64* %flvar_437
  %flvar_439 = inttoptr i64 %flvar_438 to i64* (i64*, i64*)*
  %flvar_170 = call i64* %flvar_439(i64* %flvar_435, i64* %flvar_436)
  store i64* %flvar_170, i64** @flglobal_main
  ret i32 0
}

