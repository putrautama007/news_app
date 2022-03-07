import 'package:component/component/widget/card/news_card.dart';
import 'package:flutter/material.dart';
import 'package:news_favorite/presentation/bloc/news_favorite_bloc.dart';
import 'package:news_favorite/presentation/bloc/news_favorite_state.dart';
import 'package:shared_library/flutter_bloc/flutter_bloc.dart';
import 'package:shared_library/flutter_screenutil/flutter_screenutil.dart';

class FavoriteNewsPage extends StatelessWidget {
  const FavoriteNewsPage({Key? key}) : super(key: key);

  Widget _buildList() {
    return BlocBuilder<NewsFavoriteBloc, NewsFavoriteState>(
      builder: (context, state) {
        if (state is NewsFavoriteLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewsFavoriteHasData) {
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(height: 2.h),
            shrinkWrap: true,
            itemCount: state.result.length,
            itemBuilder: (context, index) {
              return NewsCard(newsEntity: state.result[index]);
            },
          );
        } else if (state is NewsFavoriteError) {
          return Center(
            child: Text(
              state.message,
            ),
          );
        } else {
          return const Center(
            child: Text(
              'Empty Favorite News',
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
        title: const Text("Favorite News"),
      ),
      body: _buildList(),
    );
  }
}
