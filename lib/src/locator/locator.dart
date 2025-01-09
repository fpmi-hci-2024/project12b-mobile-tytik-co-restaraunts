import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:monkey_delivery/src/core/data/services/dio_service.dart';
import 'package:monkey_delivery/src/core/domain/services/i_dio_service.dart';
import 'package:monkey_delivery/src/core/widgets/config/common_widgets_theme.dart';
import 'package:monkey_delivery/src/feature/auth_page/domain/data_sources/i_user_information_data_source.dart';
import 'package:monkey_delivery/src/feature/auth_page/domain/repositories/i_user_information_repository.dart';
import 'package:monkey_delivery/src/feature/auth_page/presentation/config/auth_page_theme.dart';
import 'package:monkey_delivery/src/feature/auth_page/presentation/new_sign_in_bloc/new_sign_in_bloc.dart';
import 'package:monkey_delivery/src/feature/cafe_page/data/data_sources/remote_cafe_data_source.dart';
import 'package:monkey_delivery/src/feature/cafe_page/data/repositories/cafe_repositoty.dart';
import 'package:monkey_delivery/src/feature/cafe_page/domain/data_sources/i_cafe_data_source.dart';
import 'package:monkey_delivery/src/feature/cafe_page/domain/repositories/i_cafe_repository.dart';
import 'package:monkey_delivery/src/feature/cart_page/presentation/bloc/cart_bloc.dart';
import 'package:monkey_delivery/src/feature/history_page/data/data_sources/local_history_data_source.dart';
import 'package:monkey_delivery/src/feature/history_page/data/repositories/history_repositoty.dart';
import 'package:monkey_delivery/src/feature/history_page/domain/data_sources/i_history_data_source.dart';
import 'package:monkey_delivery/src/feature/history_page/domain/repositories/i_history_repository.dart';
import 'package:monkey_delivery/src/feature/history_page/presentation/bloc/history_bloc.dart';

import '../feature/auth_page/data/data_sources/user_information_data_source.dart';
import '../feature/auth_page/data/repositories/user_information_repository.dart';
import '../feature/cafe_page/presentation/bloc/cafe_bloc.dart';
import '../feature/cafe_page/presentation/config/cafe_page_theme.dart';
import '../feature/cart_page/presentation/config/cart_page_theme.dart';
import '../feature/home_page/data/data_sources/all_cafes_data_source.dart';
import '../feature/home_page/data/repositories/all_cafes_repository.dart';
import '../feature/home_page/domain/data_sources/i_all_cafes_data_source.dart';
import '../feature/home_page/domain/repositories/i_all_cafes_repository.dart';
import '../feature/home_page/presentation/bloc/home_bloc.dart';
import '../feature/home_page/presentation/config/home_page_theme.dart';

final locator = GetIt.instance;

Future<void> configureCommonDependencies() async {
  locator.registerSingleton<IDioService>(
    DioService(
      Dio(),
    ),
  );

  locator.registerSingleton<CommonWidgetsTheme>(
    CommonWidgetsTheme(),
  );

  locator.registerSingleton<AuthTheme>(
    AuthTheme(),
  );
  locator.registerSingleton<HomeTheme>(
    HomeTheme(),
  );
  locator.registerSingleton<CafeTheme>(
    CafeTheme(),
  );
  locator.registerSingleton<CartTheme>(
    CartTheme(),
  );
  locator.registerSingleton<ICafeDataSource>(
    RemoteCafeDataSource(
      locator<IDioService>(),
    ),
  );

  locator.registerSingleton<IHistoryDataSource>(
    LocalHistoryDataSource(),
  );
  locator.registerSingleton<ICafeRepository>(
    CafeRepository(
      locator<ICafeDataSource>(),
    ),
  );
  locator.registerFactory<CafeBloc>(
    () => CafeBloc(
      locator<ICafeRepository>(),
    ),
  );
  locator.registerSingleton<IAllCafesDataSource>(
    AllCafesDataSource(
      locator(),
    ),
  );
  locator.registerSingleton<IAllCafesRepository>(
    AllCafesRepository(
      locator<IAllCafesDataSource>(),
    ),
  );
  locator.registerFactory<HomeBloc>(
    () => HomeBloc(
      locator<IAllCafesRepository>(),
    ),
  );
  locator.registerSingleton<IUserInformationDataSource>(
    UserInformationDataSource(),
  );
  locator.registerSingleton<IUserInformationRepository>(
    UserInformationRepository(
      locator<IUserInformationDataSource>(),
    ),
  );
  locator.registerSingleton<IHistoryRepository>(
    HistoryRepository(
      locator<IHistoryDataSource>(),
    ),
  );
  locator.registerSingleton<NewSignInBloc>(
    NewSignInBloc(
      locator<IUserInformationRepository>(),
    ),
  );
  locator.registerFactory<CartBloc>(
    () => CartBloc(
      locator<IUserInformationRepository>(),
      locator<IHistoryRepository>(),
    ),
  );
  locator.registerFactory<HistoryBloc>(
    () => HistoryBloc(
      locator<IHistoryRepository>(),
    ),
  );
}
