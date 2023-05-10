import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import '../../../ui/utils/context_extensions.dart';
import '../../authentication/auth_button.dart';
import '../../localization/localization_button.dart';

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
        title: Text(context.localizations.homeTitle),
        background: Image.asset(
          Assets.imagesAppdevcon,
          fit: BoxFit.cover,
        ),
      ),
      actions: const [
        AuthButton(),
        LocalizationButton(),
      ],
    );
  }
}
