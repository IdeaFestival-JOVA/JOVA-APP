import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _baseUrl = "https://port-0-jova-backend-m0kvtwm45b2f2eb2.sel4.cloudtype.app";
  static const String _authUrl = "$_baseUrl";
  static const String _tokenUrl = "$_baseUrl/auth/login";
  static const String _redirectUrl = "$_baseUrl/gsm";

  /// OAuth 로그인 시작
  static Future<Map<String, String>> signInWithOAuth(BuildContext context) async {
    try {
      final code = await _getAuthorizationCode(context);
      final tokens = await _getTokensFromCode(code);
      await _storeTokens(tokens);
      return tokens;
    } catch (e) {
      print('OAuth 로그인 실패: $e');
      rethrow;
    }
  }

  /// Authorization Code 요청
  static Future<String> _getAuthorizationCode(BuildContext context) async {
    String? code;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text("Login")),
          body: InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(_authUrl)),
            onLoadStart: (controller, url) {
              if (url != null && url.toString().startsWith(_redirectUrl)) {
                final uri = Uri.parse(url.toString());
                code = uri.queryParameters['code'];
                Navigator.of(context).pop();
              }
            },
          ),
        ),
      ),
    );

    if (code == null || code!.isEmpty) {
      throw Exception('Authorization code를 가져오지 못했습니다.');
    }

    print('Authorization code: $code');
    return code!;
  }

  /// Access Token과 Refresh Token 요청
  static Future<Map<String, String>> _getTokensFromCode(String code) async {
    final response = await http.post(
      Uri.parse(_tokenUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'code': code}),
    );

    print('POST $_tokenUrl');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'accessToken': data['accessToken'],
        'refreshToken': data['refreshToken'],
      };
    } else {
      throw Exception('토큰을 가져오지 못했습니다: ${response.body}');
    }
  }

  /// Access Token과 Refresh Token 저장
  static Future<void> _storeTokens(Map<String, String> tokens) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', tokens['accessToken'] ?? '');
    await prefs.setString('refreshToken', tokens['refreshToken'] ?? '');
  }

  /// 저장된 Access Token 가져오기
  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  /// 저장된 Refresh Token 가져오기
  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('refreshToken');
  }

  /// 로그아웃
  static Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
    await prefs.remove('refreshToken');
  }
}

/// 로그인 후 페이지 이동 처리
void signInAndNavigate(BuildContext context) async {
  try {
    final tokens = await AuthService.signInWithOAuth(context);
    Navigator.pushReplacementNamed(context, '/home', arguments: tokens);
  } catch (e) {
    print('로그인 실패: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('로그인에 실패했습니다. 다시 시도해주세요.')),
    );
  }
}
