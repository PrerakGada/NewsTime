import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/preference_model.dart';
import '../stores/user_store.dart';
import '../widgets/custom_grid_view.dart';
import '../widgets/image_container.dart';

class LikedScreen extends StatefulWidget {
  const LikedScreen({super.key});
  static const id = '/preferenceRoute';

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen> {
  late List<Item> loadlist;
  late List<String> selectedList;
  late List<List<dynamic>> loaded;
  Future<List<dynamic>> callApis() async {
    var dio = Dio();

    dio.options.baseUrl = 'https://jugaad-sahi-hai.mustansirg.in/news/';
    dio.options.headers
        .addAll({'Authorization': 'Bearer ${UserStore().APIToken}'});

    final response = await dio.get('get_liked/');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return [];
    }
  }

  Future<Map<dynamic, dynamic>> getDtails(int id) async {
    var dio = Dio();

    dio.options.baseUrl = 'https://jugaad-sahi-hai.mustansirg.in/news/';
    dio.options.headers
        .addAll({'Authorization': 'Bearer ${UserStore().APIToken}'});

    final response = await dio.get('get_articles/${id}');
    if (response.statusCode == 200) {
      return response.data[0];
    } else {
      return {};
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // leading: const Center(
          //   child: FaIcon(
          //     FontAwesomeIcons.arrowLeft,
          //     color: Colors.white,
          //   ),
          // ),
          title: const Text(
            "What do you like?",
          ),
        ),
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 350,
                child: FutureBuilder(
                  future: callApis(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          return ListView.builder(
                            // gridDelegate:
                            //     const SliverGridDelegateWithFixedCrossAxisCount(
                            //         crossAxisCount: 2,
                            //         mainAxisExtent: 230,
                            //         crossAxisSpacing: 12,
                            //         mainAxisSpacing: 12,
                            //         childAspectRatio: 20),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,

                            itemBuilder: (context, index) {
                              return FutureBuilder(
                                future: getDtails(
                                    snapshot.data![index]["article_id"]),
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    default:
                                      if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}');
                                      } else if (snapshot.hasData) {
                                        return Container(
                                          width: size.width * 0.5,
                                          height: 100,
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ImageContainer(
                                                    width: size.width * 0.4,
                                                    imageUrl:
                                                        "${snapshot.data!["image"]}",
                                                    decide: true),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '${snapshot.data!["title"]}',
                                                  maxLines: 2,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          // color: AppColors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          height: 1.5),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    '${DateTime.now().hour} hours ago',
                                                    maxLines: 2,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!),
                                                Text('${snapshot.data!["id"]}',
                                                    maxLines: 2,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!),
                                              ]),
                                        );
                                      } else {
                                        return const Text("No data yet");
                                      }
                                  }
                                },
                              );
                              // return Container(
                              //   width: size.width * 0.1,
                              //   height: 100,
                              //   padding: EdgeInsets.only(right: 10),
                              //   child: Column(
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       children: [
                              //         ImageContainer(
                              //             width: size.width * 0.4,
                              //             imageUrl:
                              //                 "${snapshot.data![index]["urlToImage"]}",
                              //             decide: true),
                              //         const SizedBox(
                              //           height: 10,
                              //         ),
                              //         Text(
                              //           '${snapshot.data![index]["title"]}',
                              //           maxLines: 2,
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .bodyLarge!
                              //               .copyWith(
                              //                   // color: AppColors.black,
                              //                   fontWeight: FontWeight.bold,
                              //                   height: 1.5),
                              //         ),
                              //         const SizedBox(
                              //           height: 5,
                              //         ),
                              //         Text('${DateTime.now().hour} hours ago',
                              //             maxLines: 2,
                              //             style: Theme.of(context)
                              //                 .textTheme
                              //                 .bodySmall!),
                              //         Text(
                              //             '${snapshot.data![index]["source"]["name"]}',
                              //             maxLines: 2,
                              //             style: Theme.of(context)
                              //                 .textTheme
                              //                 .bodySmall!),
                              //       ]),
                              // );
                            },
                            itemCount: snapshot.data!.length,
                          );
                        } else {
                          return const Text("No data yet");
                        }
                    }
                  },
                ),
                // child:
              )

              // GridView.builder(
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 3,
              //     mainAxisExtent: 150,
              //   ),
              //   shrinkWrap: true,
              //   itemCount: preferences.length,
              //   itemBuilder: ((context, index) {
              //     return Column(
              //       children: [
              //         CircleAvatar(
              //           radius: 50,
              //           backgroundImage: AssetImage(prefImage[index]),
              //         ),
              //         Text(
              //           preferences[index],
              //           style: const TextStyle(
              //             fontSize: 17,
              //           ),
              //         ),
              //       ],
              //     );
              //   }),
              // ),,
              ,
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ]));
  }
}
