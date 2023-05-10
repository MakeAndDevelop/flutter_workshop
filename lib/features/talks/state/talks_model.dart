import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../../../data/data.dart';
import '../../../data/services/exceptions/network_exception.dart';

class TalksModel extends ChangeNotifier {
  final TalksService _talksService;

  TalksModel() : _talksService = const TalksService();

  // For injecting a mock service
  //TalksModel.test(this._talksService);

  List<Talk> _talks = [];
  List<Talk> get talks => _talks;

  Talk? _selectedTalk;
  Talk? get selectedTalk => _selectedTalk;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> getTalks() async {
    try {
      _setLoading(true);
      _talks = await _talksService.getTalks();
      _errorMessage = null;
    } on NetworkException catch (e) {
      _errorMessage = e.message ?? '';
    } on SocketException catch (e) {
      _errorMessage = e.message;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> selectTalk(int talkId) async {
    if (selectedTalk?.id == talkId) {
      return;
    }

    if (talks.isEmpty) {
      await getTalks();
    }

    if (talks.any((element) => element.id == talkId)) {
      _selectedTalk = _talks.firstWhere((talk) => talk.id == talkId);
      notifyListeners();
      return;
    }

    // This should be localized
    _errorMessage = 'Talk not found';
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }
}
