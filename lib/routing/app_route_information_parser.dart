import 'package:droidconit_21_flutter_simple_demo/routing/app_route_path.dart';
import 'package:flutter/widgets.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    if (routeInformation.location == null) {
      return AppRoutePath.error();
    }

    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return AppRoutePath.todoList();
    }

    if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'todo') {
      return AppRoutePath.todoDetail(int.parse(uri.pathSegments[1]));
    } else {
      return AppRoutePath.error();
    }
  }

  @override
  RouteInformation restoreRouteInformation(AppRoutePath configuration) {
    if (configuration.isErrorPage) {
      return RouteInformation(location: '/error');
    } else if (configuration.isTodoListPage) {
      return RouteInformation(location: '/');
    } else {
      return RouteInformation(location: '/todo/${configuration.selectedTodoId}');
    }
  }
}
