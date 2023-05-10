import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ui/ui.dart';
import '../talks/state/talks_model.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/talk_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Builder(
        builder: (context) {
          return RefreshIndicator(
            onRefresh: () async => context.read<TalksModel>().getTalks(),
            child: CustomScrollView(
              slivers: [
                const HomeAppBar(),
                _talkList(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _talkList() {
    return Consumer<TalksModel>(
      builder: (context, model, child) {
        if (model.loading) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (model.errorMessage != null) {
          return SliverFillRemaining(
            child: Center(
              child: Text(model.errorMessage!),
            ),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => TalkListItem(talk: model.talks[index]),
            childCount: model.talks.length,
          ),
        );
      },
    );
  }
}
