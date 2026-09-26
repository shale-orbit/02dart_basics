void runFlowDemo() {
  print('三、分支与循环');
String gradeOf(double score) {
    if (score >= 90) return '优';
    if (score >= 80) return '良';
    if (score >= 60) return '中';
    return '不及格';
  }
  print(gradeOf(95));
  print(gradeOf(85));
  print(gradeOf(70));
  print(gradeOf(56.3));

  for (final i in [1,2,3,4]) {
    print('第$i题');
  }
}
