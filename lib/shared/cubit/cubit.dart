import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/business_screen/business_screen.dart';
import 'package:newsapp/modules/science_screen/science_screen.dart';
import 'package:newsapp/modules/sports_screen/sports_screen.dart';
import 'package:newsapp/shared/constants/constants.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'package:newsapp/shared/network/local/shared_preference/cache_helper.dart';
import 'package:newsapp/shared/network/remote/dio_helper/dio_helper.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(initialAppState());

static AppCubit get(context) => BlocProvider.of(context);

List<BottomNavigationBarItem> bottomNavItems= [
  BottomNavigationBarItem(
      icon: Icon(
        Icons.business
      ) ,
    label: 'Business'
  ),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.sports
      ) ,
    label: 'Sports'
  ),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.science
      ) ,
    label: 'Science'
  ),
];

List<Widget> Screens =[
Business_Screen(),
Sports_Screen(),
Science_Screen(),
];




int currentIndex=0;

void changeBottomNavBar(int index)
{
  currentIndex=index;
  emit(changeBottomNavState());
}



  void getBusiness()
   {
    emit(NewsLoadingState());

   DioHelper.dio!.get(
        'v2/top-headlines',
        queryParameters: {
          'country':'eg',
          'category':'business',
          'apiKey':'61c34e53ed6a4bafa31614493a52836c'
        }
        ).then((value)
    {
      business=value.data['articles'];
      emit(NewsGetBusnissSuccessState());
    }).catchError((error)
    {
      emit(NewsGetBusnissErrorState(error: error.toString()));
      print('ERROR in Get Business ${error.toString()}');

    }
    );
  }

  void getSports()
  {
  emit(NewsLoadingState());

  DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
          'country':'eg',
          'category':'sports',
          'apiKey':'61c34e53ed6a4bafa31614493a52836c',
       },
  ).then((value)
  {
    sports=value.data['articles'];
    emit(NewsGetBusnissSuccessState());
  }
  ).catchError((error)
  {
    emit(NewsGetSportsErrorState(error: error.toString()));
    print('ERROR in Get Sports ${error.toString()}');
  });
  }


  void getScience()
  {
  emit(NewsLoadingState());

  DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
          'country':'eg',
          'category':'science',
          'apiKey':'61c34e53ed6a4bafa31614493a52836c',
       },
  ).then((value)
  {
    science=value.data['articles'];
    emit(NewsGetScienceSuccessState());
  }
  ).catchError((error)
  {
    emit(NewsGetScienceErrorState(error: error.toString()));
    print('ERROR in Get Science ${error.toString()}');
  });
  }

  void getSearch(String value)
  {
    emit(NewsLoadingState());
    DioHelper.getData(
        url:'v2/everything' ,
        query:
        {
          'q':'$value',
          'apiKey':'67b69c2f81ac47ebb879550b825a1d1d',

        }
    ).then((value)
    {
      search=value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }
    ).catchError((error)
    {
      print('Error in search state ${error.toString()}');
      emit(NewsGetSearchErrorState());
    });
  }

  bool isDark=false;

void changeAppMode ()
{
  isDark=!isDark;
  CacheHelper.putboolen(value: isDark, key: 'isDark').then((value)
  {
    emit(changeAppModeState());
  }
  ).catchError((error)
  {
    print('Error in put shared preference');
  });
}



}