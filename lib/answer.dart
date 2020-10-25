import 'package:flutter/material.dart';

class Answer extends StatefulWidget {
  final List ans; //the outcome
  final process; //size
  Answer(this.ans, this.process);
  @override
  _AnswerState createState() => _AnswerState();
}

List check = [];
int count = 0;

List<Widget> disaplaySafeSeq(List seq, int size, List ans) {
  List<String> safeSeqList = [];

  for (int i = 0; i < size; i++) {
    safeSeqList.add(ans[i]);
  }

  print(safeSeqList);
}

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.cyan, width: 4)),
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
              itemBuilder: (context, i) {
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      print(widget.ans[i]);
                      print(count);
                      print(i);
                      if (i == widget.ans[count]) {
                        setState(
                          () {
                            check.add(i);
                            count++;
                          },
                        );
                        final snackBar = SnackBar(
                          content: Text(
                              'Area ${i}, recived resources successfully '),
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                      } else {
                        final snackBar = SnackBar(
                            content:
                                Text('Area  ${i}, allocation unsuccessfull'));
                        Scaffold.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(top: 50),
                        child: !check.contains(i)
                            ? Text(
                                "P${i}",
                                style: TextStyle(fontSize: 40),
                              )
                            : Text(
                                "P${i}",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 40),
                              ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: widget.process,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20, top: 30),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              'One possible safe sequence can be ',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Divider(
            color: Colors.amber,
          ),
          Container(
            margin: EdgeInsets.only(left: 40, top: 50),
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Text(
                  'P${check[index]}      ',
                  style: TextStyle(fontSize: 30, color: Colors.blue),
                );
              },
              itemCount: check.length,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
