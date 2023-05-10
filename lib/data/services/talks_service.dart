import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';
import 'exceptions/network_exception.dart';
import 'service_constants.dart';

class TalksService {
  const TalksService();

  Future<List<Talk>> getTalks() async {
    final url = Uri.https(
      'wyjxbjikucgmxpgozvmi.supabase.co',
      '/rest/v1/talks',
      {'select': 'id,title,abstract,start_time,end_time,speakers(id,name,subtitle,image_url),stages(id,name)'},
    );

    final response = await http.get(url, headers: DevApiConstants.defaultHeaders);

    if (response.statusCode == 200) {
      final Iterable<dynamic> jsonArray = jsonDecode(response.body);
      return jsonArray.map((e) => Talk.fromJson(e)).toList();
    }

    throw NetworkException(
      statusCode: response.statusCode,
      message: response.body,
      url: url.toString(),
    );
  }
}
