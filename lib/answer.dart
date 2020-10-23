import 'package:flutter/material.dart';

class Answer extends StatefulWidget {
  final List ans;
  final process;
  Answer(this.ans, this.process);
  @override
  _AnswerState createState() => _AnswerState();
}

List check = [];
int count = 0;

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemBuilder: (context, i) {
            return Center(
              child: GestureDetector(
                  onTap: () {
                    print(widget.ans[i]);
                    print(count);
                    print(i);
                    if (i == widget.ans[count]) {
                      setState(() {
                        check.add(i);
                        count++;
                      });
                      final snackBar = SnackBar(
                          content: Text(
                              'Process ${i}, recived resources successfully '));
                      Scaffold.of(context).showSnackBar(snackBar);
                    } else {
                      final snackBar = SnackBar(
                          content:
                              Text('Process ${i}, recived unsuccessfully '));
                      Scaffold.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Center(
                    child: Container(
                        child: !check.contains(i)
                            ? Text(
                                "P${i}",
                                style: TextStyle(fontSize: 40),
                              )
                            : Text(
                                "P${i}",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 40),
                              )),
                  )),
            );
          },
          itemCount: widget.process,
        ),
      ),
    );
  }
}
