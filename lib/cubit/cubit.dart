//TODO:2 define cubit

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/components/network/remote/dio_helper.dart';
import 'package:todo_app/cubit/states.dart';
import 'package:todo_app/modules/business/business_screen.dart';
import 'package:todo_app/modules/science/science_screen.dart';
import 'package:todo_app/modules/sports/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates>{
  //TODO:3 here we must have a super
  NewsCubit():super(NewsInitialState());

  static NewsCubit get(context) =>BlocProvider.of(context);

  //TODO:8 for using BottomNavBar use index and list of items
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
       BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
       BottomNavigationBarItem(icon: Icon(Icons.sports_soccer),label: 'Sports'),
       BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
  ];

  /*TODO:14 make a list of screens*/
  List<Widget> screens = [BusinessScreen(),SportsScreen(),ScienceScreen()];

  /*TODO:13 for using onTap*/
  void changeBottomNavBar(int index){
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  //TODO:17.1
  List<dynamic> business = [];
  void getBusiness(){
    //TODO:17.2 getdata from api url
                DioHelper.getData(
                  url: 'v2/top-headlines',
                  query:{
                    'country':'eg',
                    'category':'business',
                    'apiKey':'8d9b227116e143f2886e0af4e6daf175',
                    } ,
                  ).then((value) {
                    //print(value.data.toString());
                    business = value.data['articles'];
                    print(business.length);
                    //TODO:17.5 emit getBusiness success and error
                    emit(NewsGetBusinessSuccessState());
                  }).catchError((error){
                    print(error.toString());
                    emit(NewsGetBusinessErrorState(error.toString()));
                  });
  }

//TODO:19.1
List<dynamic> sports = [];
  void getSport(){
    //TODO:19.8 check if there is data or not to use dio or not 
    //if there is no data dont use dio
    if(sports.length ==0){
      //TODO:19.2 getdata from api url
            DioHelper.getData(
              url: 'v2/top-headlines',
              query:{
                'country':'eg',
                'category':'sports',
                'apiKey':'8d9b227116e143f2886e0af4e6daf175',
                } ,
              ).then((value) {
                sports = value.data['articles'];
                emit(NewsGetSportSuccessState());
              }).catchError((error){
                print(error.toString());
                emit(NewsGetSportErrorState(error.toString()));
              });
      }else{
        //if there is data enter into dio
        emit(NewsGetSportSuccessState());
      }
  }

//TODO:20.1
List<dynamic> science = [];
  void getScience(){
     //TODO:20.8 check if there is data or not
     if(science.length == 0){
       //TODO:20.2 getdata from api url
            DioHelper.getData(
              url: 'v2/top-headlines',
              query:{
                'country':'eg',
                'category':'science',
                'apiKey':'8d9b227116e143f2886e0af4e6daf175',
                } ,
              ).then((value) {
                science = value.data['articles'];
              }).catchError((error){
                print(error.toString());
                emit(NewsGetScienceErrorState(error.toString()));
              });
     }else{emit(NewsGetScienceSuccessState());} 
  }

  //TODO:25
  ThemeMode appMode = ThemeMode.dark;
  bool isDark = false;

  void changeAppThemeMode(){
    isDark = !isDark;
    emit(NewsChangeModeState());
  }
}

