import 'dart:convert' as dc;
import 'dart:io' as io;
import 'package:http/http.dart' as http;
import 'package:restapi/services/exception_services.dart';

//class for getting JSON data from the api
class ApiServices {
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = dc.jsonDecode(response.body);
        return jsonResponse;
      case 400:
        throw BadRequestException(
          response.body.toString(),
        );
      case 404:
        throw UnAuthorisedException(
          response.body.toString(),
        );
      default:
        throw FetchDataException("${response.statusCode.toString()} Error accured while communicating with server.");
    }
  }

  Future getApiData(String url) async {
    // dynamic responseJson;
    http.Response response;
    try {
      response = await http
          .get(
            Uri.parse(url),
          )
          .timeout(
            const Duration(seconds: 10),
          );
      returnResponse(response);

    } on io.SocketException {
      throw FetchDataException(": No internet connection");
    }
    return response;
  }
}
