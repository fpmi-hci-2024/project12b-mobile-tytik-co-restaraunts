import 'package:get_it/get_it.dart';
import 'package:monkey_delivery/src/core/widgets/config/common_widgets_theme.dart';
import 'package:monkey_delivery/src/feature/auth_page/presentation/config/auth_page_theme.dart';

import '../feature/cafe_page/presentation/config/cafe_page_theme.dart';
import '../feature/cart_page/presentation/config/cart_page_theme.dart';
import '../feature/home_page/presentation/config/home_page_theme.dart';

final locator = GetIt.instance;

Future<void> configureCommonDependencies() async {
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
}
