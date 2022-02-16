import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/cubit/cubit.dart';
import 'package:newapp/cubit/states.dart';
import 'package:newapp/view/custom_widgets/main_card.dart';
import 'package:newapp/view/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=> NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = NewsCubit.get(context);
          var deviceWidth = MediaQuery.of(context).size.width;
          var deviceHeight = MediaQuery.of(context).size.height;
          return  Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              backgroundColor: Colors.white,
              title: const Text(
                'News',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),),
            ),
            body: Column(

              children: [
               MainCard(
                 image: 'https://images.pexels.com/photos/3621104/pexels-photo-3621104.jpeg?crop=entropy&cs=srgb&dl=pexels-rfstudio-3621104.jpg&fit=crop&fm=jpg&h=1280&w=1920',
                 label: 'Sports',
                 onTap: (){
                 cubit.selectedCategory = 'sports';
                 NewsCubit.get(context).getData().then((value) {
                   cubit.data.addAll(value);
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  SecondScreen(data: value,)));
                 });
                 } ,
               )
              ],
            ),

          );
        },
      )

    );
  }
}

