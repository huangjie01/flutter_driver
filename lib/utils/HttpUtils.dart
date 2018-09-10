import 'package:http/http.dart' as http;
import 'dart:io';

class HttpUtils {
  /*
   *  get 请求
   */
  static void get(String url, Function successCallback, Function errorCallBack,
      Map<String, String> parmas) async {
    StringBuffer parmasBuffer = new StringBuffer("?");
    if (parmas != null && !parmas.isEmpty) {
      parmas.forEach((key, value) {
        parmasBuffer.write('$key' + '=' + '$value&');
      });
      String parmasString = parmasBuffer.toString();
      url = url + parmasString.substring(0, parmasString.length - 1);
    }
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == HttpStatus.ok && successCallback != null) {
        successCallback(response.body);
      } else if (errorCallBack != null) {
        errorCallBack();
      }
    } catch (e) {
      if (errorCallBack != null) {
        errorCallBack(e);
      }
    }
  }

/*
 * post 请求
 */
  static void post(String url, Function successCallBack, Function errorCallBack,
      Map<String, String> parmas) async {
    try {
      http.Response response = await http.post(url, body: parmas);
      if (response.statusCode == HttpStatus.ok && successCallBack != null) {
        successCallBack(response.body);
      } else if (errorCallBack != null) {
        errorCallBack();
      }
    } catch (e) {
      if (errorCallBack != null) {
        errorCallBack(e);
      }
    }
  }
}
