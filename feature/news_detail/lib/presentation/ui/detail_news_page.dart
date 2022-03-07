import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/domain/entity/news_entity.dart';
import 'package:news_detail/presentation/bloc/news_detail_bloc.dart';
import 'package:news_detail/presentation/bloc/news_detail_event.dart';
import 'package:news_detail/presentation/bloc/news_detail_state.dart';
import 'package:shared_library/flutter_bloc/flutter_bloc.dart';

class DetailNewsPage extends StatelessWidget {
  final NewsEntity newsEntity;

  const DetailNewsPage({Key? key, required this.newsEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      floatingActionButton: BlocBuilder<NewsDetailBloc, NewsDetailState>(
        builder: (context, state) {
          return FloatingActionButton(
              child: state is RemoveBookmarkState
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border),
              onPressed: () {
                if (state is RemoveBookmarkState) {
                  context.read<NewsDetailBloc>().add(
                    RemoveBookmarkNews(
                      newsEntity: newsEntity,
                    ),
                  );
                } else {
                  context.read<NewsDetailBloc>().add(
                    AddBookmarkNews(
                      newsEntity: newsEntity,
                    ),
                  );
                }
              }
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            newsEntity.urlToImage == null
                ? SizedBox(
              height: 200.h,
              child: const Icon(Icons.error),
            )
                : CachedNetworkImage(
              imageUrl: newsEntity.urlToImage!,
              placeholder: (context, url) =>
                  SizedBox(
                    height: 200.h,
                    child: const CircularProgressIndicator(),
                  ),
              errorWidget: (context, url, error) =>
                  SizedBox(
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
                    newsEntity.description ?? "",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText2,
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    newsEntity.title ?? "",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6,
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    'Date: ${newsEntity.publishedAt}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .caption,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Author: ${newsEntity.author}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .caption,
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    newsEntity.content ?? "",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1,
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
