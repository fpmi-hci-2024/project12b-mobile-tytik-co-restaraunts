// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CafeRoute.name: (routeData) {
      final args = routeData.argsAs<CafeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CafePage(
          cafe: args.cafe,
          key: args.key,
        ),
      );
    },
    CartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
  };
}

/// generated route for
/// [CafePage]
class CafeRoute extends PageRouteInfo<CafeRouteArgs> {
  CafeRoute({
    required Cafe cafe,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CafeRoute.name,
          args: CafeRouteArgs(
            cafe: cafe,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CafeRoute';

  static const PageInfo<CafeRouteArgs> page = PageInfo<CafeRouteArgs>(name);
}

class CafeRouteArgs {
  const CafeRouteArgs({
    required this.cafe,
    this.key,
  });

  final Cafe cafe;

  final Key? key;

  @override
  String toString() {
    return 'CafeRouteArgs{cafe: $cafe, key: $key}';
  }
}

/// generated route for
/// [CartPage]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
