import 'package:flutter/material.dart';

import '../../../data/data.dart';
import '../../../ui/ui.dart';
import '../../talks/talks.dart';

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