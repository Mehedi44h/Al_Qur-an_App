import 'dart:convert';

List<BookmarkModel> bookmarksModelFromJson(String str) =>
    List<BookmarkModel>.from(
        json.decode(str).map((x) => BookmarkModel.fromJson(x)));

String bookmarksModelToJson(List<BookmarkModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookmarkModel {
  final int id;
  final String customerId;
  final String bookmarkTitle;
  final String surahName;
  final String surahNo;
  final String scrollOffset;

  BookmarkModel({
    required this.id,
    required this.customerId,
    required this.bookmarkTitle,
    required this.surahName,
    required this.surahNo,
    required this.scrollOffset,
  });

  factory BookmarkModel.fromJson(Map<String, dynamic> json) => BookmarkModel(
        id: json["id"],
        customerId: json["customer_id"],
        bookmarkTitle: json["bookmark_title"],
        surahName: json["surah_name"],
        surahNo: json["surah_no"],
        scrollOffset: json["scroll_offset"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "bookmark_title": bookmarkTitle,
        "surah_name": surahName,
        "surah_no": surahNo,
        "scroll_offset": scrollOffset,
      };
}
