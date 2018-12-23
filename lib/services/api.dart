import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:newsapi/models/all-news-model.dart';
import 'package:newsapi/models/sources-model.dart';

import 'package:newsapi/models/top.dart';

Future<Top> fetchPost() async {
  final response = await http.get(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=038cbe741f2e4376aeda933ea65f80f1');

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    print(response);
    return Top.fromJson(responseJson);
  } else {
    throw Exception('Failed to load post');
  }
}


Future<AllNewsModel> fetchAllNews() async {
  final response = await http.get(
      'https://newsapi.org/v2/everything?pageSize=50&q=flutter&apiKey=038cbe741f2e4376aeda933ea65f80f1');

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    print(response);
    return AllNewsModel.fromJson(responseJson);
  } else {
    throw Exception('Failed to load post');
  }
}

Future<SourcesModel> fetchSources() async {
  final response = await http.get(
      'https://newsapi.org/v2/sources?apiKey=038cbe741f2e4376aeda933ea65f80f1');

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    print(response);
    return SourcesModel.fromJson(responseJson);
  } else {
    throw Exception('Failed to load post');
  }
}
