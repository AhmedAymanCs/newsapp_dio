
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/webview/webview_screen.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

Widget itemBuilder (List news) {

  return BlocConsumer<AppCubit,AppStates>(
    listener: (context,state)=>[],
    builder:(context,state)=> ConditionalBuilder(
      condition:state is NewsLoadingState ,
      builder:(context)=> Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.deepOrange,
        ),
      ),
         fallback: (context)=>ListView.separated(
        itemBuilder : (context,index) => GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=>webViewSreen(url: news[index]['url'])));
          },
          child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  height: 120,
                  width: 120,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            '${news[index]['urlToImage']}'
                        ),
                        fit: BoxFit.cover
                    ),

                  ),

                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${news[index]['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${news[index]['publishedAt']}',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
        ),
        itemCount: news.length,
        separatorBuilder:(context,index)=> Container(
          width: double.infinity,
        )),
    ),
  );



}
