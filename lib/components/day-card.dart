import 'package:flutter/material.dart';
import 'package:schedule_app/models/day.dart';

class DayCard extends StatelessWidget {
  DayCard({@required this.day});

  final Day day;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      margin: const EdgeInsets.all(15),
      color: Colors.white,
      elevation: 4,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(this.day.name,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                  Text(this.day.date != null ? this.day.date : '',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w400,
                          fontSize: 14)),
                  Text(this.day.weekCode != null
                      ? '${this.day.weekCode} неделя'
                      : ''),
                ],
              ),
            ),
            ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: 1.0,
                maxHeight: 500.0,
              ),
              child: renderLessons(),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderLessons() {
    return day.lessons.isEmpty
        ? Padding(padding: EdgeInsets.all(5), child: Text('Занятий нет'))
        : ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            shrinkWrap: true,
            itemCount: day.lessons.length,
            itemBuilder: (context, index) => new ListTile(
              contentPadding: EdgeInsets.all(0),
              dense: true,
              title: Text(
                  '[${day.lessons[index].type}] ${day.lessons[index].name}'),
              subtitle: Text(
                  '${day.lessons[index].startTime} - ${day.lessons[index].endTime}',
                  style: TextStyle(
                      color: Colors.grey[700], fontWeight: FontWeight.w400)),
              trailing: Text(day.lessons[index].place),
            ),
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Colors.grey[500],
            ),
          );
  }
}
