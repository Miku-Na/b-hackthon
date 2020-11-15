import 'dart:ffi';
import 'package:flutter/material.dart';
import 'view.dart';
String answerFromTextBox = '';
class solve_question extends StatelessWidget {
  int input = 0;
  List a;
  solve_question({Key key, this.input}) {
    a = create_pages(input);
  }
  @override
  Widget build(BuildContext context) {
    String mame_name = a[0];
    String Question = a[1];
    int Ans = a[2];
    return Scaffold(
        appBar: AppBar(
          title: Text('問題'),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, int index) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      margin:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: ListTile(
                        title: Text(
                          //ここに豆知識を入れる
                          '豆知識',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Image.asset('images/'+mame_name),
                    Card(
                      margin:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: ListTile(
                        title: Text(
                          //ここに問題を入れる
                          '問題      ' + '$Question',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: ChangeForm(),
                    ),
                    Center(
                      child: answer(),
                    ),
                  ]);
            }));
  }
}
//テキスト入力
class ChangeForm extends StatefulWidget {
  @override
  _ChangeFormState createState() => _ChangeFormState();
}
class _ChangeFormState extends State<ChangeForm> {
  //受け渡したい変数
  String _text = '';
  void _handleText(String e) {
    setState(() {
      _text = e;
      _text = answerFromTextBox;
    });
  }
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: <Widget>[
          Text(
            "$_text",
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 30.0,
                fontWeight: FontWeight.w500),
          ),
          TextField(
            enabled: true,
            // 入力数
            maxLength: 10,
            maxLengthEnforced: false,
            style: TextStyle(color: Colors.red),
            obscureText: false,
            maxLines: 1,
            //パスワード
            onChanged: _handleText,
          ),
        ],
      ),
    );
  }
}
//ボタン
class answer extends StatefulWidget {
  @override
  _answerState createState() => _answerState();
}
class _answerState extends State<answer> {
  int _count = 0;
  void _handlePressed() {
    setState(() {
      _count++;
    });
  }
  var answerWhich = '';
  var isAnswer = false;
  //ここに実際の答え
  var realAnswer = '';
  @override
  Widget build(BuildContext context) {
    //bool isAnswer = false;
    return Container(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: <Widget>[
          FlatButton(
            color: Colors.blue,
            child: Text(
              '解答',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () {
              setState(() {
                //ここの''に本当の答えを入れる
                if (answerFromTextBox == realAnswer) {
                  answerWhich = '正解';
                } else {
                  answerWhich = '不正解';
                }
                isAnswer = true;
              });
            },
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: ListTile(
              title: Text(
                answerWhich,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Visibility(
            visible: isAnswer,
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                title: Text(
                  //ここに解答を入れる
                  '解答',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}