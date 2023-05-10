import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ui/ui.dart';
import '../../ui/utils/context_extensions.dart';
import 'state/localization_model.dart';

class LocalizationButton extends StatelessWidget {
  const LocalizationButton({super.key});

  void _onLanguageSelected(BuildContext context, String locale) {
    final localization = context.read<LocalizationModel>();
    localization.setLocale(Locale(locale));
    Navigator.pop(context, 'en');
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        if (Platform.isIOS || Platform.isMacOS) {
          _showCupertinoActionSheet(context);
          return;
        }

        _showMaterialBottomSheet(context);
      },
    );
  }

  Future<void> _showCupertinoActionSheet(BuildContext context) async {
    await showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: Text(context.localizations.selectLanguage),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => _onLanguageSelected(context, 'en'),
            child: const Text('English'),
          ),
          CupertinoActionSheetAction(
            onPressed: () => _onLanguageSelected(context, 'nl'),
            child: const Text('Nederlands'),
          ),
        ],
      ),
    );
  }

  Future<void> _showMaterialBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: Insets.vertical16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('English'),
              onTap: () => _onLanguageSelected(context, 'en'),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Nederlands'),
              onTap: () => _onLanguageSelected(context, 'nl'),
            ),
          ],
        ),
      ),
    );
  }
}
