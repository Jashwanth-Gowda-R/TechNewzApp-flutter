import 'package:flutter/material.dart';
import 'package:tech_newz_app/repository/functions.dart';
import 'package:tech_newz_app/utils/colors.dart';
import 'package:tech_newz_app/utils/constants.dart';
import 'package:tech_newz_app/widgets/appbar.dart';
import 'package:tech_newz_app/widgets/newsbox.dart';
import 'package:tech_newz_app/widgets/searchbar.dart';

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
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: const MyAppbar(),
      body: Column(
        children: [
          const MySearchBar(),
          Expanded(
            child: SizedBox(
              width: w,
              child: FutureBuilder<List>(
                future: fetchNews(),
                builder: (context, snapshot) {
                  // print('${snapshot.data} - main');
                  if (snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('Result not found'),
                    );
                  }

                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return NewsBox(
                          url: snapshot.data![index]['url'],
                          imageurl: snapshot.data![index]['urlToImage'] ??
                              Constants.imageurl,
                          title: snapshot.data![index]['title'],
                          time: snapshot.data![index]['publishedAt'],
                          description:
                              snapshot.data![index]['description'].toString(),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
