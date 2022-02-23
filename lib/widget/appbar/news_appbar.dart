import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/model/news_data.dart';

class NewsAppBar extends StatelessWidget {
  final Article article;

  const NewsAppBar({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: 300.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            article.urlToImage == null
                ? SizedBox(
                    child: const Center(
                      child: Icon(Icons.error),
                    ),
                    width: 1.sw,
                    height: 298.h,
                  )
                : Stack(
                    children: [
                      GestureDetector(
                        // onTap: () => Navigator.pushNamed(
                        //     context, DetailNewsPage.routeName,
                        //     arguments: article),
                        child: CachedNetworkImage(
                          height: 200.h,
                          width: 1.sw,
                          imageUrl: article.urlToImage!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => SizedBox(
                            child: const Center(
                                child: CircularProgressIndicator()),
                            height: 200.h,
                            width: 1.sw,
                          ),
                          errorWidget: (context, url, error) => SizedBox(
                            child: const Center(
                              child: Icon(Icons.error),
                            ),
                            width: 1.sw,
                            height: 200.h,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Card(
                          margin: const EdgeInsets.all(0),
                          shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "New",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            Container(
              padding: const EdgeInsets.all(5),
              height: 90.h,
              width: 1.sw,
              child: Center(
                child: Text(
                  article.title ?? "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            Divider(height: 2.h),
          ],
        ),
      ),
    );
  }
}
