import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:taskmanager/widgets/active_project_card.dart';
import 'package:taskmanager/screens/calendar_page.dart';
import 'package:taskmanager/widgets/task_column.dart';
import 'package:taskmanager/widgets/top_container.dart';

class HomePage extends StatelessWidget {
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: Colors.green,
      child: Icon(
        Icons.calendar_today,
        size: 18.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.orangeAccent.shade100,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 230,
              width: width,
              padding: EdgeInsets.all(10.0),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.menu, color: Colors.black, size: 30.0),
                        Icon(Icons.search, color: Colors.black, size: 27.0),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircularPercentIndicator(
                            radius: 80.0,
                            lineWidth: 5.0,
                            animation: true,
                            percent: 0.75,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.redAccent.shade200,
                            backgroundColor: Colors.yellow.shade400,
                            center: CircleAvatar(
                              backgroundColor: Colors.blue.shade900,
                              radius: 70.0,
                              backgroundImage:const AssetImage(
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
                                    fontSize: 25.0,
                                    color: Colors.black,
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
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                                    MaterialPageRoute(builder: (context) => CalendarPage()),
                                  );
                                },
                                child: calendarIcon(),
                              ),
                            ],
                          ),
                          TaskColumn(

                            icon: Icons.alarm,
                            iconBackgroundColor: Colors.orange,
                            title: 'To Do',
                            subtitle: '5 tasks now. 1 started',
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.timer,
                            iconBackgroundColor: Colors.green,
                            title: 'In Progress',
                            subtitle: '1 task now. 1 started',
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.check_circle_outline,
                            iconBackgroundColor: Colors.blue,
                            title: 'Done',
                            subtitle: '18 tasks now. 13 started',
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('Active Projects'),
                              calendarIcon(),
                            ],
                          ),
                          SizedBox(height: 10.0,),
                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor: Colors.orange.shade400,
                                loadingPercent: 0.6,
                                title: 'Medical App',
                                subtitle: 'Posted 2 days ago',
                              ),
                              SizedBox(width: 20.0),
                              ActiveProjectsCard(
                                cardColor: Colors.blue.shade400,
                                loadingPercent: 0.8,
                                title: 'Makeup Products',
                                subtitle: 'Posted 5 days ago',
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0, width: 20.0),
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
