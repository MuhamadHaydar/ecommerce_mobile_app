
import 'dart:io';

class NetworkingUtils {

  // Check internet connection.
  static Future<bool> checkInternetConnection() async {
    try {
      final list = await InternetAddress.lookup('google.com');
      if (list.isNotEmpty && list[0].rawAddress.isNotEmpty) {

        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  static Map<String, String > getHeader (){
    return {
      "content-type":"application/json",
      "key":"123456"
    };
  }
}