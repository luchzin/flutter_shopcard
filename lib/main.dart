import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopcard/config/redux/action.dart';
import 'package:shopcard/config/redux/redux.dart';
import 'package:shopcard/config/router.dart';
import 'package:shopcard/config/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the app state (e.g., load theme from SharedPreferences)
  final store = await createStore();
  await _init(store);
  runApp(MainApp(
    store: store,
  ));
}

Future<void> _init(Store<AppState> store) async {
  // Initialize shared preferences and get saved theme
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedTheme =
      prefs.getString('app_theme') ?? 'light'; // Default to 'light' theme
  String? email = prefs.getString('email');
  // Fetch the current theme from the store
  String currentTheme = store.state.theme.toString();

  if (email != null) {
    store.dispatch(AuthSuccessAction(email));
  }
  // Initialize Redux store with the saved theme if different from the current theme
  if (currentTheme != savedTheme) {
    store.dispatch(ChangeThemeAction(theme: savedTheme));
  }
}

class MainApp extends StatefulWidget {
  final Store<AppState> store;

  const MainApp({super.key, required this.store});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final RouterConfig<Object> _routerConfig;

  @override
  void initState() {
    super.initState();
    _routerConfig = router(widget.store);
  }

  

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: StoreConnector<AppState, ThemeData>(
        distinct: true,
        converter: (store) {
        

          final theme = store.state.theme.name;
          return ThemeData(
              colorScheme: theme.toString() == "dark" ? darkTheme : lightTheme,
              appBarTheme: getAppBarTheme(theme == "dark"));
        },
        builder: (context, theme) {
          return MaterialApp.router(
            theme: theme,
            routerConfig: _routerConfig,
          );
        },
      ),
    );
  }
}
