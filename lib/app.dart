import 'package:flutter/material.dart';
import 'colors.dart';
import 'home.dart';
import 'login.dart';
import 'supplemental/cut_corners_border.dart';

// TODO: Convert ShrineApp to stateful widget (104)
class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      // TODO: Change home: to a Backdrop with a HomePage frontLayer (104)
      home: HomePage(),
      // TODO: Make currentCategory field take _currentCategory (104)
      // TODO: Pass _currentCategory for frontLayer (104)
      // TODO: Change backLayer field value to CategoryMenuPage (104)
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: _kShrineTheme,
      // TODO: Add a theme (103)
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const LoginPage(),
      fullscreenDialog: true,
    );
  }
}

final ThemeData _kShrineTheme =  _buildShrineTheme();
ThemeData _buildShrineTheme(){
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: kShrinePink100,
        onPrimary: kShrineBrown900,
        secondary: kShrineBrown900,
        error: kShrineErrorRed,
      ),
      textTheme: _buildShrineTextTheme(base.textTheme),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: kShrinePink100,
      ),
      inputDecorationTheme : const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: kShrineBrown900,
          ),
        ),
        border: CutCornersBorder(),
      ),
    );

}

TextTheme _buildShrineTextTheme(TextTheme base){
    return base.copyWith(
      headline5: base.headline5!.copyWith(
        fontWeight: FontWeight.w500,
      ),
      headline6: base.headline6!.copyWith(
        fontSize: 18.0,
      ),
      caption: base.caption!.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14.0
      ),
      bodyText1: base.bodyText1!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 16.0
      ),
    ).apply(
      fontFamily: 'Rubik',
      displayColor: kShrineBrown900,
      bodyColor: kShrineBrown900
    );
}




// TODO: Build a Shrine Theme (103)
// TODO: Build a Shrine Text Theme (103)
