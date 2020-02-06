import 'package:flutter/material.dart';
import 'package:schedule_app/models/week.dart';
import 'package:schedule_app/models/content-category.dart';
import 'package:schedule_app/components/day-card.dart';

class CategoryPage extends StatefulWidget {
  final ContentCategory contentCategory;
  final Week week;
  CategoryPage({Key key, this.contentCategory, this.week}) : super(key: key);

  @override
  _CategoryPageState createState() => new _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                iconTheme: IconThemeData(color: Colors.black),
                floating: true,
                pinned: true,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(widget.contentCategory.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      )),
                  background: Image.asset(widget.contentCategory.imgUrl,
                      fit: BoxFit.cover),
                ),
              ),
            ];
          },
          body: Container(
            child: renderDaysList(),
          )),
    );
  }

  Widget renderDaysList() {
    return widget.week.days.isEmpty
        ? Center(child: Text('Упс, для этой категории расписание не задано'))
        : ListView.builder(
            itemBuilder: (context, index) =>
                new DayCard(day: widget.week.days[index]),
            itemCount: widget.week.days.length,
          );
  }
}
