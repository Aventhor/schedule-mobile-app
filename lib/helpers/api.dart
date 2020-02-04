import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';


Future<Map<String, dynamic>> getScheduleJson() async {
  dynamic response = await http.get(
    'https://api.github.com/gists/4c85518d73a0a6d48d5da0eba8b5811f',
     headers: {HttpHeaders.userAgentHeader: "Aventhor"},);
  Map<dynamic, dynamic> schedule  = jsonDecode(response.body);
  return schedule['files']['schedule.json'];
}