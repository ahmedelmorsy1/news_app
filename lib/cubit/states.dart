//TODO:1 define states

abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

/*TODO:13 used for onTAp with changeBottomNavBar method*/
class NewsBottomNavState extends NewsStates{}

//TODO:17.4 create states for emit the states to getbusiness method
class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{
  final String error ;

  NewsGetBusinessErrorState(this.error);
}

//TODO:19 create states for emit the states to getSports method
class NewsGetSportSuccessState extends NewsStates{}

class NewsGetSportErrorState extends NewsStates{
  final String error ;

  NewsGetSportErrorState(this.error);
}

//TODO:20 create states for emit the states to getScience method
class NewsGetScienceSuccessState extends NewsStates{}

class NewsGetScienceErrorState extends NewsStates{
  final String error ;

  NewsGetScienceErrorState(this.error);
}

//TODO:26
class NewsChangeModeState extends NewsStates{}