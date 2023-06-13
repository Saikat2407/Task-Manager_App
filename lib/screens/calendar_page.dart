import 'package:flutter/material.dart';
import 'package:taskmanager/dates_list.dart';
import 'package:taskmanager/widgets/calendar_dates.dart';
import 'package:taskmanager/widgets/task_container.dart';
import 'package:taskmanager/screens/create_new_task_page.dart';
import 'package:taskmanager/widgets/back_button.dart';

class CalendarPage extends StatelessWidget {
  Widget _dashedText() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        '------------------------------------------',
        maxLines: 1,
        style:
        TextStyle(fontSize: 20.0, color: Colors.black12, letterSpacing: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            0,
          ),
          child: Column(
            children: <Widget>[
              MyBackButton(),
              SizedBox(height: 30.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Today',
                      style: TextStyle(
                        color: Colors.black,
                          fontSize: 30.0, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      height: 40.0,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateNewTaskPage(),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            'Add task',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ]),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Productive Day, Saikat',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'April, 2023',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 58.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CalendarDates(
                      day: days[index],
                      date: dates[index],
                      dayColor: index == 0 ? Colors.red.shade300 : Colors.black54,
                      dateColor:
                      index == 0 ? Colors.red.shade300 : Colors.blue ,
                    );
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                            itemCount: time.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) =>
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${time[index]} ${time[index] > 8 ? 'PM' : 'AM'}',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 5,
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              _dashedText(),
                              TaskContainer(
                                title: 'Project Research',
                                subtitle: 'Discuss with the colleagues about the future plan',
                                boxColor: Colors.orangeAccent.shade200,
                              ),
                              _dashedText(),
                              TaskContainer(
                                title: 'Work on Fitness App',
                                subtitle: 'Add exercise tab',
                                boxColor: Colors.lightBlueAccent.shade100,
                              ),
                              TaskContainer(
                                title: 'Call',
                                subtitle: 'Call to Maa',
                                boxColor: Colors.pinkAccent.shade200,
                              ),
                              TaskContainer(
                                title: 'Design Meeting',
                                subtitle:
                                'Discuss with designers for new task for the medical app',
                                boxColor: Colors.lightGreen,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FlatButton({ required Function() onPressed, required Center child}) {}
}