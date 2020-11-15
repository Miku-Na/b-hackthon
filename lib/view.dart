import "dart:math";

// 豆知識、問題文、答えを返す
List create_pages(int seed) {
  String tip, question;
  int answer;
  int qType = Random(seed.hashCode).nextInt(2);
  int tip_num = Random(seed.hashCode).nextInt(1);
  List valuables = ret_randoms(seed);
  tip = '$qType' + '_' + '$tip_num' + '.png';
  question = create_question(qType, valuables);
  answer = valuables[0];
  return [tip, question, answer];
}
// 問題文を返す
String create_question(int type, List val) {
  switch (type) {
    case 0:
      if (Random(type.hashCode).nextInt(3) == 0) {
        return ret_question_type1(val[0], val[1]);
      } else if (Random(type.hashCode).nextInt(3) == 1){
        return ret_question_type2(val[0], val[1], val[2]);
      } else {
        return ret_question_type3(val[0], val[1], val[2]);
      }
      break;
    case 1:
      return ret_question_type4(val[0], val[1], val[2]);
      break;
    default:
      return 'error to create quetion';
  }
}
// ax = b
String ret_question_type1(int x, int a) {
  int b = a * x;
  return ((a == 1) ? '' : '$a') + 'x = ' + '$b';
}
// ax + b = c
String ret_question_type2(int x, int a, int b) {
  int c = a * x + b;
  return ((a == 1) ? '' : '$a') + 'x + ' + '$b' + ' = ' + '$c';
}
// ax - b = c
String ret_question_type3(int x, int a, int b) {
  int c = a * x - b;
  return ((a == 1) ? '' : '$a') + 'x - ' + '$b' + ' = ' + '$c';
}
// x : a = b : c (b = x*m, c = a*m)
String ret_question_type4(int x, int a, int m) {
  m = Random(m).nextInt(5) + 1;
  int b = x * m, c = a * m;
  return 'x : ' + '$a' + ' = ' + '$b' + ' : ' + '$c';
}
// ランダムな数字のリストを返す
List ret_randoms(int seed) {
  int s1 = seed;
  int s2 = Random(seed.hashCode).nextInt(1 << 32 - 1);
  int s3 =
  Random(Random(seed.hashCode).nextInt(1 << 32 - 1)).nextInt(1 << 32 - 1);
  return [
    Random(s1).nextInt(15) + 1,
    Random(s2).nextInt(30) + 1,
    Random(s3).nextInt(30) + 1
  ];
}