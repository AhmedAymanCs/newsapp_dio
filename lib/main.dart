import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/layouts/news_layout.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'package:newsapp/shared/network/local/shared_preference/cache_helper.dart';
import 'package:newsapp/shared/network/remote/dio_helper/dio_helper.dart';

import 'shared/blocObserver/blocObservert.dart';

void main()
async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
 await CacheHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AppCubit()..getBusiness()..getSports()..getScience(),
        ),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state)=>{},
        builder:(context,state)=> MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              actionsIconTheme: IconThemeData(
                color: Colors.black,
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.red,
                    statusBarIconBrightness: Brightness.dark,
              ),
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              elevation: 0,

            ),
            textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.red
            ),
          ),
          darkTheme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: HexColor('0c1a1a'),
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.black,
                statusBarIconBrightness: Brightness.light,
              ),
            ),
            scaffoldBackgroundColor:HexColor('0c1a1a'),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              elevation: 20,
              backgroundColor: HexColor('0c1a1a'),
              selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.grey,

            ),
            textTheme: TextTheme(
              bodyText1: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )
            ),
          ),
          themeMode: AppCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
          home: NewsLayout(),
        ),
      ),
    );
  }
}
