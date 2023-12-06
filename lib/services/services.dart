import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class APICall {
  // AIzaSyC6yNtdqyNYlin0XHr0QXbKM94grrmWRto
  final apiBaseUri = "http://giant-slayer.itworkshop.in/backend/mob";
  // final apiBaseUri = 'http://192.168.29.172/giant-slayer/backend/mob';

  Future<dynamic> getRequest(
      String endPoint, Map<String, String> headers) async {
    var apiUrl = Uri.parse(apiBaseUri + endPoint);
    log("api $apiBaseUri$endPoint $headers");
    try {
      final apiResponse = await http.get(apiUrl, headers: headers);
      if (apiResponse.statusCode == 200) {
        final finalResponse = json.decode(apiResponse.body);
        print("decode ${json.decode(apiResponse.body)} ");
        return finalResponse;
      }
      if (apiResponse.statusCode == 401) {
        final finalResponse = json.decode(apiResponse.body);
        print("decode ${json.decode(apiResponse.body)} ");
        return finalResponse;
      }
    } catch (error) {
      throw error;
    }
  }

  // Future<dynamic> getRequestOther(String endPoint) async {
  //   var apiUrl = Uri.parse(apiBaseUri + endPoint);

  //   print("$apiBaseUri$endPoint");
  //   try {
  //     final apiResponse = await http.get(apiUrl);
  //     if (apiResponse.statusCode == 200) {
  //       final finalResponse = json.decode(apiResponse.body);
  //       print("decode ${json.decode(apiResponse.body)} ");
  //       return finalResponse;
  //     }
  //   } catch (error) {
  //     throw error;
  //   }
  // }

  Future<dynamic> postRequest(
      String endPoint, Map<String, String> headers, dynamic postData) async {
    var apiUrl = Uri.parse(
      apiBaseUri + endPoint,
    );
    log("API END POINT $apiBaseUri$endPoint");
    ;
    log(" post data${json.encode(postData)}");
    //encoded Data
    try {
      final apiResponse = await http.post(apiUrl,
          headers: headers, body: json.encode(postData));
      print("apiResponse $apiResponse");
      print("decode ${json.decode(apiResponse.body)} ");
      final finalResponse = json.decode(apiResponse.body);
      return finalResponse;
    } catch (error) {
      print("Error12345 $error");
      throw error;
    }
  }

  Future<dynamic> multiformPostRequest(
      endPoint, headers, Map<String, String> postData) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(apiBaseUri + endPoint));
    request.fields.addAll(postData);

    request.files
        .add(await http.MultipartFile.fromPath('trailer_video_url', ''));
    request.files
        .add(await http.MultipartFile.fromPath('trailer_thumbnail_url', ''));
    request.files.add(await http.MultipartFile.fromPath('main_video_url', ''));
    request.files
        .add(await http.MultipartFile.fromPath('main_thumbnail_url', ''));

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // return response;

        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      print("Error $error");
    }
  }
}
