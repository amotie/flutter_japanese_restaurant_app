part of 'theme_bloc.dart';

@immutable
class ThemeState extends Equatable {
  final ThemeData theme;
  final bool isLightTheme;

  const ThemeState({
    required this.theme,
    required this.isLightTheme,
  });

  factory ThemeState.initial() {
    return ThemeState(
        theme: AppThemes.appThemeData[AppTheme.darkTheme]!,
        isLightTheme: false);
  }

  @override
  List<Object?> get props => [theme];

  ThemeState copyWith({
    ThemeData? theme,
    bool? isLightTheme,
  }) {
    return ThemeState(
        theme: theme ?? this.theme,
        isLightTheme: isLightTheme ?? this.isLightTheme);
  }
}
