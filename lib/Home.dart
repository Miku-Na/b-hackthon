import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'Solve.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'ｺｰﾄﾞ行動',
          style: TextStyle(
            fontFamily: 'NotoSansJP',
            fontSize: 30.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'ｺｰﾄﾞ行動',
                style: TextStyle(
                  fontFamily: 'NotoSansJP',
                  fontSize: 70.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 80.0,
                width: 150.0,
              ),
              RaisedButton.icon(
                icon: const Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.black,
                ),
                label: const Text(
                  'バーコード読み取り',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => scan(context),
                color: Colors.white,
                textColor: Colors.black,
              ),
              SizedBox(
                height: 20.0,
              ),
              // RaisedButton.icon(
              //   icon: const Icon(
              //     Icons.text_snippet_outlined,
              //     color: Colors.white,
              //   ),
              //   label: const Text(
              //     '問題解答',
              //     style: TextStyle(
              //       fontSize: 30.0,
              //     ),
              //   ),
              //   onPressed: () =>
              //       Navigator.of(context).pushNamed("/solve_question"),
              //   color: Colors.black,
              //   textColor: Colors.white,
              // ),
              // SizedBox(
              //   height: 20.0,
              // ),
              RaisedButton.icon(
                icon: const Icon(
                  Icons.collections,
                  color: Colors.white,
                ),
                label: const Text(
                  'コレクション',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () => Navigator.of(context).pushNamed("/collection"),
                color: Colors.black,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future scan(BuildContext context) async {
    try {
      var result = await BarcodeScanner.scan();
      String resultContent;
      if (result != null){
        if (result.rawContent.isEmpty) return;
        resultContent = result.rawContent;
      } else {
        errorMessage(context, "上手く読み取れませんでした");
        return;
      }
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => solve_question(input: convertToInt(resultContent))
          )
      );
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        errorMessage(context, "カメラの使用権限が有りません");
      } else {
        errorMessage(context, "未知のエラーが発生しました");
      }
    }
  }
  int convertToInt(String input){
    int out=0;
    if(input.startsWith('codeCode_')){
      out = int.parse(input.substring(9,input.length));
    } else {
      out = input.hashCode;
    }
    return out;
  }
  void errorMessage(BuildContext context, String msg){
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("エラー"),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
}