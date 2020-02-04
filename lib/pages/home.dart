import 'package:flutter/material.dart';
import 'package:schedule_app/data.dart';
import 'package:schedule_app/models/content-category.dart';
import 'package:schedule_app/models/lesson.dart';
import 'package:schedule_app/models/schedule.dart';
import 'package:schedule_app/models/week.dart';
import 'package:schedule_app/models/day.dart';
import 'package:schedule_app/components/category-card.dart';
import 'package:schedule_app/components/day-card.dart';
import 'package:schedule_app/pages/week-page.dart';
import 'dart:async';
import 'package:schedule_app/helpers/api.dart';
import 'package:schedule_app/helpers/scheduler.dart';
import 'package:schedule_app/helpers/scheduler-date.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ContentCategory> appCategories;
  Schedule schedule;
  Day nowDay;
  Day nextDay;

  @override
  void initState() {
    super.initState();
    initializeDateSettings();

    this.appCategories = categories;
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    setCurrentDayCard();
  }

  getSchedule({bool force: false}) async {
    if (this.schedule != null && !force) return;

    final scheduleJson = await getScheduleJson();
    final schedule = setScheduleToObj(scheduleJson);
    setState(() {
      this.schedule = schedule;
    });

    return schedule;
  }

  setCurrentDayCard() {
    if (this.schedule == null) return;

    DateTime dateStart = new DateTime.now();
    dynamic currentScheduleDay = getCurrentScheduleDay(
        dateStart,
        this.schedule.startDate,
        this.schedule.startWeekPoint,
        this.schedule.startDayPoint);
    String date = getFormattedDate(dateStart);
    String currentDay = getDayName(dateStart);

    List<Lesson> currentLessons;
    this.schedule.weeks.asMap().forEach((index, item) => {
          if (item.code == currentScheduleDay['week'])
            {
              this.schedule.weeks[index].days.asMap().forEach((index, day) => {
                    if (index == currentScheduleDay['day'] - 1)
                      {
                        currentLessons = day.lessons,
                      }
                  })
            }
        });

    this.nowDay = new Day(name: currentDay, lessons: currentLessons);
    this.nowDay.date = date;
    this.nowDay.weekCode = currentScheduleDay['week'];
  }

  setNextDayCard() {
    if (this.schedule == null) return;

    DateTime dateStart = new DateTime.now().add(Duration(days: 1));
    dynamic currentScheduleDay = getCurrentScheduleDay(
        dateStart,
        this.schedule.startDate,
        this.schedule.startWeekPoint,
        this.schedule.startDayPoint);
    String date = getFormattedDate(dateStart);
    String currentDay = getDayName(dateStart);

    List<Lesson> currentLessons;
    this.schedule.weeks.asMap().forEach((index, item) => {
          if (item.code == currentScheduleDay['week'])
            {
              this.schedule.weeks[index].days.asMap().forEach((index, day) => {
                    if (index == currentScheduleDay['day'] - 1)
                      {
                        currentLessons = day.lessons,
                      }
                  })
            }
        });

    this.nextDay = new Day(name: currentDay, lessons: currentLessons);
    this.nextDay.date = date;
    this.nextDay.weekCode = currentScheduleDay['week'];
  }

  Widget renderBody() {
    return new SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.only(top: 14, bottom: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.9),
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
                itemBuilder: (context, index) => new CategoryCard(
                    index: index,
                    name: appCategories[index].name,
                    onPress: () => this
                        .onCategoryTapped(context, appCategories[index].code)),
                itemCount: appCategories.length,
              ),
            ),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Сегодня",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20)),
                  ],
                )),
            Container(
              child: renderCurrentDayCard(),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Завтра",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20)),
                  ],
                )),
            Container(
              child: renderNextDayCard(),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> onCategoryTapped(context, code) async {
    Week week = new Week(code: 0, name: '', days: []);
    this.schedule.weeks.forEach((item) => {
          if (code == item.code)
            {
              week = item,
            }
        });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new WeekPage(week: week)),
    );
  }

  Widget renderCurrentDayCard() {
    setCurrentDayCard();
    return DayCard(day: this.nowDay);
  }

  Widget renderNextDayCard() {
    setNextDayCard();
    return DayCard(day: this.nextDay);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe9e9e9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Расписание', style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            color: Colors.grey[600],
            onPressed: () => getSchedule(force: true),
          )
        ],
      ),
      body: new FutureBuilder(
        future: getSchedule(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Center(
                  child: CircularProgressIndicator(
                valueColor:
                    new AlwaysStoppedAnimation<Color>(Color(0xffffba2b)),
              ));
            default:
              if (snapshot.hasError) {
                return errorFetchingData();
              }
          }
          if (schedule == null) {
            return Center(
                child: Text("Sorry, we don't have any data",
                    style: TextStyle(fontWeight: FontWeight.w500)));
          } else {
            return renderBody();
          }
        },
      ),
    );
  }

  Widget errorFetchingData() {
    return new Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Error on fetching data.'),
          FlatButton(
            child: Text('Try again'),
            onPressed: () => getSchedule(),
          )
        ],
      ),
    );
  }
}
