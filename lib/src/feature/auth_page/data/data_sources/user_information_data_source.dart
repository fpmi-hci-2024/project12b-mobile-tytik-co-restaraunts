import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:monkey_delivery/src/feature/auth_page/domain/data_sources/i_user_information_data_source.dart';
import 'package:monkey_delivery/src/feature/auth_page/domain/entities/user_information.dart';

class UserInformationDataSource implements IUserInformationDataSource {
  static const String _userInformationKey = 'user_information';

  @override
  Future<UserInformation> getUserInformation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? userInfoString = prefs.getString(_userInformationKey);

    print(
        '::IK:: UserInformationDataSource.getUserInformation ${userInfoString}');

    if (userInfoString == null) {
      return const UserInformation.empty();
    }

    final Map<String, dynamic> userInfoJson = jsonDecode(userInfoString);
    return UserInformation(
      name: userInfoJson['name'] as String,
      address: userInfoJson['address'] as String,
    );
  }

  @override
  Future<void> saveUserInformation(UserInformation information) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String userInfoString = jsonEncode({
      'name': information.name,
      'address': information.address,
    });

    await prefs.setString(_userInformationKey, userInfoString);
  }
}
