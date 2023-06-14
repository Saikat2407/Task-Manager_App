import 'package:flutter/material.dart';
import 'package:taskmanager/widgets/top_container.dart';
import 'package:taskmanager/widgets/back_button.dart';
import 'package:taskmanager/widgets/my_text_field.dart';
import 'package:taskmanager/screens/home_page.dart';

class CreateNewTaskPage extends StatelessWidget {
  get mainAxisAlignment => null;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
              width: width,
              height: 0.0,
              child: Column(
                children: <Widget>[
                  MyBackButton(),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Create new task',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyTextField(label: 'Title'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Expanded(
                                child: MyTextField(
                                  label: 'Date',
                                  icon: downwardIcon,
                                ),
                              ),
                              HomePage.calendarIcon(),
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              child: MyTextField(
                                label: 'Start Time',
                                icon: downwardIcon,
                              )),
                          SizedBox(width: 40),
                          Expanded(
                            child: MyTextField(
                              label: 'End Time',
                              icon: downwardIcon,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      CustomWidget(
                        child: MyTextField(
                          label: 'Description',
                          minLines: 3,
                          maxLines: 3,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Category',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              //direction: Axis.vertical,
                              alignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              runSpacing: 0,
                              //textDirection: TextDirection.rtl,
                              spacing: 10.0,
                              children: <Widget>[
                                Chip(
                                  label: Text("SPORT APP"),
                                  backgroundColor: Colors.orange,
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                                Chip(
                                  label: Text("FITNESS APP"),
                                ),
                                Chip(
                                  label: Text("RENT APP"),
                                ),
                                Chip(
                                  label: Text("NOTES"),
                                ),
                                Chip(
                                  label: Text("GAMING PLATFORM APP"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Container(
              height: 80,
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Create Task',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                      // textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                    width: width - 40,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(30),
                    ),

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // widget({required MyTextField child}) {}
}

class CustomWidget extends StatelessWidget {
  final MyTextField child;

  const CustomWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}

