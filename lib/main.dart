import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'core/constant/app_theme.dart';
import 'core/constant/approuter.dart';
import 'core/cubit_public/check_internet_cubit.dart';
import 'core/cubit_public/drop_down_cubit.dart';
import 'core/cubit_public/navigator_bottom_cubit.dart';
import 'core/storage/storage_handler.dart';
import 'feature/auth/login/presentation/bloc/login_bloc.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await StorageHandler().init();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      path: 'assets/translation',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<DropDownCubit>()),
        BlocProvider(create: (context) => di.sl<LoginCubit>()),
        BlocProvider(create: (context) => di.sl<NavigatorBottomCubit>()),
        BlocProvider(
            lazy: false,
            create: (context) =>
            di.sl<CheckInternetCubit>()..checkInternet(context)),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Task Manager',
              theme: getLightThem(context),
              routerConfig: AppRouter.router,
              supportedLocales: context.supportedLocales,
              themeMode: ThemeMode.light,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
            );
        },
      ),
    );
  }
}