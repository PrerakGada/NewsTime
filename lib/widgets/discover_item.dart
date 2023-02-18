import 'package:flutter/material.dart';

import '../screens/Explore/article_screen.dart';
import 'image_container.dart';

class DiscoverItem extends StatelessWidget {
  const DiscoverItem({
    super.key, this.currPost,
  });

  final currPost;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ArticleScreen.id);
      },
      child: Row(children: [
         ImageContainer(
          width: 80,
          imageUrl: currPost['image'],
          height: 80,
          decide: false,
          margin: EdgeInsets.all(10),
          borderRadius: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currPost['title'],
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.schedule,
                    size: 18,
                    // color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('${DateTime.now().hour} hours ago',
                      maxLines: 2,
                      style:
                      const TextStyle(fontSize: 12)),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.visibility,
                    // color: Colors.grey,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('300 views',
                      maxLines: 2,
                      style: TextStyle(fontSize: 12)),
                ],
              )
            ],
          ),
        )
      ],),
    );
  }
}