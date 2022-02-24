import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masrawy/constants.dart';
import 'package:masrawy/core/controllers/categories_tab_bar.dart';
import 'package:masrawy/core/controllers/connection.dart';
import 'package:masrawy/core/hiveHelper/hive_helper.dart';
import 'package:masrawy/core/router/router.dart';
import 'package:masrawy/views/splash/view.dart';
import 'package:masrawy/widgets/material_builder_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveHelper.init();
  runApp(
    // DevicePreview(
    //   builder: (context) =>

          MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ConnectionCubit()..listenConnectionState()),
        BlocProvider(create: (context) => CategoriesTabBarController()),
      ],
      child: MaterialApp(
        title: 'مصراوي',
        navigatorKey: navigatorKey,
        // Add the locale here

        onGenerateRoute: onGenerateRoute,
        darkTheme: darkTheme,
        theme: theme,

        debugShowCheckedModeBanner: false,
        builder: (context, child) => MaterialBuilderWidget(child),
        home: SplashView(),
      ),
    );
  }
}
