import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/cubit/cubit.dart';
import 'package:newapp/cubit/states.dart';
import 'package:newapp/models/article_model.dart';

import 'custom_widgets/main_card.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({
    required this.data
});
  List<ArticleModel> data = [];
  @override
  Widget build(BuildContext context) {

    return  BlocProvider(
      create: (context)=> NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
          listener: (context,NewsStates state){},
          builder: (context,NewsStates state){
            var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('${cubit.selectedCategory} news '),
            ),
            body: ListView.separated(
                itemBuilder: (context,index)=>Container(
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        child: Image.network(data[index].image!),
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          data[index].title!
                        ),
                      ),
                    ],
                  ),
                ) ,
                separatorBuilder: (context,index) => Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[400],
          ) ,
                itemCount: data.length,
            ),
          );
        }

      ),
    );
  }


}
