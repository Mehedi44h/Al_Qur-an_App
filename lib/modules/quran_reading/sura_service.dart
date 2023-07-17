import 'dart:async';
import 'dart:convert';
import 'package:al_quran_mp3_offline/modules/quran_listening/model/sura_details_model.dart';
import 'package:http/http.dart' as http;

// import '../models/sura_details_model.dart';

class SuraService {
  Future<SuraDetailsModel> fetchSurah({
    required String languageCode,
    required String suraId,
  }) async {
    String apiLink = 'https://quranenc.com/api/v1/translation/sura/';
    if (languageCode.isNotEmpty) {
      apiLink = '$apiLink$languageCode/';
    }
    if (suraId.isNotEmpty) {
      apiLink = apiLink + suraId;
    }
    print(apiLink);
    try {
      final response = await http.get(
        Uri.parse(apiLink),
      );

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        final surah = SuraDetailsModel.fromJson(parsed);

        return surah;
      } else {
        throw Exception('Failed to load surah');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
