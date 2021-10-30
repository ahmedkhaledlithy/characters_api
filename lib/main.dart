import 'package:characters_api/app_routing.dart';
import 'package:characters_api/business_logic/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'constants/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(
    BlocProvider(
      create: (context) => ThemeCubit(),
      child: BreakingBadApp(
        appRouting: AppRouting(),
      ),
    ),
  );
}

class BreakingBadApp extends StatelessWidget {
  final AppRouting appRouting;

  const BreakingBadApp({Key? key, required this.appRouting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, state) {
        return MaterialApp(
          themeMode: state ? ThemeMode.dark : ThemeMode.light,
          darkTheme: AppThemes.darkTheme,
          theme: AppThemes.lightTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouting.generateRoute,
        );
      },
    );
  }
}
