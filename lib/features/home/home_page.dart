import 'package:flutter/material.dart';

import '../../data/models/talk.dart';
import '../../data/services/talks_service.dart';
import '../../ui/theme/app_colors.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/talk_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _talksService = TalksService();
  Future<List<Talk>>? _talksFuture;

  @override
  void initState() {
    super.initState();
    _talksFuture = _talksService.getTalks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          FutureBuilder<List<Talk>>(
            future: _talksFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
                return talkList(snapshot.data!);
              }

              // Return a progress indicator
              return const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ],
      ),
    );
  }

  SliverList talkList(List<Talk> talks) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => TalkListItem(talk: talks[index]),
        childCount: talks.length,
      ),
    );
  }
}
