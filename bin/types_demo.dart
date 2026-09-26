void runTypesDemo() {
  print('一、变量、插值与空安全');
  //变量
  var title = '第一次作业';     
double score = 92.5;
final now = DateTime.now(); 
const pi = 3.14159;        
  print('$title,$score,$now,$pi');
//插值
  print('7 / 2 = ${7 / 2}');    
  print('7 ~/ 2 = ${7 ~/ 2}');  
//空安全
  String? nickname;             
  print(nickname?.length);
  print(nickname ?? '未填写');
  nickname = 'hu';               
  print('赋值后 nickname!.length = ${nickname!.length}');

  late String token;
  token = 'abc123';
  print('late 变量 token = $token');
}
