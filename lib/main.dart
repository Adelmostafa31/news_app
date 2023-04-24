import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Layout/News_Layout.dart';
import 'package:news_app/Shared/Cubit/Cubit.dart';
import 'package:news_app/Shared/Cubit/States.dart';
import 'package:news_app/Shared/bloc_observer.dart';
import 'package:news_app/Shared/network/Cach_Helper/cach_helper.dart';
import 'package:news_app/Shared/network/remote/Dio_Helper/Dio_Helper.dart';
import 'package:news_app/Shared/styles/themes/ThemeData.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  CachHelper.init();
  runApp(MyApp(
    isDark: true,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp({required this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => News_Cupit()
        ..getBusiness()
        ..getSport()
        ..getBusiness()
        ..changeAppMode(),
      child: BlocBuilder<News_Cupit, News_States>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: LightTheme,
            darkTheme: darkTheme,
            themeMode: News_Cupit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: News_Layout(),
          );
        },
      ),
    );
  }
}
