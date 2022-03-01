import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation/bloc/news_list/news_list_bloc.dart';
import 'package:news_app/presentation/bloc/news_list/news_list_state.dart';
import 'package:news_app/presentation/widget/appbar/news_appbar.dart';
import 'package:news_app/presentation/widget/card/news_card.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  Widget _buildList() {
    return BlocBuilder<NewsListBloc, NewsListState>(
      builder: (context, state) {
        if (state is NewsListLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewsListHasData) {
          return NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return [
                NewsAppBar(newsEntity: state.result[0]),
              ];
            },
            body: ListView.separated(
              separatorBuilder: (context, index) => Divider(height: 2.h),
              shrinkWrap: true,
              itemCount: state.result.length,
              itemBuilder: (context, index) {
                return NewsCard(newsEntity: state.result[index]);
              },
            ),
          );
        } else if (state is NewsListError) {
          return Center(
            child: Text(
              state.message,
            ),
          );
        } else {
          return const Center(
            child: Text(
              '',
            ),
          );
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
