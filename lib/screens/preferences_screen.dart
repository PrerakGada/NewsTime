import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/preference_model.dart';
import '../stores/user_store.dart';
import '../widgets/custom_grid_view.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});
  static const id = '/preferenceRoute';

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  late List<Item> loadlist;
  late List<String> selectedList;
  Future<bool> callApis(List<String> data) async {
    var dio = Dio();
    print(["List", "Hi"]);

    dio.options.baseUrl = 'https://jugaad-sahi-hai.mustansirg.in/news/';
    dio.options.headers
        .addAll({'Authorization': 'Bearer ${UserStore().APIToken}'});

    final response = await dio.get('preferences/?preferences=${data}');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  List preferences = [
    "Night Owl",
    "Early Bird",
    "Studious",
    "Fitness Freak",
    "Sporty",
    "Wanderer",
    "Party Lover",
    "Vegan",
    "Non-Alcoholic",
    "Music Lover",
    "Non-Smoker",
    "Pet Lover",
  ];
  List prefImage = [
    "",
    "",
    "",
    "",
    "",
    "",
    "assets/images/musical-note.png",
    "assets/images/non-smoking-room.png",
    "assets/images/cat.png",
  ];
  @override
  void initState() {
    super.initState();
    loadList();
  }

  loadList() {
    loadlist = [];
    selectedList = [];
    loadlist.add(Item("assets/stats.png", 1, 'Business'));
    loadlist.add(Item("assets/confetti.png", 2, 'Entertainment'));
    loadlist.add(Item("assets/book.png", 3, 'General'));
    loadlist.add(Item("assets/coronavirus.png", 4, 'Coronavirus'));
    loadlist.add(Item("assets/atom.png", 5, 'Science'));
    loadlist.add(Item("assets/cricket.png", 6, 'Cricket'));
    loadlist.add(Item("assets/football.png", 7, 'Football'));
    loadlist.add(Item("assets/technology.png", 8, 'Technology'));
    loadlist.add(Item("assets/ai.png", 9, 'Artifical Intelligence'));
  }

  @override
  Widget build(BuildContext context) {
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
              GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: loadlist.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 100,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: GridItem(
                                item: loadlist[index],
                                isSelected: (bool value) {
                                  setState(() {
                                    if (value) {
                                      selectedList.add(
                                          loadlist[index].ammenity.toString());
                                    } else {
                                      selectedList.remove(loadlist[index]);
                                    }
                                  });
                                  // print("$index : $value");
                                },
                                key: Key(loadlist[index].rank.toString())),
                          ),
                          Text("${loadlist[index].ammenity}")
                        ],
                      ),
                    );
                  }),
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
              // ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () async {
                    print(selectedList);
                    bool done = await callApis(selectedList);
                    // locationData.changeAdStatus(true);
                    // Navigator.push(
                    //   context,
                    //   PageTransition(
                    //     child: const NavigationScreen(currentIndex: 1),
                    //     type: PageTransitionType.fade,
                    //   ),
                    // );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Submit',
                      style: TextStyle(letterSpacing: 2, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
