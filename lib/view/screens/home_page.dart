import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/cubit/cubit.dart';
import 'package:newapp/cubit/dio.dart';
import 'package:newapp/cubit/states.dart';
import 'package:newapp/view/search_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){

        var cubit = NewsCubit.get(context);

        return    Scaffold(
          appBar: AppBar(
            title:const Text(
              'News App',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,

              ),
            ),
            actions: [
           IconButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder:(context)=> const SearchScreen(),),);
           },
             icon: const Icon(Icons.search,),),
           IconButton(
             onPressed: (){
               cubit.changeMode();
           },
             icon: const Icon(Icons.brightness_4,),),

            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
            currentIndex: cubit.currentIndex,
            onTap: (index){
                cubit.changeNav(index);
            },


          ),

        );
      },

    );
  }
}
