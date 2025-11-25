import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';
import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final theme = ThemeController();
  await theme.load(); // carga modo persistido

  final router = buildRouter(theme);

  runApp(MyApp(theme: theme, routerConfig: router));
}

class MyApp extends StatelessWidget {
  final ThemeController theme;
  final RouterConfig<Object> routerConfig;
  const MyApp({super.key, required this.theme, required this.routerConfig});

  @override
  Widget build(BuildContext context) {
    // AnimatedBuilder escucha al ChangeNotifier (theme) y recompone el árbol
    return AnimatedBuilder(
      animation: theme,
      builder: (context, _) {
        return MaterialApp.router(
          title: 'Flutter — go_router + Tema',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: theme.mode,
          routerConfig: routerConfig,
        );
      },
    );
  }
}