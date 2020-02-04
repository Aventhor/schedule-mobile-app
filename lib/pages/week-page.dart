import 'package:flutter/material.dart';
import 'package:schedule_app/models/week.dart';
import 'package:schedule_app/components/day-card.dart';

class WeekPage extends StatefulWidget {
  final Week week;
  WeekPage({Key key, this.week}) : super(key: key);

  @override 
  _WeekPageState createState() => new _WeekPageState();
}

class _WeekPageState extends State<WeekPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder:  (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.black),
              floating: true,
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(widget.week.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  )
                ),
                background: Image.asset('assets/images/week-head.png', fit: BoxFit.cover),
              ),           
            ), 
          ];
        },
        body: Container(
          child: renderDaysList(),
        )     
      ),
    );
  }

  Widget renderDaysList() {
    return widget.week.days.isEmpty ?
      Center(child: Text('Упс, для этой недели расписание не задано')) : ListView.builder(
        itemBuilder: (context, index) => new DayCard(day: widget.week.days[index]),
        itemCount: widget.week.days.length,
      );              
  }
}