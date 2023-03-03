import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/components/components.dart';
import 'package:todo_app/cubit/cubit.dart';
import 'package:todo_app/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*TODO:18.2 use Bloc to deal with apis*/
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        /*TODO:18.5 add list to get the data of the api */
        var list = NewsCubit.get(context).business;
        
        return articleBuilder(list);
        },
    );
  }
}
