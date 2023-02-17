import 'dart:convert';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'state_keeper.dart';

class UserStore extends StateKeeper {
  UserStore._();

  static final UserStore _instance = UserStore._();

  factory UserStore() => _instance;

  var token;

  Future refresh() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('APIToken') != null) {
      print(prefs.getString('RefreshToken'));
      var response = await http.post(
        Uri.parse("https://jugaad-sahi-hai.mustansirg.in/auth/token/refresh/"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "refresh": prefs.getString('RefreshToken'),
        }),
      );
      var data = jsonDecode(response.body);
      print("Refresh Response: " + data.toString());
      await prefs.setString('APIToken', data['access']);
      token = JwtDecoder.decode(data['access']).toString();
      print("Decoded After Refresh: " + token);
      notifyListeners();
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
      token = JwtDecoder.decode(APIToken.toString());
      print(token);
      notifyListeners();
      return true;
    } else {
      print("Failed to Login");
      print(response.body);
      return false;
    }
  }

  Future register({
    required String username,
    required String email,
    required String password1,
    required String password2,
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
        "username": username,
        "password1": password1,
        "password2": password2,
      }),
    );
    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      print(data);
      await prefs.setString('APIToken', data['access_token']);
      await prefs.setString('RefreshToken', data['refresh_token']);
      refresh();
      return true;
    } else {
      print("Failed to Register");
      print(response.body);
      return false;
    }
  }

// Future fetchPendingProviders() async {
//   pendingProviders = await QueryRepo().fetchPendingApprovals();
//   print(pendingProviders);
//   notifyListeners();
// }
//
// Future fetchPendingOrders(String? query) async {
//   orders = await QueryRepo().fetchOrders(query);
//   notifyListeners();
// }
//
// Future fetchNearestRestros(String? query) async {
//   restros = await QueryRepo().fetchRestros(query);
//   print(restros);
//   notifyListeners();
// }
//
// Future fetchCompletedProviders() async {
//   completedProviders = await QueryRepo().fetchCompletedApprovals();
//   print(completedProviders);
//   notifyListeners();
// }
}
