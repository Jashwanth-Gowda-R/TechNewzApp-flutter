import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tech_newz_app/utils/constants.dart';
import 'package:tech_newz_app/widgets/searchbar.dart';

Future<List> fetchNews() async {
  var url = Uri.parse(
    'https://newsapi.org/v2/top-headlines?country=in&category=technology&pageSize=100&apiKey=${Constants.apiKey}&q=${MySearchBar.searchcontroller.text}',
  );
  var response = await http.get(url);
  if (response.statusCode == 200) {
    final result = json.decode(response.body);
    debugPrint(result);
    return result['articles'];
  } else {
    throw 'Failed to get data';
  }
}
