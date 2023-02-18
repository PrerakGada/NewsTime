import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Theme/app_colors.dart';
import '../services/get_it_service.dart';
import '../services/navigation_service.dart';
import '../stores/userStore.dart';

class Categories extends StatelessWidget {
  final NavigationService _navigationService =
      get_it_instance_const<NavigationService>();

  // final bool isDrawer;
  Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
          ),
          Consumer<UserStore>(builder: (_, userStore, __) {
            List categories = userStore.localCategories;
            return Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CategoryItem(
                          imageUrl: 'assets/images/categories/india.png',
                          title: 'INDIA',
                          localCategories: categories,
                        ),
                        CategoryItem(
                          imageUrl: 'assets/images/categories/business.png',
                          title: 'BUSINESS',
                          localCategories: categories,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CategoryItem(
                          imageUrl: 'assets/images/categories/sports.png',
                          title: 'SPORTS',
                          localCategories: categories,
                        ),
                        CategoryItem(
                          imageUrl: 'assets/images/categories/technology.png',
                          title: 'TECHNOLOGY',
                          localCategories: categories,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CategoryItem(
                          imageUrl: 'assets/images/categories/startup.png',
                          title: 'STARTUP',
                          localCategories: categories,
                        ),
                        CategoryItem(
                          imageUrl: 'assets/images/categories/politics.png',
                          title: 'POLITICS',
                          localCategories: categories,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CategoryItem(
                          imageUrl:
                              'assets/images/categories/entertainment.png',
                          title: 'ENTERTAINMENT',
                          localCategories: categories,
                        ),
                        CategoryItem(
                          imageUrl:
                              'assets/images/categories/international.png',
                          title: 'INTERNATIONAL',
                          localCategories: categories,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CategoryItem(
                          imageUrl: 'assets/images/categories/automobile.png',
                          title: 'AUTOMOBILE',
                          localCategories: categories,
                        ),
                        CategoryItem(
                          imageUrl: 'assets/images/categories/science.png',
                          title: 'SCIENCE',
                          localCategories: categories,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CategoryItem(
                          imageUrl: 'assets/images/categories/travel.png',
                          title: 'TRAVEL',
                          localCategories: categories,
                        ),
                        CategoryItem(
                          imageUrl: 'assets/images/categories/fashion.png',
                          title: 'FASHION',
                          localCategories: categories,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CategoryItem(
                          imageUrl: 'assets/images/categories/education.png',
                          title: 'EDUCATION',
                          localCategories: categories,
                        ),
                        CategoryItem(
                          imageUrl: 'assets/images/categories/health.png',
                          title: 'HEALTH',
                          localCategories: categories,
                        ),
                        // CategoryItem(
                        //   imageUrl: 'assets/images/logo.png',
                        //   title: 'Fashion',
                        //   localCategories: categories,
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
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
                Provider.of<UserStore>(context, listen: false).updateCategory();
                _navigationService.goBack(data: {});
              },
              child: const Text(
                'Apply',
                style: TextStyle(color: AppColors.white),
              ),
            ),
          ),
        ],
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
            Provider.of<UserStore>(context, listen: false)
                .changeLocalCategory(title);
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
