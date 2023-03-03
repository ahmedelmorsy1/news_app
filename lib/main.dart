import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/components/network/remote/dio_helper.dart';
import './news_layout.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'modules/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  /*TODO:16.4*/ //here because we called init dio can't be null as it's filled when app starts
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //TODO:24 add bloc to toggle between dark and light themes
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener:(context ,state){} ,
        builder: (context , state){
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.amber, //the main color of the whole app
              //TODO:5 // for the whole app
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  //TODO:6 change status bar
                  backwardsCompatibility: false, // if true i can't control status bar
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness:Brightness.dark, //عشان الي statusBarColor white
                  ),
                  titleTextStyle: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold,),
                  //for colors of icons of appBar
                  iconTheme: IconThemeData(color: Colors.black,)
                  ),
                    textTheme: TextTheme(
                    headline6: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600,color: Colors.black),
                    bodyText1: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600,color: Colors.black),
                    ),
                  floatingActionButtonTheme: 
                  FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
                  //TODO:9  BottomNavigationBarThemeData not only theme
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.amber,
                    unselectedItemColor: Colors.grey,
                    elevation: 20.0,
                    backgroundColor: Colors.white,
                  )
            ),
            //TODO:15 themeMode
            //TODO:23 add propreties to darkTheme
            darkTheme: ThemeData(
               primarySwatch: Colors.amber, //the main color of the whole app
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.blueGrey,
                  elevation: 0.0,
                  backwardsCompatibility: false, // if true i can't control status bar
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.blueGrey,
                    statusBarIconBrightness:Brightness.light, //عشان الي statusBarColor white
                  ),
                  titleTextStyle: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold,),
                  //for colors of icons of appBar
                  iconTheme: IconThemeData(color: Colors.white,)
                  ),
                  floatingActionButtonTheme: 
                  FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
                  //TODO:9  BottomNavigationBarThemeData not only theme
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.amber,
                    unselectedItemColor: Colors.grey.shade100,
                    elevation: 20.0,
                    backgroundColor: Colors.blueGrey,
                  ),
                  textTheme: TextTheme(
                    headline6: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600,color: Colors.white),
                    bodyText1: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600,color: Colors.white),

                    ),
              scaffoldBackgroundColor:Colors.grey),
            //toggles between darkTheme and lightTheme
            //TODO:23
            //TODO:27 to toggle between dark and light using cubit
            themeMode: NewsCubit.get(context).isDark ?ThemeMode.dark:ThemeMode.light,
            home: NewsLayout());
      
        },
        ),
    );
  }
}
