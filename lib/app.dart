import 'package:flutter/material.dart';
import 'package:schedule_app/pages/home.dart';

class ScheduleApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ИГХТУ Расписание',
      initialRoute: '/',
      theme: _appTheme,
      routes: <String, WidgetBuilder> {
        '/': (context) => HomePage(),
      },
    );
  }
}

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {

  final ThemeData base = ThemeData.light();

  return base.copyWith(
      primaryColor: Colors.white,
      accentColor: Color(0xffe3f9df),
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: Color(0xff6fb165),
        textTheme: ButtonTextTheme.normal,
        minWidth: 280.0,
        height: 45.0,
        shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
      hintColor: Colors.grey[100],
      scaffoldBackgroundColor: Color(0xffe9e9e9),
      
      textSelectionColor: Colors.yellow,
      errorColor: Colors.red,
      textTheme: _buildAppTextTheme(base.textTheme),
      primaryTextTheme: _buildAppTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildAppTextTheme(base.accentTextTheme),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        filled: true,
      ));
}

TextTheme _buildAppTextTheme(TextTheme base) {
  return base
      .copyWith(
        display1: base.display1.copyWith(
          fontSize: 18.0,
        ),
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        subtitle: base.subtitle.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        displayColor: Colors.black,
        bodyColor: Colors.black,
      );
}


