import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/models.dart';

class TalksService {
  Future<List<Talk>> getTalks() async {
    final talks = await rootBundle.loadStructuredData('assets/data/test_data.json', (json) async {
      // Json deserialization is one of the only places where it is ok to use dynamic
      final Iterable<dynamic> jsonArray = jsonDecode(json);
      return jsonArray.map((e) => Talk.fromJson(e)).toList();
    });

    return talks;
  }
}
