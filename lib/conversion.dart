import 'package:flutter/material.dart';

class Conversion extends StatefulWidget {
  @override
  _ConversionState createState() => _ConversionState();
}

class _ConversionState extends State<Conversion> {
  List grid = List.generate(10, (i) => List(10), growable: false);
  List maxGrid = List.generate(10, (i) => List(10), growable: false);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  TextEditingController processes = TextEditingController();
  TextEditingController resources = TextEditingController();
  TextEditingController used = TextEditingController();
  List availableGrid = List.generate(10, (index) => null);
  List needGrid = List.generate(10, (i) => List(10), growable: false);
  List ans = List.generate(10, (index) => null);
  List f = List.generate(10, (index) => null);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    void matrix() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here

              child: Container(
                height: 500,
                width: 500,
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Container(
                        height: 400,
                        width: 400,
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  children: [
                                    for (int i = 0;
                                        i < int.parse(processes.text);
                                        i++)
                                      Row(
                                        children: [
                                          for (int j = 0;
                                              j < int.parse(resources.text);
                                              j++)
                                            SingleChildScrollView(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color:
                                                            Colors.blueAccent)),
                                                height: 60,
                                                width: 60,
                                                child: TextFormField(
                                                  validator: (val) {
                                                    grid[i][j] = int.parse(val);
                                                    return;
                                                  },
                                                  maxLength: 2,
                                                  decoration:
                                                      new InputDecoration(
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 15,
                                                            bottom: 11,
                                                            top: 11,
                                                            right: 15),
                                                  ),
                                                ),
                                              ),
                                            )
                                        ],
                                      ),
                                    RaisedButton(
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          _formKey.currentState.save();
                                        }
                                        Navigator.pop(context);
                                      },
                                      child: Text("save"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
    }

    void matrix1() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here

              child: Container(
                height: 300,
                width: 300,
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      height: 200,
                      width: 200,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int i = 0; i < int.parse(processes.text); i++)
                              Row(
                                children: [
                                  for (int j = 0;
                                      j < int.parse(resources.text);
                                      j++)
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.blueAccent)),
                                      height: 50,
                                      width: 50,
                                      child: TextFormField(
                                        validator: (val) {
                                          maxGrid[i][j] = int.parse(val);
                                          return;
                                        },
                                        maxLength: 2,
                                        decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 15,
                                              bottom: 11,
                                              top: 11,
                                              right: 15),
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            RaisedButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                }
                                Navigator.pop(context);
                              },
                              child: Text("save"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
    }

    void needMatrix() {
      for (int i = 0; i < int.parse(processes.text); i++) {
        for (int j = 0; j < int.parse(resources.text); j++) {
          needGrid[i][j] = maxGrid[i][j] - grid[i][j];
        }
      }
      print(needGrid);
    }

    void error() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20.0)), //this right here
                child: Container(
                  child: Text("Enter All The Values"),
                ));
          });
    }

    void allocation(context) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20.0)), //this right here
                child: Form(
                  key: _form,
                  child: Container(
                      height: 400,
                      width: 400,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              for (int i = 0;
                                  i < int.parse(resources.text);
                                  i++)
                                Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.blueAccent)),
                                  height: 50,
                                  width: 50,
                                  child: TextFormField(
                                    validator: (val) {
                                      availableGrid[i] = int.parse(val);
                                      // availableGrid.add(int.parse(val));
                                      return;
                                    },
                                  ),
                                ),
                              RaisedButton(
                                onPressed: () {
                                  if (_form.currentState.validate()) {
                                    _form.currentState.save();
                                    print(availableGrid);
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text("Saved"),
                              )
                            ],
                          ),
                        ],
                      )),
                ));
          });
    }

    void compare() {
      int ind = 0;

      for (int k = 0; k < 5; k++) {
        for (int i = 0; i < int.parse(processes.text); i++) {
          if (f[i] == 0) {
            int flag = 0;

            for (int j = 0; j < int.parse(resources.text); j++) {
              if (needGrid[i][j] > availableGrid[j]) {
                flag = 1;

                break;
              }
            }

            if (flag == 0) {
              ans[ind++] = i;

              for (int y = 0; y < int.parse(resources.text); y++)
                availableGrid[y] += grid[i][y];

              f[i] = 1;
            }
          }
        }
      }
      print("Following is the SAFE Sequence\n");

      for (int i = 0; i < int.parse(processes.text) - 1; i++)
        print(
          " P ->${ans[i]}",
        );

      print(
        " P${ans[int.parse(processes.text) - 1]}",
      );
    }

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Center(
          child: Container(
            width: size.width * 0.6,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                TextField(
                  controller: processes,
                  decoration: InputDecoration(
                      hintText: "Enter the number of processes"),
                ),
                TextField(
                  controller: resources,
                  decoration: InputDecoration(
                      hintText: "Enter the number of resources"),
                ),
                TextField(
                  // controller: resources,
                  decoration: InputDecoration(
                      hintText:
                          "Enter the number of processes that have been allocated"),
                ),
                RaisedButton(
                  onPressed: () => {
                    if (processes.text == '' || resources.text == '')
                      {error()}
                    else
                      {matrix()}
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    // print(grid);
                    needMatrix();
                  },
                  child: Text("press"),
                ),
                RaisedButton(
                  onPressed: () => {
                    if (processes.text == '' || resources.text == '')
                      {error()}
                    else
                      {matrix1()}
                  },
                  child: Text("MaxArray"),
                ),
                RaisedButton(
                  onPressed: () {
                    allocation(context);
                  },
                  child: Text("Allocation"),
                ),
                RaisedButton(
                  onPressed: () {
                    compare();
                  },
                  child: Text("Compare"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
