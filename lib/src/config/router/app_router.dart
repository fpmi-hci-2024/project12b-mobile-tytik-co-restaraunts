import 'package:auto_route/auto_route.dart';

import '../../feature/auth_page/presentation/sign_in_page.dart';
import '../../feature/home_page/presentation/home_page.dart';

part 'app_router.gr.dart';

final appRouter = AppRouter();

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
        ),
        AutoRoute(
          page: SignInRoute.page,
          path: '/sign_in',
          initial: true,
        ),
      ];
}
