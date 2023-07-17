import 'dart:convert';

// import 'package:hadith_app/feature/quran/model/sura_details_model.dart';
// import 'package:hadith_app/feature/quran/model/sura_list_model.dart';
import 'package:al_quran_mp3_offline/modules/quran_listening/model/sura_details_model.dart';
import 'package:al_quran_mp3_offline/modules/quran_listening/model/sura_list_model.dart';
import 'package:http/http.dart' as http;

class SuraService {
  List<SurahListModel> sura = [];
  Future<List<SurahListModel>> getSuraList() async {
    try {
      sura.clear();
      final response =
          await http.get(Uri.parse('https://api.alquran.cloud/v1/surah'));
      final body = json.decode(response.body);

      if (response.statusCode == 200) {
        body['data'].forEach((element) {
          if (sura.length < 114) {
            sura.add(SurahListModel.fromJson(element));
          }
        });
      }

      return sura;
    } catch (e) {
      throw Exception("Error getting sura: $e");
    }
  }

  Future<SuraDetailsModel> fetchSurah({
    required String languageCode,
    required String suraId,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://quranenc.com/api/v1/translation/sura/$languageCode/$suraId',
        ),
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
