import '../entities/user_information.dart';

abstract interface class IUserInformationDataSource {
  Future<UserInformation> getUserInformation();

  void saveUserInformation(UserInformation information);
}
