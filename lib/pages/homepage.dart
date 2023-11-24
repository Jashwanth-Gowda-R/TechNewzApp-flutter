import 'package:flutter/material.dart';
import 'package:tech_newz_app/repository/functions.dart';
import 'package:tech_newz_app/widgets/appbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppbar(),
    );
  }
}
