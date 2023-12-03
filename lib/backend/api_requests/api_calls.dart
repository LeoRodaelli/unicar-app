import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start unicar Group Code

class UnicarGroup {
  static String baseUrl = 'http://127.0.0.1:4567';
  static Map<String, String> headers = {};
  static CadastrarCarroCall cadastrarCarroCall = CadastrarCarroCall();
  static LoginCall loginCall = LoginCall();
  static CadastroDeUsuarioCall cadastroDeUsuarioCall = CadastroDeUsuarioCall();
  static BuscarCadastroDeUsuarioCall buscarCadastroDeUsuarioCall =
      BuscarCadastroDeUsuarioCall();
  static CadastroDaCaronaCall cadastroDaCaronaCall = CadastroDaCaronaCall();
}

class CadastrarCarroCall {
  Future<ApiCallResponse> call({
    String? model = '',
    String? color = '',
    String? plate = '',
    String? driverLicense = '',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "${model}",
  "color": "${color}",
  "plate": "${plate}",
  "driverLicense": "${driverLicense}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Cadastrar carro',
      apiUrl: '${UnicarGroup.baseUrl}/car',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
    "email": "${email}",
    "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${UnicarGroup.baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
}

class CadastroDeUsuarioCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? ra = '',
    String? phone = '',
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "ra": "${ra}",
  "phone": "${phone}",
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Cadastro de usuario',
      apiUrl: '${UnicarGroup.baseUrl}/register',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BuscarCadastroDeUsuarioCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Buscar cadastro de usuario',
      apiUrl: '${UnicarGroup.baseUrl}/profile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CadastroDaCaronaCall {
  Future<ApiCallResponse> call({
    String? origin = '',
    String? destiny = '',
    int? startTime,
    int? availableSeats,
    double? price,
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "origin": "${origin}",
  "destiny": "${destiny}",
  "startTime": "${startTime}",
  "availableSeats": ${availableSeats},
  "price": ${price}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Cadastro da carona',
      apiUrl: '${UnicarGroup.baseUrl}/ride',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End unicar Group Code

class LoginTestCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login test',
      apiUrl: 'http://127.0.0.1:4567/login',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
