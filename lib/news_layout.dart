import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/cubit.dart';
import 'package:todo_app/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO:10 create BlocProvider &cubit &BlocConsumer
    return BlocProvider(
      //NewsCubit created here
      //TODO:17.6 important to getbusiness  and all screens at firtst time so list is being created
      create: (BuildContext context) => NewsCubit()..getBusiness()..getSport()..getScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          //builder returns the design
          //TODO:11 var cubit
          var cubit = NewsCubit.get(context);
          return Scaffold(
            //TODO:7 add text and bottomNavBar
            appBar: AppBar(
              title: Text('News App'),
              actions: [
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              //TODO:22 add settings icon in the appBar
             IconButton(icon: Icon(Icons.brightness_4_outlined), onPressed: () {
               NewsCubit.get(context).changeAppThemeMode();
             }),],
            ),
            //TODO:17 make the fab
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                //TODO:17.3 get method
                cubit.getBusiness();
              },
              child: Icon(Icons.add),
            ),
            /*TODO:14 add the body*/
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              //TODO:12 get bottomNavBarItems &currentindex from cubit
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItems,
              onTap: (index) {
                cubit.changeBottomNavBar(index);/*TODO:13 onTap using cubit and states*/
              },
            ),
          );
        },
      ),
    );
  }
}
