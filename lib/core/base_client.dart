// import 'dart:convert';
// import 'dart:developer';

// import 'package:al_quran_mp3_offline/core/api_string.dart';
// import 'package:al_quran_mp3_offline/core/utilities.dart';
// import 'package:dio/dio.dart';
// // import 'package:hajjapp/core/api_string.dart';
// // import 'package:hajjapp/core/utilities.dart';

// // import '../model/dua_model/core/api_string.dart';
// // import '../model/dua_model/core/utilities.dart';

// class BaseClient {
//   static Future<dynamic> getData({
//     required String api,
//     dynamic parameter,
//     String? apiVersion,
//   }) async {
//     // String username = 'admin';
//     // String password = '1234';
//     // String basicAuth =
//     //     'Basic ${base64.encode(utf8.encode('$username:$password'))}';
//     String apiV = apiVersion ?? AppStrings.kAPIVersion;
//     String url = AppStrings.kBaseUrl + apiV + api;
//     print('Sending request to: $url');
//     if (parameter != null) {
//       print("Parameter: $parameter");
//     }
//     try {
//       var response = await Dio().get(
//         url,
//         options: Options(
//             // headers: {
//             //   'Authorization': basicAuth,
//             // },
//             ),
//         queryParameters: parameter,
//       );
//       print('GET Method: ${response.statusCode}');
//       print(url);
//       log("GET Response:  ${jsonEncode(response.data)}");
//       return response.data;
//     } on DioError catch (e) {
//       print(e.toString());
//       Utilities.showSnackbar(
//         msg: AppStrings.kWentWrong,
//       );
//     }
//   }

//   static Future<dynamic> postData({
//     required String api,
//     dynamic body,
//     dynamic headers,
//     String? apiVersion,
//   }) async {
//     String username = 'admin';
//     String password = '1234';
//     String basicAuth =
//         'Basic ${base64.encode(utf8.encode('$username:$password'))}';

//     String apiV = apiVersion ?? AppStrings.kAPIVersion;
//     String url = AppStrings.kBaseUrl + apiV + api;
//     print('Sending request to: $url');
//     if (body != null) {
//       log("Post Body: $body");
//     }
//     try {
//       var response = await Dio().post(
//         url,
//         options: Options(
//           headers: {
//             'Authorization': basicAuth,
//           },
//         ),
//         data: body,
//       );
//       print('POST Method: ${response.statusCode}');
//       print(url);
//       log("POST Response:  ");
//       log(jsonEncode(response.data));

//       return response.data;
//     } on DioError catch (e) {
//       print(e.toString());
//       Utilities.showSnackbar(
//         msg: AppStrings.kWentWrong,
//       );
//     }
//   }
// }
