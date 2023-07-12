import 'package:flutter/material.dart';
import 'package:newsapp/shared/components/components.dart';
import 'package:newsapp/shared/constants/constants.dart';
import 'package:newsapp/shared/cubit/cubit.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                  ),
                  prefixIcon: Icon(Icons.search),
                  labelText: 'Search',
                ),
                validator: (value)
                {
                  if(value!.isEmpty)
                    {
                      return 'Search must be not empty';
                    }
                  return null;
                },
                onChanged: (value)
                {
                  AppCubit.get(context).getSearch(value.toString());
                },

              ),

            ),
            Expanded(
                child:itemBuilder(search) ),
          ],
        ),
      ),
    );
  }
}
