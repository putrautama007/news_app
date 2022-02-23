import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/datasource/remote/news_datasource.dart';
import 'package:news_app/data/model/news_data.dart';
import 'package:news_app/network/api_helper_impl.dart';
import 'package:news_app/widget/appbar/news_appbar.dart';
import 'package:news_app/widget/card/news_card.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  late Future<NewsData> _news;

  @override
  void initState() {
    super.initState();
    _news = NewsDataSource(
      apiHelper: ApiHelperImpl(
        dio: Dio(),
      ),
    ).getListNews();
  }

  Widget _buildList() {
    return FutureBuilder(
      future: _news,
      builder: (context, AsyncSnapshot<NewsData> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            List<Article> article = snapshot.data!.articles!;
            return NestedScrollView(
              headerSliverBuilder: (context, isScrolled) {
                return [
                  NewsAppBar(article: article[0]),
                ];
              },
              body: ListView.separated(
                separatorBuilder: (context, index) => Divider(height: 2.h),
                shrinkWrap: true,
                itemCount: article.length,
                itemBuilder: (context, index) {
                  return NewsCard(article: article[index]);
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Text('');
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
      ),
      body: _buildList(),
    );
  }
}
