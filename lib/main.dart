import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sba_theme.dart';
import 'models/models.dart';
import 'navigation/app_route_parser.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(const SbaApp());
}

class SbaApp extends StatefulWidget {
  const SbaApp({Key? key}) : super(key: key);

  @override
  State<SbaApp> createState() => _SbaAppState();
}

class _SbaAppState extends State<SbaApp> {
  final _profileManager = ProfileManager();
  final _appStateManager = AppStateManager();
  late AppRouter _appRouter;
  final routeParser = AppRouteParser();

  @override
  void initState() {
    _appRouter = AppRouter(
      profileManager: _profileManager,
      appStateManager: _appStateManager,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _profileManager,
        )
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = SbaTheme.dark();
          } else {
            theme = SbaTheme.light();
          }
          return MaterialApp.router(
            theme: theme,
            title: 'Fooderlich',
            backButtonDispatcher: RootBackButtonDispatcher(),
            routeInformationParser: routeParser,
            routerDelegate: _appRouter,
          );
        },
      ),
    );
  }
}
