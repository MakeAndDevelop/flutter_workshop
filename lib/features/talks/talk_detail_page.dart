import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../generated/app_localizations.dart';
import '../../../ui/theme/app_colors.dart';
import '../../../ui/theme/layout_constants.dart';
import '../../data/data.dart';
import 'state/talks_model.dart';

class TalkDetailPage extends StatefulWidget {
  final int talkId;

  const TalkDetailPage({super.key, required this.talkId});

  @override
  State<TalkDetailPage> createState() => _TalkDetailPageState();
}

class _TalkDetailPageState extends State<TalkDetailPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TalksModel>().selectTalk(widget.talkId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TalksModel>(
        builder: (context, model, child) {
          final talk = model.selectedTalk;

          if (talk == null && model.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (talk == null) {
            return Center(
              child: Text(model.errorMessage ?? 'Error'),
            );
          }

          return CustomScrollView(
            slivers: [
              TalkDetailsAppBar(talk: talk),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        talk.title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Spacing.vertical8,
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              AppLocalizations.of(context)!.date,
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacing.horizontal8,
                          Expanded(
                            child: Text(
                              DateFormat.yMd().format(talk.startTime),
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
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacing.horizontal8,
                          Expanded(
                            child: Text(
                              '${DateFormat.Hm().format(talk.startTime)} - ${DateFormat.Hm().format(talk.endTime)}',
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
                        talk.abstract,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
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
                  AppColors.background.withOpacity(0.5),
                  BlendMode.darken,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
