import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:al_quran_mp3_offline/model/bookmarks_model.dart';
import 'package:al_quran_mp3_offline/modules/quran_listening/model/sura_list_model.dart';
import 'package:al_quran_mp3_offline/widgets/utils.dart';
import 'package:http/http.dart' as http;

class SurahListService {
  List<SurahListModel> sura = [];
  Future<List<SurahListModel>> getSuraList() async {
    try {
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

  Future<List<BookmarkModel>> getBookmarks({
    required String uID,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://islamicheartsofteners.com/api/v1/view-bookmark/$uID',
        ),
      );
      final body = json.decode(response.body);

      if (response.statusCode == 200) {
        return bookmarksModelFromJson(
          jsonEncode(body),
        );
        // body['data'].forEach((element) {
        //   if (sura.length < 114) {
        //     sura.add(SurahListModel.fromJson(element));
        //   }
        // });
      }

      return [];
    } catch (e) {
      throw Exception("Error getting sura: $e");
    }
  }

  Future<bool> addBookmark({
    required String uID,
    required String surahNo,
    required String surahName,
    required int scrollIndex,
  }) async {
    Methods.showLoading();
    try {
      final response = await http.post(
        Uri.parse(
          'https://islamicheartsofteners.com/api/v1/add-bookmark',
        ),
        body: {
          'customer_id': uID,
          'bookmark_title': 'Favorite',
          'surah_no': surahNo,
          'surah_name': surahName,
          'scroll_offset': '${scrollIndex.toDouble()}',
        },
      );
      final body = json.decode(response.body);
      print(body);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      throw Exception("Error getting sura: $e");
    } finally {
      Methods.hideLoading();
    }
  }

  Future<bool> deleteBookmark({
    required int bID,
  }) async {
    Methods.showLoading();
    try {
      final response = await http.get(
        Uri.parse(
          'https://islamicheartsofteners.com/api/v1/remove-bookmark/$bID',
        ),
      );
      final body = json.decode(response.body);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      throw Exception("Error getting sura: $e");
    } finally {
      Methods.hideLoading();
    }
  }
}
