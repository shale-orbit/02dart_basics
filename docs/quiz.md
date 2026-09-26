# Dart 基础"预测输出"自测题（5 题）

> 用法：先只看题目，写下自己预测的输出，再对照参考答案。题目代码已合并为可运行程序：`bin/quiz_demo.dart`，在项目根目录执行 `dart run bin/quiz_demo.dart` 可看到全部实际输出。

## 题目

### 第 1 题：整除 / 普通除法 / 取余

```dart
void main() {
  int a = 17;
  print(a ~/ 5);
  print(a / 5);
  print(a % 5);
}
```

### 第 2 题：安全调用 ?. 与空合并 ??

```dart
void check(String? s) {
  print(s?.length);
  print(s ?? '空');
}

void main() {
  check(null);
  check('hello');
}
```

### 第 3 题：命名参数（required、默认值、顺序自由）

```dart
void info({required String name, int age = 18, String? city}) {
  print('$name-$age-${city ?? '未知'}');
}

void main() {
  info(name: '李华');
  info(name: '小明', city: '成都', age: 20);
}
```

### 第 4 题：箭头函数 + 三元运算符 + 取余

```dart
int calc(int a, int b) => a ~/ b;

void main() {
  print(calc(20, 3));

  int x = 8;
  print(x % 3 == 0 ? 'yes' : 'no');
}
```

### 第 5 题：late 与 ?.、?? 串联

```dart
late String token;

void main() {
  String? nickname;
  print(nickname?.length ?? 0);

  token = 'xyz';
  print(token.length);
}
```

---

## 参考答案与讲解

### 第 1 题

```
3
3.4
2
```

| 表达式 | 计算 | 结果 |
|--------|------|------|
| `a ~/ 5` | 17 ÷ 5 = 3.4，整除丢掉小数 | `3` |
| `a / 5` | 普通除法，结果类型固定为 double | `3.4` |
| `a % 5` | 17 ÷ 5 = 3 余 2 | `2` |

易错点：`/` 的结果**永远是 double**，即使能整除也会输出 `3.0`；要 int 结果只能用 `~/`。

### 第 2 题

```
null
空
5
hello
```

- 第一次调用 `check(null)`：`s?.length` 对 null 短路 → `null`；`s ?? '空'` 左边为 null → `空`。
- 第二次调用 `check('hello')`：`s?.length` 非空取长度 → `5`；`s ?? '空'` 左边非空，直接采用左边 → `hello`。

参数写成 `String? s`，函数内部无法预知传入什么，这才是 `?.` 和 `??` 的真实使用场景。

### 第 3 题

```
李华-18-未知
小明-20-成都
```

- 第一次调用：`name` 为 required 必传；`age` 省略用默认值 `18`；`city` 省略为 null，由 `?? '未知'` 兜底。
- 第二次调用：三个参数都显式给出。调用顺序（city 写在 age 前）不影响结果——**命名参数按名字匹配，顺序随意**。

### 第 4 题

```
6
no
```

- `calc(20, 3)`：箭头函数返回 `20 ~/ 3`，整除 = `6`。
- `8 % 3 == 0 ? 'yes' : 'no'`：`8 % 3 = 2`，`2 == 0` 为 false → 取冒号后的 `'no'`。

符号区分：`~/` 整除、`%` 取余、`? :` 判断真假、`??` 判断 null。

### 第 5 题

```
0
3
```

- `nickname?.length ?? 0`：`?.` 对 null 先返回 null，再由 `??` 兜底为 `0`——"取不到就给 0"，保证结果不是 null。
- `token.length`：`late String token` 在使用前已赋值 `'xyz'`，长度 = `3`。

若把 `token = 'xyz';` 注释掉，运行时会抛 `LateInitializationError`——late 的承诺是"使用前必须赋值"。

---

## 知识点覆盖

| 题号 | 核心知识点 |
|------|-----------|
| 1 | `~/` `/` `%` |
| 2 | `?.` `??` 对可空参数的防护 |
| 3 | 命名参数、required、默认值、顺序自由 |
| 4 | 箭头函数、三元运算符、取余 |
| 5 | late、`?.` 与 `??` 串联 |
