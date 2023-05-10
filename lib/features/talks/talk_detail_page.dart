import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../generated/app_localizations.dart';
import '../../../ui/theme/app_colors.dart';
import '../../../ui/theme/layout_constants.dart';
import '../../data/data.dart';

class TalkDetailPage extends StatefulWidget {
  final Talk talk;

  const TalkDetailPage({super.key, required this.talk});

  @override
  State<TalkDetailPage> createState() => _TalkDetailPageState();
}

class _TalkDetailPageState extends State<TalkDetailPage> {
  Talk get _talk => widget.talk;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          TalkDetailsAppBar(talk: widget.talk),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _talk.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Spacing.vertical8,
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          AppLocalizations.of(context)!.date,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacing.horizontal8,
                      Expanded(
                        child: Text(
                          DateFormat.yMd().format(_talk.startTime),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )
                    ],
                  ),
                  Spacing.vertical8,
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          AppLocalizations.of(context)!.time,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacing.horizontal8,
                      Expanded(
                        child: Text(
                          '${DateFormat.Hm().format(_talk.startTime)} - ${DateFormat.Hm().format(_talk.endTime)}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                    color: AppColors.accent,
                  ),
                  Text(
                    _talk.abstract,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TalkDetailsAppBar extends StatelessWidget {
  const TalkDetailsAppBar({
    super.key,
    required this.talk,
  });

  final Talk talk;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 360,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(talk.speaker.name),
        background: Hero(
          tag: 'speaker_${talk.speaker.id}',
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(talk.speaker.imageUrl),
                colorFilter: ColorFilter.mode(
                    AppColors.background.withOpacity(0.5), BlendMode.darken),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
