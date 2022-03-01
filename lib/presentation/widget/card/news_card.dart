import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/entity/news_entity.dart';
import 'package:news_app/domain/router/news_router.dart';
import 'package:news_app/utils/navigation/navigation_helper.dart';

class NewsCard extends StatelessWidget {
  final NewsEntity newsEntity;
  final NewsRouter _newsRouter = NewsRouterImpl(
    navigationHelper: NavigationHelperImpl(),
  );

  NewsCard({Key? key, required this.newsEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        leading: newsEntity.urlToImage == null
            ? SizedBox(
                width: 100.w,
                child: const Center(
                  child: Icon(
                    Icons.error,
                  ),
                ),
              )
            : CachedNetworkImage(
                imageUrl: newsEntity.urlToImage!,
                width: 100.w,
                fit: BoxFit.fill,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(
                    Icons.error,
                  ),
                ),
              ),
        title: Text(
          newsEntity.title ?? "",
        ),
        subtitle: Text(newsEntity.author ?? ""),
        onTap: () => _newsRouter.navigateToDetailNews(
          newsEntity: newsEntity,
        ),
      ),
    );
  }
}
