// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _MainRepository implements MainRepository {
  _MainRepository(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<void> getUserInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/users/2',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<VerifyResponse> verifyPhone(verifyPhoneRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(verifyPhoneRequest.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<VerifyResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v2/verify-phone',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VerifyResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<VerifyResponse> verifyOTP(verifyOTPRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(verifyOTPRequest.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<VerifyResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v2/verify-otp',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VerifyResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginResponse> login(loginRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginRequest.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/authentication/sign-in',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RegisterResponse> registerCustomer(registerRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(registerRequest.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RegisterResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/users/register-customer',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegisterResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RegisterResponse> registerBusiness(registerRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(registerRequest.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RegisterResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/users/register-business',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegisterResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RegisterResponse> registerShipper(registerRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(registerRequest.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RegisterResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/users/register-shipper',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegisterResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddressModel> getProvinces() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AddressModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/provinces',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddressModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddressModel> getDistricts(provinceId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AddressModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/districts/get-by-province-id/${provinceId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddressModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddressModel> getWards(districtId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AddressModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/wards/get-by-district-id/${districtId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddressModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddressSaved> getPickupAddresses() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AddressSaved>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/pickup-addresses',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddressSaved.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddressSaved> getDeliveryAddresses() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AddressSaved>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/delivery-addresses',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddressSaved.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OrderServiceResponse> getOrderService({
    pickupAddressId,
    pickupProvinceId,
    pickupDistrictId,
    deliveryAddressId,
    deliveryProvinceId,
    deliveryDistrictId,
    required type,
    required netWeight,
    required quantity,
    required length,
    required width,
    required height,
    declaredValue,
    loading,
    loadisInsureding,
    cod,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pickupAddressId': pickupAddressId,
      r'pickupProvinceId': pickupProvinceId,
      r'pickupDistrictId': pickupDistrictId,
      r'deliveryAddressId': deliveryAddressId,
      r'deliveryProvinceId': deliveryProvinceId,
      r'deliveryDistrictId': deliveryDistrictId,
      r'type': type,
      r'netWeight': netWeight,
      r'quantity': quantity,
      r'length': length,
      r'width': width,
      r'height': height,
      r'declaredValue': declaredValue,
      r'loading': loading,
      r'isInsured': loadisInsureding,
      r'cod': cod,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OrderServiceResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/price-lists/quote',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OrderServiceResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
