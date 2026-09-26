void runFuncDemo() {
  print('二、函数');
int add(int a, int b) => a + b;
  print(add(3, 8));

  void enroll({required String name, int age = 18, String? title}) {
    print('$name，$age 岁，称呼：$title');
  }

  enroll(name: '李华');                       
  enroll(name: '小明', title: '同学', age: 20); 
}
