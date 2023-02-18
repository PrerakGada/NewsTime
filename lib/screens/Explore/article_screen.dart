import 'package:flutter/material.dart';
import 'package:news_time/Theme/app_colors.dart';
import 'package:news_time/widgets/image_container.dart';

import '../../widgets/custom_tag.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key, this.currPost});

  static const id = "/articleRoute";

  final currPost;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.currPost['image']);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () { Navigator.pop(context); },),
      ),
      body: Stack(
        children: [
          Image.network(widget.currPost['image'],width: MediaQuery.of(context).size.width),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                // scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        )),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTag(bg: AppColors.black, children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundImage: AssetImage("assets/female.png"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Politics',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColors.white,
                                  ),
                            )
                          ]),
                          const SizedBox(
                            width: 5,
                          ),
                          CustomTag(bg: Colors.grey.shade200, children: [
                            const Icon(
                              Icons.timer,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text('8 hours ago',
                                style: Theme.of(context).textTheme.bodyMedium!)
                          ]),
                          const SizedBox(
                            width: 5,
                          ),
                          CustomTag(bg: Colors.grey.shade200, children: [
                            const Icon(
                              Icons.remove_red_eye,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text('121 views',
                                style: Theme.of(context).textTheme.bodyMedium!)
                          ]),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          widget.currPost['title'],
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          widget.currPost['content'],
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(height: 1.5)),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Similiar from the feed',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontWeight: FontWeight.bold)),
                      ),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        // scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 2,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 1.25),
                        itemBuilder: (context, index) {
                          return ImageContainer(
                              width: MediaQuery.of(context).size.width * 0.42,
                              decide: true,
                              margin: EdgeInsets.only(right: 5, bottom: 5),
                              imageUrl:
                                  "https://i.guim.co.uk/img/media/fdec7ccbac99e998401759127a3b0109266a91e7/0_372_8640_5184/master/8640.jpg?width=1200&height=630&quality=85&auto=format&fit=crop&overlay-align=bottom%2Cleft&overlay-width=100p&overlay-base64=L2ltZy9zdGF0aWMvb3ZlcmxheXMvdGctbGl2ZS5wbmc&enable=upscale&s=59e90f8c384dde8443cebb9292f5e4e9");
                        },
                      )
                    ]),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}

class _NewsHeadline extends StatelessWidget {
  const _NewsHeadline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          CustomTag(bg: AppColors.grey.withAlpha(150), children: [
            Text(
              'Politics',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.white,
                  ),
            )
          ]),
          SizedBox(
            height: 10,
          ),
          Text(
            'Sanctus dolore sanctus consetetur nonumy invidunt rebum dolor duo clita. Eos magna diam ipsum est, dolor et no stet eos.',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                height: 1.25),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Dolor voluptua diam ea diam invidunt et no magna et ea. Takimata sit et at eos erat eirmod voluptua, dolor.',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.white, height: 1.25),
          ),
        ],
      ),
    );
  }
}
