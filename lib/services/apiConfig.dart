import 'dart:convert';
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

final String baseUrl = "http://192.168.0.123/bharat_cargo";

Future<Map<dynamic, dynamic>> apiCallBack(
  String path, {
  String method = 'POST',
  Map<String, dynamic> body = const {},
}) async {
  final dio = Dio();
  Response response;
  final Directory appDocDir = await getApplicationDocumentsDirectory();
  final String appDocPath = appDocDir.path;
  final jar = PersistCookieJar(
    ignoreExpires: true,
    storage: FileStorage("$appDocPath/.cookies/"),
  );
  dio.interceptors.add(CookieManager(jar));

  final formData = FormData.fromMap(body);

  if (method == 'POST') {
    response = await dio.post(
      baseUrl + path,
      data: formData,
    );
  } else {
    response = await dio.get(baseUrl + path);
  }
  return jsonDecode(response.data);
}
