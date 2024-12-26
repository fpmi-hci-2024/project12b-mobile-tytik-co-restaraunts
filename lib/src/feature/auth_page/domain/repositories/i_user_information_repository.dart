import '../entities/user_information.dart';

abstract interface class IUserInformationRepository {
  Future<UserInformation?> getUserInformation();

  void saveUserInformation(UserInformation information);
}
