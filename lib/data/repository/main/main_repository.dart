import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:retrofit/http.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/data/model/no_data/no_data_response.dart';

import 'endpoint.dart' as endpoint;

part 'main_repository.g.dart';

@RestApi()
abstract class MainRepository {
  factory MainRepository(
    Dio dio, {
    String baseUrl,
  }) = _MainRepository;

  @GET(endpoint.getUser)
  Future<void> getUserInfo();

  //addresss
  @GET(endpoint.getProvinces)
  Future<AddressModel> getProvinces();

  @GET(endpoint.getDistricts)
  Future<AddressModel> getDistricts(@Path('provinceId') int provinceId);

  @GET(endpoint.getWards)
  Future<AddressModel> getWards(@Path('districtId') int districtId);
}

extension ApiClientAWSS3 on MainRepository {
  Future<bool> uploadImage(String url, File image) async {
    try {
      final uri = Uri.parse(url);
      // resize before upload file
      final decodedImage = img.decodeImage(image.readAsBytesSync());
      if (decodedImage != null) {
        img.Image resizedImage = decodedImage;
        if (decodedImage.width > 800) {
          resizedImage = img.copyResize(decodedImage, width: 800);
        }

        Map<String, String> header = {};

        uri.queryParameters.forEach((k, v) {
          header[k] = v;
        });
        var response = await http.put(uri,
            body: img.encodeJpg(resizedImage), headers: header);
        log(response.body);
        if (response.statusCode == 200) {
          return true;
        }
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}

extension ApiClientHandleError on MainRepository {
  String mapDioErrorToMessage(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return 'Connection timeout';
      case DioErrorType.response:
        // Parsing error response to string error
        if (error.response != null) {
          final res = error.response;
          if (res?.data != null) {
            try {
              final response = NoDataResponse.fromJson(res?.data);
              return response.message;
            } catch (e) {
              return 'Common error (${res?.statusCode ?? ''})';
            }
          }
          return 'Common error (${res?.statusCode ?? ''})';
        }
        return 'Common error (${error.toString()})';
      case DioErrorType.cancel:
        return 'Request was cancelled unexpectedly';
      case DioErrorType.other:
        return error.message;
    }
  }
}
