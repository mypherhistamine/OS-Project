import 'package:flutter/material.dart';

class Conversion extends StatefulWidget {
  @override
  _ConversionState createState() => _ConversionState();
}

class _ConversionState extends State<Conversion> {
  List grid = []; 
  List maxGrid = [];
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController processes = TextEditingController();
    TextEditingController resources = TextEditingController();
    TextEditingController used = TextEditingController();

    final size = MediaQuery.of(context).size;

    void matrix() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ), //this right here

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
                                                  grid.add(
                                                      [i, j, int.parse(val)]);
                                                  return;
                                                },
                                                maxLength: 2,
                                                decoration: new InputDecoration(
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
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
        },
      );
    }

    void matrix1() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ), //this right here

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
                                        maxGrid.add([i, j, int.parse(val)]);
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
        },
      );
    }

    List needGrid = [];
    void needMatrix() {
      for (int i = 0; i < grid.length; i++) {
        for (int j = 0; j < 3; j++) {
          needGrid.add([i, j, grid[i][2] - maxGrid[i][2]]);


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

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Center(
          child: Container(
            width: size.width * 0.6,
            height: 300,
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
                  child: Text('Allo array'),
                  onPressed: () => {
                    if (processes.text == '' || resources.text == '')
                      {error()}
                    else
                      {matrix()}
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    print(grid);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
