import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/model/news_data.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  const NewsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SliverAppBar(
      expandedHeight: 400.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            article.urlToImage == null
                ? SizedBox(
                    child: const Center(
                      child: Icon(Icons.error),
                    ),
                    width: width,
                    height: 298.h,
                  )
                : Stack(
                    children: [
                      GestureDetector(
                        // onTap: () => Navigator.pushNamed(
                        //     context, DetailNewsPage.routeName,
                        //     arguments: article),
                        child: CachedNetworkImage(
                          height: 298.h,
                          width: width,
                          imageUrl: article.urlToImage!,
                          fit: BoxFit.contain,
                          placeholder: (context, url) => SizedBox(
                            child: const Center(
                                child: CircularProgressIndicator()),
                            height: 298.h,
                            width: width,
                          ),
                          errorWidget: (context, url, error) => SizedBox(
                            child: const Center(
                              child: Icon(Icons.error),
                            ),
                            width: width,
                            height: 298.h,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
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
              height: 100.h,
              width: width,
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
