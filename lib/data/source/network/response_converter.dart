import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:my_reqres_login/data/source/network/model/response/error_response.dart';

import 'json_type_parser.dart';

class ResponseConverter extends JsonConverter {
  @override
  FutureOr<Response<ResultType>> convertResponse<ResultType, Item>(
      Response response) async {
    final jsonRes = await super.convertResponse<dynamic, dynamic>(response);
    if (jsonRes.body == null ||
        (jsonRes.body is String && (jsonRes.body as String).isEmpty)) {
      return jsonRes.copyWith(body: null);
    }
    final dynamic body = jsonRes.body!;
    final dynamic decodedItem = JsonTypeParser.decode<Item>(body);
    return jsonRes.copyWith<ResultType>(body: decodedItem as ResultType);
  }

  @override
  FutureOr<Response> convertError<ResultType, Item>(Response response) async {
    final jsonRes = await super.convertError(response);
    final dynamic body = jsonRes.body;
    final dynamic responseError = JsonTypeParser.decode<ErrorResponse>(body);
    return jsonRes.copyWith<ErrorResponse>(body: responseError);
  }
}
