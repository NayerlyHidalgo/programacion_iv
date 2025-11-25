import 'package:go_router/go_router.dart';
import 'core/theme/theme_controller.dart';
import 'features/home/home_page.dart';
import 'features/detail/detail_page.dart';

GoRouter buildRouter(ThemeController theme) {
  return GoRouter(
    // refresca MaterialApp.router cuando cambie el tema
    refreshListenable: theme,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(theme: theme),
      ),
      GoRoute(
        path: '/detail/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '—';
          return DetailPage(id: id);
        },
      ),
    ],
  );
}
