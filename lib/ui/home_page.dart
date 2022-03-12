import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/home/home_cubit.dart';
import 'package:news_app/bloc/home/home_state.dart';
import 'package:news_app/ui/favorite_news_page.dart';
import 'package:news_app/ui/news_list_page.dart';
import 'package:news_app/utils/strings/strings%20constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: IndexedStack(
              index: context.read<HomeCubit>().state.state,
              children: const [
                NewsListPage(),
                FavoriteNewsPage(),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 0,
                  blurRadius: 10,
                ),
              ],
            ),
            child: BottomNavigationBar(
              showUnselectedLabels: true,
              showSelectedLabels: true,
              onTap: (value) {
                context.read<HomeCubit>().changeTab(tabIndex: value);
              },
              currentIndex: context.read<HomeCubit>().state.state,
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.public),
                  label: StringConstants.news,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  label: StringConstants.favorite,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
