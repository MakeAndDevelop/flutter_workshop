import 'package:flutter/material.dart';

import '../../../generated/assets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      elevation: 4,
      forceElevated: true,
      expandedHeight: 360,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: const Text('Talks'),
        background: Image.asset(
          Assets.imagesAppdevcon,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
