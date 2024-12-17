import 'package:get_it/get_it.dart';
import 'package:monkey_delivery/src/core/widgets/config/common_widgets_theme.dart';
import 'package:monkey_delivery/src/feature/auth_page/presentation/config/auth_page_theme.dart';

final locator = GetIt.instance;

Future<void> configureCommonDependencies() async {
  locator.registerSingleton<CommonWidgetsTheme>(
    CommonWidgetsTheme(),
  );

  locator.registerSingleton<AuthTheme>(
    AuthTheme(),
  );
}
