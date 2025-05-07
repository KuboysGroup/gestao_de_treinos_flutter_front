// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:gestao_de_treinos_flutter_front/config/api/debug_server_config.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

String getDomain(String environment) {
  switch (environment) {
    case 'production':
      return 'http://192.168.1.101:8080';
    default:
      return debugServerAddress;
  }
}

class ApiRest {
  static const Duration timeoutDuration = Duration(seconds: 10);

  Uri buildUrl(String resource, [List<String>? paramList]) {
    const String environment =
        String.fromEnvironment('ENVIRONMENT', defaultValue: 'debug');
    final String domain = getDomain(environment);
    String params = '';
    if (paramList != null) {
      for (String param in paramList) {
        params += params.isEmpty ? '?$param' : '&$param';
      }
    }
    return Uri.parse('$domain/gestao-de-treinos$resource$params');
  }

  Map<String, String> getHeaders() {
    Map<String, String> headers = {};
    headers['Content-Type'] = 'application/json';
    return headers;
  }

  Future<dynamic> get(String resource, [List<String>? paramList]) async {
    http.Response response = await http
        .get(
          buildUrl(resource, paramList),
          headers: getHeaders(),
        )
        .timeout(timeoutDuration,
            onTimeout: () =>
                throw TimeoutException('Tempo limite da requisição excedido.'));
    return response;
  }

  Future<dynamic> post(String resource, [Object? body]) async {
    final String jsonBody = jsonEncode(body);
    http.Response response = await http
        .post(
          buildUrl(resource),
          headers: getHeaders(),
          body: jsonBody,
        )
        .timeout(timeoutDuration,
            onTimeout: () =>
                throw TimeoutException('Tempo limite da requisição excedido.'));
    return response;
  }

  Future<dynamic> put(String resource, [Object? body]) async {
    final String jsonBody = jsonEncode(body);
    http.Response response = await http
        .put(
          buildUrl(resource),
          headers: getHeaders(),
          body: jsonBody,
        )
        .timeout(timeoutDuration,
            onTimeout: () =>
                throw TimeoutException('Tempo limite da requisição excedido.'));
    return response;
  }

  Future<dynamic> delete(String resource, [Object? body]) async {
    http.Response response = await http
        .delete(
          buildUrl(resource),
          headers: getHeaders(),
        )
        .timeout(timeoutDuration,
            onTimeout: () =>
                throw TimeoutException('Tempo limite da requisição excedido.'));
    return response;
  }

  Future<dynamic> authenticate(String resource, [Object? body]) async {
    final String jsonBody = jsonEncode(body);
    const String environment =
        String.fromEnvironment('ENVIRONMENT', defaultValue: 'debug');
    final String domain = getDomain(environment);
    try {
      Response response = await http.post(
        Uri.parse('$domain/gestao-de-treinos/$resource'),
        headers: getHeaders(),
        body: jsonBody,
      );
      var decodedBody = utf8.decode(response.bodyBytes);
      return http.Response(decodedBody, response.statusCode,
          headers: response.headers);
    } catch (exception) {
      print('$exception');
      rethrow;
    }
  }
}
