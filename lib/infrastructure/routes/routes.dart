import 'package:providers/index.dart';

/// Navigator Key
final GlobalKey<NavigatorState> providerNavigatorKey =
    GlobalKey<NavigatorState>();

Map<String, WidgetBuilder> get routes {
  // ignore: no_leading_underscores_for_local_identifiers
  final Map<String, WidgetBuilder> _routes = <String, WidgetBuilder>{
    CartCheckoutPage.tag: (BuildContext context) => const CartCheckoutPage(),
    DashboardPage.tag: (BuildContext context) => const DashboardPage(),
  };
  return _routes;
}
