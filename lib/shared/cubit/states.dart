abstract class AppStates {}

class initialAppState extends AppStates {}

class changeBottomNavState extends AppStates {}

class NewsLoadingState extends AppStates {}

class NewsGetBusnissSuccessState extends AppStates {}
class NewsGetBusnissErrorState extends AppStates {
  final error;
  NewsGetBusnissErrorState({
    this.error
});
}


class NewsGetSportsSuccessState extends AppStates {}
class NewsGetSportsErrorState extends AppStates {
  final error;
  NewsGetSportsErrorState({
    this.error
  });
}


class NewsGetScienceSuccessState extends AppStates {}
class NewsGetScienceErrorState extends AppStates {
  final error;
  NewsGetScienceErrorState({
    this.error
  });
}

class NewsGetSearchSuccessState extends AppStates {}
class NewsGetSearchErrorState extends AppStates {
  final error;
  NewsGetSearchErrorState({
    this.error
  });
}


class changeAppModeState extends AppStates{}