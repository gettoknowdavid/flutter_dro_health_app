import 'package:flutter/material.dart';

const Color primary = const Color(0xFFFFFFFF);
const Color primaryVariant = const Color(0xFFEDF2EC);
const Color secondary = const Color(0xFF9F5DE2);
const Color secondaryVariant = const Color(0xFF7B4397);
const Color accentColor = const Color(0xFF0CB8B6);
const Color grey = const Color(0xFF909090);

class AppTheme {
  static get theme {
    final base = ThemeData.light();

    ColorScheme colorScheme = ColorScheme.light(
      primary: secondary,
      primaryVariant: primaryVariant,
      onPrimary: secondary,
      secondary: secondary,
      secondaryVariant: secondaryVariant,
      onSecondary: primaryVariant,
    );

    return base.copyWith(
      primaryColor: secondary,
      accentColor: accentColor,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: primary,
      canvasColor: Colors.transparent,
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        buttonColor: secondary,
        hoverColor: secondary.withOpacity(0.7),
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      iconTheme: _iconTheme(base.iconTheme),
      accentIconTheme: _iconTheme(base.accentIconTheme),
      primaryIconTheme: _iconTheme(base.primaryIconTheme),
      textTheme: _textTheme(base.textTheme),
      accentTextTheme: _textTheme(base.accentTextTheme),
      primaryTextTheme: _textTheme(base.primaryTextTheme),
    );
  }
}

TextTheme _textTheme(TextTheme base) {
  return base
      .copyWith(
        headline3: base.headline3.copyWith(
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        headline4: base.headline4.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        headline5: base.headline5.copyWith(
          fontSize: 20,
        ),
        headline6: base.headline6.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        subtitle1: base.subtitle1.copyWith(color: Colors.black87),
        subtitle2: base.subtitle2.copyWith(
          color: grey,
          fontWeight: FontWeight.normal,
        ),
        button: base.button.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
      )
      .apply(fontFamily: 'ProximaNova');
}

IconThemeData _iconTheme(IconThemeData base) {
  return base.copyWith();
}
