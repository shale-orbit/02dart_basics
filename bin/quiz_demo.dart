// 自测 5 题合并程序
// ---- 第 2 题用到的函数 ----
void check(String? s) {
  print(s?.length);
  print(s ?? '空');
}
// ---- 第 3 题用到的函数 ----
void info({required String name, int age = 18, String? city}) {
  print('$name-$age-${city ?? '未知'}');
}
// ---- 第 4 题用到的函数 ----
int calc(int a, int b) => a ~/ b;
// ---- 第 5 题用到的顶层 late 变量 ----
late String token;

void main() {
  // 第 1 题：整除 / 普通除法 / 取余
  print('===== 第1题 =====');
  int a = 17;
  print(a ~/ 5);
  print(a / 5);
  print(a % 5);

  // 第 2 题：?. 与 ??
  print('===== 第2题 =====');
  check(null);
  check('hello');

  // 第 3 题：命名参数
  print('===== 第3题 =====');
  info(name: '李华');
  info(name: '小明', city: '成都', age: 20);

  // 第 4 题：箭头函数 + 三元运算符
  print('===== 第4题 =====');
  print(calc(20, 3));
  int x = 8;
  print(x % 3 == 0 ? 'yes' : 'no');

  // 第 5 题：late 与 ?.、?? 串联
  print('===== 第5题 =====');
  String? nickname;
  print(nickname?.length ?? 0);
  token = 'xyz';
  print(token.length);
}
