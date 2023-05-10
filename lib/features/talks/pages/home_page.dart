import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../ui/theme/app_colors.dart';
import '../data/talks_service.dart';
import '../widgets/home_app_bar.dart';
import 'talk_detail_page.dart';

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

class TalkListItem extends StatelessWidget {
  final Talk talk;

  const TalkListItem({
    super.key,
    required this.talk,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => TalkDetailPage(talk: talk),
        ),
      ),
      horizontalTitleGap: 16,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      dense: false,
      title: Text(
        talk.title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: Text(
        talk.speaker.name,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      leading: Hero(
        tag: 'speaker_${talk.speaker.id}',
        child: Container(
          height: double.infinity,
          width: 56,
          padding: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.accent, width: 2),
            image: DecorationImage(
              image: NetworkImage(talk.speaker.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
