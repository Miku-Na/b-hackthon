import 'package:flutter/material.dart';

//コレクション
class collection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('コレクション'),
        backgroundColor: Colors.black,),
      body: CollectionPageState(),
    );
  }
}

class CollectionPageState extends StatefulWidget {
  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPageState> {
  int show = 1;
  void markAsRead() {
    setState(() {
      show = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    var contentList = <Widget>[];
    var categoryList = ["一次関数","比の計算","豆知識",];
    var categoryLen = [2,1,1];
    var rawcontentNum = 4;
    for (int i = 0; i < categoryList.length; i++) {
      contentList.add(
        Card(
          child: ListTile(
            title: Text(
              categoryList[i],
              style: TextStyle(
                fontFamily: 'NotoSansJP',
              ),
            ),
          ),
        ),
      );
      var tmprawContent = <Widget>[];
      for (int j = 0; j < rawcontentNum; j++) {
        if(j<categoryLen[i]){
          tmprawContent.add(
            Expanded(
              child:
                FlatButton(
                  onPressed: () {
                    makeColumnPopup(context, "images/"+i.toString()+"_"+j.toString()+".png");
                  },
                  child: Image.asset('images/image1.png'),
                ),
            ),
          );
        } else {
          tmprawContent.add(
            Expanded(child:FlatButton(),)
          );
        }
      }
      contentList.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: tmprawContent));
      contentList.add(
        SizedBox(
          height: 10,
        ),
      );
    }
    return Container(
        color: Colors.white,
        child: SingleChildScrollView(child: Column(children: contentList)));
  }

  void makeColumnPopup(BuildContext context, String filename) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('豆知識'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image.asset(filename)
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
