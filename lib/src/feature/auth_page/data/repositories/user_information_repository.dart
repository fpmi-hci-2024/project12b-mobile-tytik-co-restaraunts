import 'package:monkey_delivery/src/feature/auth_page/domain/data_sources/i_user_information_data_source.dart';
import 'package:monkey_delivery/src/feature/auth_page/domain/entities/user_information.dart';
import 'package:monkey_delivery/src/feature/auth_page/domain/repositories/i_user_information_repository.dart';

class UserInformationRepository implements IUserInformationRepository {
  final IUserInformationDataSource _userInformationDataSource;

  UserInformationRepository(this._userInformationDataSource);

  @override
  Future<UserInformation?> getUserInformation() async {
    return await _userInformationDataSource.getUserInformation();
  }

  @override
  void saveUserInformation(UserInformation information) {
    _userInformationDataSource.saveUserInformation(information);
  }
}
