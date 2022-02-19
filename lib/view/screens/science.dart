import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/cubit/cubit.dart';
import 'package:newapp/cubit/states.dart';
import 'package:newapp/view/custom_widgets/custom_article_item.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var list = NewsCubit.get(context).science;
        return  ConditionalBuilder(
            condition: list.isNotEmpty,
            builder: (context){

              return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder:(context,index)=> buildArticleItem(list[index]) ,
                  separatorBuilder: (context,index)=>  Container(width: double.infinity,
                      height: 1.0,color: Colors.grey[400],
                      margin:EdgeInsets.only(left: 30)) ,
                  itemCount: list.length);
            },
            fallback: (context)=>const Center(child: CircularProgressIndicator()));
      },

    );
  }
}
