@fmtlli = private unnamed_addr constant [5 x i8] c"%lli\00"
declare i32 @putchar(i32)
declare i32 @printf(i8* noalias nocapture, ...) nounwind
declare i64* @malloc(i64)
@flglobal_print = global i64* null
@flglobal_println = global i64* null
@flglobal_main = global i64* null
define i64* @flrtn_0(i64* %fun, i64* %arg) {
  %flvar_2 = bitcast i64* %arg to i64*
  br label %fllab_2
fllab_2:
  %flvar_8 = getelementptr i64, i64* %flvar_2, i64 0
  %flvar_9 = load i64, i64* %flvar_8
  %flvar_10 = icmp eq i64 %flvar_9, 4
  br i1 %flvar_10, label %fllab_7, label %fllab_3
fllab_7:
  %flvar_3 = bitcast i64* %arg to i64*
  %flvar_11 = getelementptr [5 x i8], [5 x i8]* @fmtlli, i64 0, i64 0
  %flvar_12 = getelementptr i64, i64* %flvar_3, i64 1
  %flvar_13 = load i64, i64* %flvar_12
  call i32 (i8*, ...) @printf(i8* %flvar_11, i64 %flvar_13)
  br label %fllab_1
fllab_3:
  %flvar_14 = getelementptr i64, i64* %flvar_2, i64 0
  %flvar_15 = load i64, i64* %flvar_14
  %flvar_16 = icmp eq i64 %flvar_15, 5
  br i1 %flvar_16, label %fllab_8, label %fllab_4
fllab_8:
  %flvar_4 = bitcast i64* %arg to i64*
  %flvar_17 = getelementptr i64, i64* %flvar_4, i64 1
  %flvar_18 = load i64, i64* %flvar_17
  %flvar_19 = trunc i64 %flvar_18 to i32
  call i32 @putchar(i32 %flvar_19)
  br label %fllab_1
fllab_4:
  %flvar_20 = getelementptr i64, i64* %flvar_2, i64 0
  %flvar_21 = load i64, i64* %flvar_20
  %flvar_22 = icmp eq i64 %flvar_21, 1
  br i1 %flvar_22, label %fllab_9, label %fllab_5
fllab_9:
  %flvar_23 = call i64* @malloc(i64 16)
  %flvar_27 = getelementptr i64, i64* %flvar_23, i64 0
  store i64 5, i64* %flvar_27
  %flvar_28 = getelementptr i64, i64* %flvar_23, i64 1
  store i64 84, i64* %flvar_28
  %flvar_24 = getelementptr i64, i64* %flvar_23, i64 1
  %flvar_25 = load i64, i64* %flvar_24
  %flvar_26 = trunc i64 %flvar_25 to i32
  call i32 @putchar(i32 %flvar_26)
  %flvar_29 = call i64* @malloc(i64 16)
  %flvar_33 = getelementptr i64, i64* %flvar_29, i64 0
  store i64 5, i64* %flvar_33
  %flvar_34 = getelementptr i64, i64* %flvar_29, i64 1
  store i64 114, i64* %flvar_34
  %flvar_30 = getelementptr i64, i64* %flvar_29, i64 1
  %flvar_31 = load i64, i64* %flvar_30
  %flvar_32 = trunc i64 %flvar_31 to i32
  call i32 @putchar(i32 %flvar_32)
  %flvar_35 = call i64* @malloc(i64 16)
  %flvar_39 = getelementptr i64, i64* %flvar_35, i64 0
  store i64 5, i64* %flvar_39
  %flvar_40 = getelementptr i64, i64* %flvar_35, i64 1
  store i64 117, i64* %flvar_40
  %flvar_36 = getelementptr i64, i64* %flvar_35, i64 1
  %flvar_37 = load i64, i64* %flvar_36
  %flvar_38 = trunc i64 %flvar_37 to i32
  call i32 @putchar(i32 %flvar_38)
  %flvar_5 = call i64* @malloc(i64 16)
  %flvar_44 = getelementptr i64, i64* %flvar_5, i64 0
  store i64 5, i64* %flvar_44
  %flvar_45 = getelementptr i64, i64* %flvar_5, i64 1
  store i64 101, i64* %flvar_45
  %flvar_41 = getelementptr i64, i64* %flvar_5, i64 1
  %flvar_42 = load i64, i64* %flvar_41
  %flvar_43 = trunc i64 %flvar_42 to i32
  call i32 @putchar(i32 %flvar_43)
  br label %fllab_1
fllab_5:
  %flvar_46 = getelementptr i64, i64* %flvar_2, i64 0
  %flvar_47 = load i64, i64* %flvar_46
  %flvar_48 = icmp eq i64 %flvar_47, 0
  br i1 %flvar_48, label %fllab_10, label %fllab_6
fllab_10:
  %flvar_49 = call i64* @malloc(i64 16)
  %flvar_53 = getelementptr i64, i64* %flvar_49, i64 0
  store i64 5, i64* %flvar_53
  %flvar_54 = getelementptr i64, i64* %flvar_49, i64 1
  store i64 70, i64* %flvar_54
  %flvar_50 = getelementptr i64, i64* %flvar_49, i64 1
  %flvar_51 = load i64, i64* %flvar_50
  %flvar_52 = trunc i64 %flvar_51 to i32
  call i32 @putchar(i32 %flvar_52)
  %flvar_55 = call i64* @malloc(i64 16)
  %flvar_59 = getelementptr i64, i64* %flvar_55, i64 0
  store i64 5, i64* %flvar_59
  %flvar_60 = getelementptr i64, i64* %flvar_55, i64 1
  store i64 97, i64* %flvar_60
  %flvar_56 = getelementptr i64, i64* %flvar_55, i64 1
  %flvar_57 = load i64, i64* %flvar_56
  %flvar_58 = trunc i64 %flvar_57 to i32
  call i32 @putchar(i32 %flvar_58)
  %flvar_61 = call i64* @malloc(i64 16)
  %flvar_65 = getelementptr i64, i64* %flvar_61, i64 0
  store i64 5, i64* %flvar_65
  %flvar_66 = getelementptr i64, i64* %flvar_61, i64 1
  store i64 108, i64* %flvar_66
  %flvar_62 = getelementptr i64, i64* %flvar_61, i64 1
  %flvar_63 = load i64, i64* %flvar_62
  %flvar_64 = trunc i64 %flvar_63 to i32
  call i32 @putchar(i32 %flvar_64)
  %flvar_67 = call i64* @malloc(i64 16)
  %flvar_71 = getelementptr i64, i64* %flvar_67, i64 0
  store i64 5, i64* %flvar_71
  %flvar_72 = getelementptr i64, i64* %flvar_67, i64 1
  store i64 115, i64* %flvar_72
  %flvar_68 = getelementptr i64, i64* %flvar_67, i64 1
  %flvar_69 = load i64, i64* %flvar_68
  %flvar_70 = trunc i64 %flvar_69 to i32
  call i32 @putchar(i32 %flvar_70)
  %flvar_6 = call i64* @malloc(i64 16)
  %flvar_76 = getelementptr i64, i64* %flvar_6, i64 0
  store i64 5, i64* %flvar_76
  %flvar_77 = getelementptr i64, i64* %flvar_6, i64 1
  store i64 101, i64* %flvar_77
  %flvar_73 = getelementptr i64, i64* %flvar_6, i64 1
  %flvar_74 = load i64, i64* %flvar_73
  %flvar_75 = trunc i64 %flvar_74 to i32
  call i32 @putchar(i32 %flvar_75)
  br label %fllab_1
fllab_6:
  %flvar_78 = getelementptr i64, i64* %flvar_2, i64 0
  %flvar_79 = load i64, i64* %flvar_78
  %flvar_80 = icmp eq i64 %flvar_79, 3
  br i1 %flvar_80, label %fllab_11, label %fllab_0
fllab_11:
  %flvar_81 = call i64* @malloc(i64 16)
  %flvar_85 = getelementptr i64, i64* %flvar_81, i64 0
  store i64 5, i64* %flvar_85
  %flvar_86 = getelementptr i64, i64* %flvar_81, i64 1
  store i64 60, i64* %flvar_86
  %flvar_82 = getelementptr i64, i64* %flvar_81, i64 1
  %flvar_83 = load i64, i64* %flvar_82
  %flvar_84 = trunc i64 %flvar_83 to i32
  call i32 @putchar(i32 %flvar_84)
  %flvar_87 = call i64* @malloc(i64 16)
  %flvar_91 = getelementptr i64, i64* %flvar_87, i64 0
  store i64 5, i64* %flvar_91
  %flvar_92 = getelementptr i64, i64* %flvar_87, i64 1
  store i64 102, i64* %flvar_92
  %flvar_88 = getelementptr i64, i64* %flvar_87, i64 1
  %flvar_89 = load i64, i64* %flvar_88
  %flvar_90 = trunc i64 %flvar_89 to i32
  call i32 @putchar(i32 %flvar_90)
  %flvar_93 = call i64* @malloc(i64 16)
  %flvar_97 = getelementptr i64, i64* %flvar_93, i64 0
  store i64 5, i64* %flvar_97
  %flvar_98 = getelementptr i64, i64* %flvar_93, i64 1
  store i64 117, i64* %flvar_98
  %flvar_94 = getelementptr i64, i64* %flvar_93, i64 1
  %flvar_95 = load i64, i64* %flvar_94
  %flvar_96 = trunc i64 %flvar_95 to i32
  call i32 @putchar(i32 %flvar_96)
  %flvar_99 = call i64* @malloc(i64 16)
  %flvar_103 = getelementptr i64, i64* %flvar_99, i64 0
  store i64 5, i64* %flvar_103
  %flvar_104 = getelementptr i64, i64* %flvar_99, i64 1
  store i64 110, i64* %flvar_104
  %flvar_100 = getelementptr i64, i64* %flvar_99, i64 1
  %flvar_101 = load i64, i64* %flvar_100
  %flvar_102 = trunc i64 %flvar_101 to i32
  call i32 @putchar(i32 %flvar_102)
  %flvar_7 = call i64* @malloc(i64 16)
  %flvar_108 = getelementptr i64, i64* %flvar_7, i64 0
  store i64 5, i64* %flvar_108
  %flvar_109 = getelementptr i64, i64* %flvar_7, i64 1
  store i64 62, i64* %flvar_109
  %flvar_105 = getelementptr i64, i64* %flvar_7, i64 1
  %flvar_106 = load i64, i64* %flvar_105
  %flvar_107 = trunc i64 %flvar_106 to i32
  call i32 @putchar(i32 %flvar_107)
  br label %fllab_1
fllab_0:
  unreachable
fllab_1:
  %flvar_1 = phi i64* [%flvar_3, %fllab_7], [%flvar_4, %fllab_8], [%flvar_5, %fllab_9], [%flvar_6, %fllab_10], [%flvar_7, %fllab_11]
  ret i64* %flvar_1
}
define i64* @flrtn_1(i64* %fun, i64* %arg) {
  %flvar_116 = load i64*, i64** @flglobal_print
  %flvar_117 = bitcast i64* %arg to i64*
  %flvar_118 = getelementptr i64, i64* %flvar_116, i64 1
  %flvar_119 = load i64, i64* %flvar_118
  %flvar_120 = inttoptr i64 %flvar_119 to i64* (i64*, i64*)*
  %flvar_115 = call i64* %flvar_120(i64* %flvar_116, i64* %flvar_117)
  %flvar_121 = load i64*, i64** @flglobal_print
  %flvar_122 = call i64* @malloc(i64 16)
  %flvar_126 = getelementptr i64, i64* %flvar_122, i64 0
  store i64 5, i64* %flvar_126
  %flvar_127 = getelementptr i64, i64* %flvar_122, i64 1
  store i64 10, i64* %flvar_127
  %flvar_123 = getelementptr i64, i64* %flvar_121, i64 1
  %flvar_124 = load i64, i64* %flvar_123
  %flvar_125 = inttoptr i64 %flvar_124 to i64* (i64*, i64*)*
  %flvar_114 = call i64* %flvar_125(i64* %flvar_121, i64* %flvar_122)
  ret i64* %flvar_114
}
define i64* @flrtn_3(i64* %fun, i64* %arg) {
  %flvar_188 = getelementptr i64, i64* %fun, i64 2
  %flvar_189 = load i64, i64* %flvar_188
  %flvar_187 = inttoptr i64 %flvar_189 to i64*
  ret i64* %flvar_187
}
define i64* @flrtn_2(i64* %fun, i64* %arg) {
  %flvar_186 = call i64* @malloc(i64 24)
  %flvar_191 = getelementptr i64, i64* %flvar_186, i64 0
  store i64 3, i64* %flvar_191
  %flvar_190 = ptrtoint i64* (i64*, i64*)* @flrtn_3 to i64
  %flvar_192 = getelementptr i64, i64* %flvar_186, i64 1
  store i64 %flvar_190, i64* %flvar_192
  %flvar_193 = bitcast i64* %arg to i64*
  %flvar_194 = ptrtoint i64* %flvar_193 to i64
  %flvar_195 = getelementptr i64, i64* %flvar_186, i64 2
  store i64 %flvar_194, i64* %flvar_195
  ret i64* %flvar_186
}
define i32 @main() {
  %flvar_0 = call i64* @malloc(i64 16)
  %flvar_111 = getelementptr i64, i64* %flvar_0, i64 0
  store i64 3, i64* %flvar_111
  %flvar_110 = ptrtoint i64* (i64*, i64*)* @flrtn_0 to i64
  %flvar_112 = getelementptr i64, i64* %flvar_0, i64 1
  store i64 %flvar_110, i64* %flvar_112
  store i64* %flvar_0, i64** @flglobal_print
  %flvar_113 = call i64* @malloc(i64 16)
  %flvar_129 = getelementptr i64, i64* %flvar_113, i64 0
  store i64 3, i64* %flvar_129
  %flvar_128 = ptrtoint i64* (i64*, i64*)* @flrtn_1 to i64
  %flvar_130 = getelementptr i64, i64* %flvar_113, i64 1
  store i64 %flvar_128, i64* %flvar_130
  store i64* %flvar_113, i64** @flglobal_println
  %flvar_133 = load i64*, i64** @flglobal_println
  %flvar_134 = call i64* @malloc(i64 16)
  %flvar_138 = getelementptr i64, i64* %flvar_134, i64 0
  store i64 4, i64* %flvar_138
  %flvar_139 = getelementptr i64, i64* %flvar_134, i64 1
  store i64 42, i64* %flvar_139
  %flvar_135 = getelementptr i64, i64* %flvar_133, i64 1
  %flvar_136 = load i64, i64* %flvar_135
  %flvar_137 = inttoptr i64 %flvar_136 to i64* (i64*, i64*)*
  %flvar_132 = call i64* %flvar_137(i64* %flvar_133, i64* %flvar_134)
  %flvar_141 = load i64*, i64** @flglobal_print
  %flvar_142 = call i64* @malloc(i64 16)
  %flvar_146 = getelementptr i64, i64* %flvar_142, i64 0
  store i64 5, i64* %flvar_146
  %flvar_147 = getelementptr i64, i64* %flvar_142, i64 1
  store i64 72, i64* %flvar_147
  %flvar_143 = getelementptr i64, i64* %flvar_141, i64 1
  %flvar_144 = load i64, i64* %flvar_143
  %flvar_145 = inttoptr i64 %flvar_144 to i64* (i64*, i64*)*
  %flvar_140 = call i64* %flvar_145(i64* %flvar_141, i64* %flvar_142)
  %flvar_149 = load i64*, i64** @flglobal_print
  %flvar_150 = call i64* @malloc(i64 16)
  %flvar_154 = getelementptr i64, i64* %flvar_150, i64 0
  store i64 5, i64* %flvar_154
  %flvar_155 = getelementptr i64, i64* %flvar_150, i64 1
  store i64 111, i64* %flvar_155
  %flvar_151 = getelementptr i64, i64* %flvar_149, i64 1
  %flvar_152 = load i64, i64* %flvar_151
  %flvar_153 = inttoptr i64 %flvar_152 to i64* (i64*, i64*)*
  %flvar_148 = call i64* %flvar_153(i64* %flvar_149, i64* %flvar_150)
  %flvar_157 = load i64*, i64** @flglobal_print
  %flvar_158 = call i64* @malloc(i64 16)
  %flvar_162 = getelementptr i64, i64* %flvar_158, i64 0
  store i64 5, i64* %flvar_162
  %flvar_163 = getelementptr i64, i64* %flvar_158, i64 1
  store i64 108, i64* %flvar_163
  %flvar_159 = getelementptr i64, i64* %flvar_157, i64 1
  %flvar_160 = load i64, i64* %flvar_159
  %flvar_161 = inttoptr i64 %flvar_160 to i64* (i64*, i64*)*
  %flvar_156 = call i64* %flvar_161(i64* %flvar_157, i64* %flvar_158)
  %flvar_165 = load i64*, i64** @flglobal_print
  %flvar_166 = call i64* @malloc(i64 16)
  %flvar_170 = getelementptr i64, i64* %flvar_166, i64 0
  store i64 5, i64* %flvar_170
  %flvar_171 = getelementptr i64, i64* %flvar_166, i64 1
  store i64 97, i64* %flvar_171
  %flvar_167 = getelementptr i64, i64* %flvar_165, i64 1
  %flvar_168 = load i64, i64* %flvar_167
  %flvar_169 = inttoptr i64 %flvar_168 to i64* (i64*, i64*)*
  %flvar_164 = call i64* %flvar_169(i64* %flvar_165, i64* %flvar_166)
  %flvar_173 = load i64*, i64** @flglobal_print
  %flvar_174 = call i64* @malloc(i64 16)
  %flvar_178 = getelementptr i64, i64* %flvar_174, i64 0
  store i64 5, i64* %flvar_178
  %flvar_179 = getelementptr i64, i64* %flvar_174, i64 1
  store i64 10, i64* %flvar_179
  %flvar_175 = getelementptr i64, i64* %flvar_173, i64 1
  %flvar_176 = load i64, i64* %flvar_175
  %flvar_177 = inttoptr i64 %flvar_176 to i64* (i64*, i64*)*
  %flvar_172 = call i64* %flvar_177(i64* %flvar_173, i64* %flvar_174)
  %flvar_181 = load i64*, i64** @flglobal_println
  %flvar_182 = call i64* @malloc(i64 16)
  %flvar_197 = getelementptr i64, i64* %flvar_182, i64 0
  store i64 3, i64* %flvar_197
  %flvar_196 = ptrtoint i64* (i64*, i64*)* @flrtn_2 to i64
  %flvar_198 = getelementptr i64, i64* %flvar_182, i64 1
  store i64 %flvar_196, i64* %flvar_198
  %flvar_183 = getelementptr i64, i64* %flvar_181, i64 1
  %flvar_184 = load i64, i64* %flvar_183
  %flvar_185 = inttoptr i64 %flvar_184 to i64* (i64*, i64*)*
  %flvar_180 = call i64* %flvar_185(i64* %flvar_181, i64* %flvar_182)
  %flvar_200 = load i64*, i64** @flglobal_println
  %flvar_201 = call i64* @malloc(i64 16)
  %flvar_205 = getelementptr i64, i64* %flvar_201, i64 0
  store i64 1, i64* %flvar_205
  %flvar_202 = getelementptr i64, i64* %flvar_200, i64 1
  %flvar_203 = load i64, i64* %flvar_202
  %flvar_204 = inttoptr i64 %flvar_203 to i64* (i64*, i64*)*
  %flvar_199 = call i64* %flvar_204(i64* %flvar_200, i64* %flvar_201)
  %flvar_206 = load i64*, i64** @flglobal_println
  %flvar_207 = call i64* @malloc(i64 16)
  %flvar_211 = getelementptr i64, i64* %flvar_207, i64 0
  store i64 0, i64* %flvar_211
  %flvar_208 = getelementptr i64, i64* %flvar_206, i64 1
  %flvar_209 = load i64, i64* %flvar_208
  %flvar_210 = inttoptr i64 %flvar_209 to i64* (i64*, i64*)*
  %flvar_131 = call i64* %flvar_210(i64* %flvar_206, i64* %flvar_207)
  store i64* %flvar_131, i64** @flglobal_main
  ret i32 0
}

