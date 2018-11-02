@fmtlli = private unnamed_addr constant [5 x i8] c"%lli\00"
declare i32 @putchar(i32)
declare i32 @printf(i8* noalias nocapture, ...) nounwind
declare i64* @malloc(i64)
@flglobal_foo = global i64* null
@flglobal_main = global i64* null
define i32 @main() {
  %flvar_0 = call i64* @malloc(i64 16)
  %flvar_1 = getelementptr i64, i64* %flvar_0, i64 0
  store i64 4, i64* %flvar_1
  %flvar_2 = getelementptr i64, i64* %flvar_0, i64 1
  store i64 42, i64* %flvar_2
  store i64* %flvar_0, i64** @flglobal_foo
  %flvar_4 = load i64*, i64** @flglobal_foo
  %flvar_5 = getelementptr [5 x i8], [5 x i8]* @fmtlli, i64 0, i64 0
  %flvar_6 = getelementptr i64, i64* %flvar_4, i64 1
  %flvar_7 = load i64, i64* %flvar_6
  call i32 (i8*, ...) @printf(i8* %flvar_5, i64 %flvar_7)
  %flvar_8 = call i64* @malloc(i64 16)
  %flvar_12 = getelementptr i64, i64* %flvar_8, i64 0
  store i64 5, i64* %flvar_12
  %flvar_13 = getelementptr i64, i64* %flvar_8, i64 1
  store i64 10, i64* %flvar_13
  %flvar_9 = getelementptr i64, i64* %flvar_8, i64 1
  %flvar_10 = load i64, i64* %flvar_9
  %flvar_11 = trunc i64 %flvar_10 to i32
  call i32 @putchar(i32 %flvar_11)
  %flvar_15 = call i64* @malloc(i64 16)
  %flvar_16 = getelementptr i64, i64* %flvar_15, i64 0
  store i64 4, i64* %flvar_16
  %flvar_17 = getelementptr i64, i64* %flvar_15, i64 1
  store i64 43, i64* %flvar_17
  %flvar_14 = bitcast i64* %flvar_15 to i64*
  %flvar_18 = getelementptr [5 x i8], [5 x i8]* @fmtlli, i64 0, i64 0
  %flvar_19 = getelementptr i64, i64* %flvar_14, i64 1
  %flvar_20 = load i64, i64* %flvar_19
  call i32 (i8*, ...) @printf(i8* %flvar_18, i64 %flvar_20)
  %flvar_21 = call i64* @malloc(i64 16)
  %flvar_25 = getelementptr i64, i64* %flvar_21, i64 0
  store i64 5, i64* %flvar_25
  %flvar_26 = getelementptr i64, i64* %flvar_21, i64 1
  store i64 10, i64* %flvar_26
  %flvar_22 = getelementptr i64, i64* %flvar_21, i64 1
  %flvar_23 = load i64, i64* %flvar_22
  %flvar_24 = trunc i64 %flvar_23 to i32
  call i32 @putchar(i32 %flvar_24)
  %flvar_27 = load i64*, i64** @flglobal_foo
  %flvar_28 = getelementptr [5 x i8], [5 x i8]* @fmtlli, i64 0, i64 0
  %flvar_29 = getelementptr i64, i64* %flvar_27, i64 1
  %flvar_30 = load i64, i64* %flvar_29
  call i32 (i8*, ...) @printf(i8* %flvar_28, i64 %flvar_30)
  %flvar_3 = call i64* @malloc(i64 16)
  %flvar_34 = getelementptr i64, i64* %flvar_3, i64 0
  store i64 5, i64* %flvar_34
  %flvar_35 = getelementptr i64, i64* %flvar_3, i64 1
  store i64 10, i64* %flvar_35
  %flvar_31 = getelementptr i64, i64* %flvar_3, i64 1
  %flvar_32 = load i64, i64* %flvar_31
  %flvar_33 = trunc i64 %flvar_32 to i32
  call i32 @putchar(i32 %flvar_33)
  store i64* %flvar_3, i64** @flglobal_main
  ret i32 0
}

