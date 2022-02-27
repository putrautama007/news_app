import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/model/news_data.dart';

class DetailNewsPage extends StatelessWidget {
  final Article article;

  const DetailNewsPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      floatingActionButton: const FloatingActionButton(
        child: Icon(Icons.star_border),
        onPressed: null,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            article.urlToImage == null
                ? SizedBox(
                    height: 200.h,
                    child: const Icon(Icons.error),
                  )
                : CachedNetworkImage(
                    imageUrl: article.urlToImage!,
                    placeholder: (context, url) => SizedBox(
                      height: 200.h,
                      child: const CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => SizedBox(
                      height: 200.h,
                      child: const Icon(Icons.error),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.description ?? "",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    article.title ?? "",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    'Date: ${article.publishedAt}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Author: ${article.author}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    article.content ?? "",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
