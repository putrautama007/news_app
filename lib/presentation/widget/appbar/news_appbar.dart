import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/model/news_data.dart';
import 'package:news_app/domain/router/news_router.dart';
import 'package:news_app/utils/navigation/navigation_helper.dart';

class NewsAppBar extends StatelessWidget {
  final Article article;
  final NewsRouter _newsRouter = NewsRouterImpl(
    navigationHelper: NavigationHelperImpl(),
  );

  NewsAppBar({Key? key, required this.article}) : super(key: key);

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
                        onTap: () => _newsRouter.navigateToDetailNews(
                          article: article,
                        ),
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
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Card(
                          color: Colors.blue,
                          margin: EdgeInsets.all(0),
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "New",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
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
