import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_news/presentation/bloc/bloc.dart';
import 'package:shared/common/common.dart';
import 'package:shared/widget/widget.dart';

class ListNewsPage extends StatelessWidget {
  Widget _buildList() {
    return BlocBuilder<ArticleBloc, ResultState>(
      builder: (context, state) {
        if (state is HasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.data.articles.length,
            itemBuilder: (context, index) {
              var article = state.data.articles[index];
              return CardArticle(
                article: article,
                onPressed: () => Modular.to.pushNamed(
                    Modular.get<NamedRoutes>().detailArticlePage,
                    arguments: article),
              );
            },
          );
        } else if (state is Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is Error) {
          return Center(child: Text(state.message));
        } else if (state is NoData) {
          return Center(child: Text(state.message));
        } else if (state is NoInternetConnection) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text(""));
        }
      },
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Modular.get<LocaleKeys>().listNewsTitle.tr()),
      ),
      body: _buildList(),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        transitionBetweenRoutes: false,
        middle: Text(Modular.get<LocaleKeys>().listNewsTitle.tr()),
      ),
      child: SafeArea(child: _buildList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<ArticleBloc>()..add(LoadData()),
      child: PlatformWidget(
        androidBuilder: _buildAndroid,
        iosBuilder: _buildIos,
      ),
    );
  }
}
