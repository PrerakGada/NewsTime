import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  Future register({
    required String username,
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    // Register
    var response = await http.post(
      Uri.parse("https://jugaad-sahi-hai.mustansirg.in/auth/registration/"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "username": 'usersdnaee6emee',
        "password1": password,
        "password2": password,
      }),
    );
    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      print(data);
      await prefs.setString('APIToken', data['access_token']);
      await prefs.setString('RefreshToken', data['refresh_token']);

      // print(JwtDecoder.decode(data['access_token']));

      var response2 = await http.post(
        Uri.parse("https://jugaad-sahi-hai.mustansirg.in/auth/token/refresh/"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "refresh": data['refresh_token'],
        }),
      );
      var data2 = jsonDecode(response2.body);
      print("Refresh Response: " + data2.toString());
      await prefs.setString('APIToken', data2['access']);
      print("Decoded After Refresh: " +
          JwtDecoder.decode(data2['access']).toString());

      return true;
    } else {
      print("Failed to Register");
      print(response.body);
      return false;
    }
  }

  Future login({
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    // Register
    var response = await http.post(
      Uri.parse("https://jugaad-sahi-hai.mustansirg.in/auth/login/"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      print(data);
      await prefs.setString('APIToken', data['access_token']);
      await prefs.setString('RefreshToken', data['refresh_token']);

      final APIToken = prefs.getString('APIToken');
      print(JwtDecoder.decode(APIToken.toString()));

      return true;
    } else {
      print("Failed to Login");
      print(response.body);
      return false;
    }
  }
}
