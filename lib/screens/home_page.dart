import 'package:flutter/material.dart';
import 'package:taskmanager/screens/calendar_page.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:taskmanager/widgets/task_column.dart';
import 'package:taskmanager/widgets/active_project_card.dart';
import 'package:taskmanager/widgets/top_container.dart';

class HomePage extends StatelessWidget {
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.blue.shade300,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: Colors.green,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 200,
              width: width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.menu,
                            color: Colors.blue.shade400, size: 30.0),
                        Icon(Icons.search,
                            color: Colors.blue.shade400, size: 27.0),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircularPercentIndicator(
                            radius: 90.0,
                            lineWidth: 5.0,
                            animation: true,
                            percent: 0.75,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.redAccent.shade200,
                            backgroundColor: Colors.yellow.shade400,
                            center: CircleAvatar(
                              backgroundColor: Colors.blue.shade400,
                              radius: 35.0,
                              backgroundImage: AssetImage(
                                'assets/images/avatar.png',
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Saikat Nayek',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.blue.shade400,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'App Developer',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('My Tasks'),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CalendarPage()),
                                  );
                                },
                                child: calendarIcon(),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.alarm,
                            iconBackgroundColor: Colors.redAccent.shade400,
                            title: 'To Do',
                            subtitle: '7 tasks now. 2 started',
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TaskColumn(
                            icon: Icons.blur_circular,
                            iconBackgroundColor: Colors.yellow.shade400,
                            title: 'In Progress',
                            subtitle: '1 tasks now. 1 started',
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.check_circle_outline,
                            iconBackgroundColor: Colors.blue.shade400
                            title: 'Done',
                            subtitle: '18 tasks now. 13 started',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Active Projects'),
                          SizedBox(height: 5.0),
                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor: Colors.lightGreen.shade600,
                                loadingPercent: 0.25,
                                title: 'Fitness App',
                                subtitle: '9 hours progress',
                              ),
                              SizedBox(width: 20.0),
                              ActiveProjectsCard(
                                cardColor: Colors.red.shade300,
                                loadingPercent: 0.6,
                                title: 'Making Java Notes',
                                subtitle: '21 hours progress',
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor: Colors.yellow.shade400,
                                loadingPercent: 0.45,
                                title: 'Crypto App',
                                subtitle: '5 hours progress',
                              ),
                              SizedBox(width: 20.0),
                              ActiveProjectsCard(
                                cardColor: Colors.blue.shade400,
                                loadingPercent: 0.9,
                                title: 'Online Cloud Course',
                                subtitle: '23 hours progress',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}