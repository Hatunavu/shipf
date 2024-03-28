import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:retrofit/http.dart';
import 'package:shipf/data/model/account/account_model.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/data/model/auth/auth.dart';
import 'package:shipf/data/model/no_data/no_data_response.dart';
import 'package:shipf/data/model/order/order.dart';
import 'package:shipf/data/model/order/order_service.dart';
import 'package:shipf/data/model/post/post_request.dart';
import 'package:shipf/data/model/post/post_response.dart';
import 'package:shipf/data/model/shipment/shipment_response.dart';
import 'package:shipf/data/model/shipment/shipment_summary.dart';
import 'package:shipf/data/model/shipment/shipment_update_request.dart';
import 'package:shipf/data/model/token/token_request.dart';
import 'package:shipf/data/model/transit/transit_response.dart';
import 'package:shipf/data/model/transit/transit_summary.dart';

import 'endpoint.dart' as endpoint;

part 'main_repository.g.dart';

@RestApi()
abstract class MainRepository {
  factory MainRepository(
    Dio dio, {
    String baseUrl,
  }) = _MainRepository;

  @GET(endpoint.getUser)
  Future<void> getUser();

  //auth
  @POST(endpoint.verifyPhone)
  Future<VerifyResponse> verifyPhone(@Body() VerifyRequest verifyPhoneRequest);

  @POST(endpoint.verifyOTP)
  Future<VerifyResponse> verifyOTP(@Body() VerifyRequest verifyOTPRequest);

  @POST(endpoint.login)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST(endpoint.registerCustomer)
  Future<RegisterResponse> registerCustomer(
      @Body() RegisterRequest registerRequest);

  @POST(endpoint.registerBusiness)
  Future<RegisterResponse> registerBusiness(
      @Body() RegisterRequest registerRequest);

  @POST(endpoint.registerShipper)
  Future<RegisterResponse> registerShipper(
      @Body() RegisterRequest registerRequest);

  @DELETE(endpoint.deleteUser)
  Future<RegisterResponse> deleteUser();

  @POST(endpoint.postDeviceToken)
  Future<NoDataResponse> postDeviceToken();

  @POST(endpoint.forgetPass)
  Future<NoDataResponse> forgetPass(
      @Body() ForgetPassRequest forgetPassRequest);

  //addresss
  @GET(endpoint.getProvinces)
  Future<AddressModel> getProvinces();

  @GET(endpoint.getDistricts)
  Future<AddressModel> getDistricts(@Path('provinceId') int provinceId);

  @GET(endpoint.getWards)
  Future<AddressModel> getWards(@Path('districtId') int districtId);

  @GET(endpoint.getPickupAddresses)
  Future<AddressSaved> getPickupAddresses();

  @GET(endpoint.getDeliveryAddresses)
  Future<AddressSaved> getDeliveryAddresses();

  //order
  @GET(endpoint.getOrderService)
  Future<OrderServiceResponse> getOrderService({
    @Query('pickupAddressId') int? pickupAddressId,
    @Query('pickupProvinceId') int? pickupProvinceId,
    @Query('pickupDistrictId') int? pickupDistrictId,
    @Query('deliveryAddressId') int? deliveryAddressId,
    @Query('deliveryProvinceId') int? deliveryProvinceId,
    @Query('deliveryDistrictId') int? deliveryDistrictId,
    @Query('type') required String type,
    @Query('netWeight') required int netWeight,
    @Query('quantity') required int quantity,
    @Query('length') required int length,
    @Query('width') required int width,
    @Query('height') required int height,
    @Query('declaredValue') int? declaredValue,
    @Query('loading') String? loading,
    @Query('isInsured') bool? isInsured,
    @Query('cod') int? cod,
    @Query('shipmentId') int? shipmentId,
  });

  @POST(endpoint.createOrder)
  Future<OrderResponse> createOrder(@Body() OrderRequest orderRequest);

  @PUT(endpoint.updateOrder)
  Future<OrderResponse> updateOrder(
      {@Body() required OrderRequest orderRequest,
      @Path('shipmentId') required int shipmentId});

  @PUT(endpoint.updateOrderStatus)
  Future<OrderResponse> updateOrderStatus(
      {@Path('orderId') required int orderId,
      @Body() required UpdateOrderStatusRequest updateOrderRequest});

  //account
  @GET(endpoint.getUserInfo)
  Future<AccountResponse> getUserInfo();

  //shipment
  @GET(endpoint.getShipments)
  Future<ShipmentResponse> getShipments({
    @Query('page') int? page,
    @Query('size') int? size,
    @Query('search') String? search,
    @Query('orderKey') String? orderKey,
    @Query('orderBy') String? orderBy,
    @Query('fromDate') String? fromDate,
    @Query('toDate') String? toDate,
    @Query('shipmentStatusCode') String? shipmentStatusCode,
  });

  @GET(endpoint.getShipmentDetail)
  Future<ShipmentDetail> getShipmentDetail(
      {@Path('shipmentId') required int shipmentId});

  @GET(endpoint.getShipmentSummary)
  Future<ShipmentSummaryResponse> getShipmentSummary();

  @PUT(endpoint.updateShipmentStatus)
  Future<NoDataResponse> updateShipmentStatus(
      {@Body() required List<ShipmentUpdateRequest> shipmentUpdateRequest});

  //transit
  @GET(endpoint.getTransits)
  Future<TransitResponse> getTransits({@Query('type') String? type});

  @GET(endpoint.getTransitDetail)
  Future<TransitDetail> getTransitDetail(
      {@Path('transitId') required int transitId});

  @GET(endpoint.getTransitSummary)
  Future<TransitSummaryResponse> getTransitSummary();

  @PUT(endpoint.acceptTransit)
  Future<NoDataResponse> acceptTransit(
      {@Path('transitId') required int transitId});

  @PUT(endpoint.cancelTransit)
  Future<NoDataResponse> cancelTransit(
      {@Path('transitId') required int transitId});

  //token
  @POST(endpoint.sendDeviceToken)
  Future<NoDataResponse> sendDeviceToken(
      {@Body() required TokenRequest tokenRequest});

  //post
  @GET(endpoint.getPost)
  Future<PostResponse> getPost({
    @Query('page') int? page,
    @Query('size') int? size,
    @Query('search') String? search,
    @Query('orderKey') String? orderKey,
    @Query('orderBy') String? orderBy,
    @Query('fromDate') String? fromDate,
    @Query('toDate') String? toDate,
    @Query('tonnage') String? tonnage,
    @Query('pickupProvinceIds') List<String>? pickupProvinceIds,
    @Query('deliveryProvinceIds') List<String>? deliveryProvinceIds,
    @Query('status') String? status,
    @Query('isOwner') bool? isOwner,
  });

  @POST(endpoint.createPost)
  Future<NoDataResponse> createPost({@Body() required PostRequest postRequest});

  @GET(endpoint.getPostSaved)
  Future<PostResponse> getPostSaved({
    @Query('page') int? page,
    @Query('size') int? size,
    @Query('search') String? search,
    @Query('orderKey') String? orderKey,
    @Query('orderBy') String? orderBy,
    @Query('fromDate') String? fromDate,
    @Query('toDate') String? toDate,
    @Query('tonnage') String? tonnage,
    @Query('pickupProvinceIds') List<String>? pickupProvinceIds,
    @Query('deliveryProvinceIds') List<String>? deliveryProvinceIdstoDate,
    @Query('status') String? status,
  });

  @PUT(endpoint.updatePost)
  Future<NoDataResponse> updatePost(
      {@Path('id') required int id, @Body() required PostRequest postRequest});
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
