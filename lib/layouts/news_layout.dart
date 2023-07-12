import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/search/search_screen.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state) {},
      builder:(context,state)=> Scaffold(
        appBar: AppBar(
              title: Text(
                'News App',
              ),
          actions: [
            IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()
                ));
              },
              icon: Icon(
                Icons.search
              ),
            ),
            IconButton(
                onPressed: (){
                  AppCubit.get(context).changeAppMode();
                },
                icon: Icon(
                  Icons.brightness_6_outlined
                ))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: AppCubit.get(context).bottomNavItems,
          onTap: (index)
          {
            AppCubit.get(context).changeBottomNavBar(index);
          },
          currentIndex: AppCubit.get(context).currentIndex,
        ),
        body: AppCubit.get(context).Screens[AppCubit.get(context).currentIndex],
      ),
    );
  }
}
