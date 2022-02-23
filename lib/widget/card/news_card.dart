import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/model/news_data.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  const NewsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        leading: article.urlToImage == null
            ? SizedBox(
                width: 100.w,
                child: const Center(
                  child: Icon(
                    Icons.error,
                  ),
                ),
              )
            : CachedNetworkImage(
                imageUrl: article.urlToImage!,
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
          article.title ?? "",
        ),
        subtitle: Text(article.author ?? ""),
        // onTap: () => Navigator.pushNamed(context, DetailNewsPage.routeName,
        //     arguments: article),
      ),
    );
  }
}
