import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show immutable, ThemeData;

import '../../../../core/app_theme.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ThemeEvent>(_switchTheme);
  }

  void _switchTheme(ThemeEvent event, Emitter<ThemeState> emit) {
    if (state.theme == AppThemes.appThemeData[AppTheme.lightTheme]) {
      emit(
        state.copyWith(
            theme: AppThemes.appThemeData[AppTheme.darkTheme]!,
            isLightTheme: false),
      );
    } else {
      emit(state.copyWith(
          theme: AppThemes.appThemeData[AppTheme.lightTheme]!,
          isLightTheme: true));
    }
  }

  bool get isLightTheme =>
      state.theme == AppThemes.appThemeData[AppTheme.lightTheme] ? true : false;
}
