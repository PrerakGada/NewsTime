import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Theme/app_colors.dart';
import '../stores/user_store.dart';

class Categories extends StatelessWidget {
  // final NavigationService _navigationService =
  //     get_it_instance_const<NavigationService>();

  // final bool isDrawer;
  static const id = '/CategoryRoute';
  Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CategoryItem(
                          imageUrl: 'assets/stats.png',
                          title: 'BUSINESS',
                          localCategories: [],
                        ),
                        CategoryItem(
                          imageUrl: 'assets/confetti.png',
                          title: 'ENTERTAINMENT',
                          localCategories: [],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CategoryItem(
                          imageUrl: 'assets/book.png',
                          title: 'GENERAL',
                          localCategories: [],
                        ),
                        CategoryItem(
                          imageUrl: 'assets/atom.png',
                          title: 'SCIENCE',
                          localCategories: [],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CategoryItem(
                          imageUrl: 'assets/cricket.png',
                          title: 'CRICKET',
                          localCategories: [],
                        ),
                        CategoryItem(
                          imageUrl: 'assets/football.png',
                          title: 'FOOTBALL',
                          localCategories: [],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CategoryItem(
                          imageUrl: 'assets/technology.png',
                          title: 'TECHNOLOGY',
                          localCategories: [],
                        ),
                        CategoryItem(
                          imageUrl: 'assets/ai.png',
                          title: 'ARTIFICIAL INTLI',
                          localCategories: [],
                        ),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     CategoryItem(
                    //       imageUrl: 'assets/football.png',
                    //       title: 'AUTOMOBILE',
                    //       localCategories: [],
                    //     ),
                    //     CategoryItem(
                    //       imageUrl: 'assets/football.png',
                    //       title: 'SCIENCE',
                    //       localCategories: [],
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     CategoryItem(
                    //       imageUrl: 'assets/football.png',
                    //       title: 'TRAVEL',
                    //       localCategories: [],
                    //     ),
                    //     CategoryItem(
                    //       imageUrl: 'assets/football.png',
                    //       title: 'FASHION',
                    //       localCategories: [],
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     CategoryItem(
                    //       imageUrl: 'assets/football.png',
                    //       title: 'EDUCATION',
                    //       localCategories: [],
                    //     ),
                    //     CategoryItem(
                    //       imageUrl: 'assets/football.png',
                    //       title: 'HEALTH',
                    //       localCategories: [],
                    //     ),
                    //     // CategoryItem(
                    //     //   imageUrl: 'assets/images/logo.png',
                    //     //   title: 'Fashion',
                    //     //   localCategories: categories,
                    //     // ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 8),
              child: MaterialButton(
                height: 42,
                minWidth: MediaQuery.of(context).size.width * 0.9,
                color: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () async {
                  // Provider.of<UserStore>(context, listen: false).updateCategory();
                  // _navigationService.goBack(data: {});
                },
                child: const Text(
                  'Apply',
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final List localCategories;
  final String title;
  final String imageUrl;

  const CategoryItem({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.localCategories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: (localCategories.contains(title))
                  ? AppColors.primary
                  : Colors.transparent,
              width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () {
            // Provider.of<UserStore>(context, listen: false)
            //     .changeLocalCategory(title);
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.width * 0.25,
            width: MediaQuery.of(context).size.width * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imageUrl,
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.black,
                      fontWeight: FontWeight.w700),
                ),
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: (localCategories.contains(title))
                //       ? const Icon(Icons.check_circle, color: AppColors.primary)
                //       : const Icon(Icons.circle_outlined),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
