import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/cubit/cubit.dart';
import 'package:newapp/cubit/states.dart';

import 'custom_widgets/custom_article_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon:const Icon(
                  Icons.arrow_back_ios,
                ),
                onPressed: () {
                  NewsCubit.get(context).search = [];
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ),
                    ),
                    child: TextFormField(
                      // initialValue: 'dddd',
                      keyboardAppearance: Brightness.dark,

                      controller: TextEditingController(),
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: InputBorder
                            .none, // to remove the line below the TFF
                        label: Text('search'),
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'search must not be empty';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        NewsCubit.get(context).getSearch(value);
                        //NewsCubit.get(context).clearSearch();
                      },
                    ),
                  ),
                  ConditionalBuilder(
                    condition: NewsCubit.get(context).search.isEmpty,  // if the list search is empty return the text .. else return list view
                    builder: (context) =>  Expanded(
                        child: Center(
                      child: Text(
                        'Type anything to search...',
                         style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )),
                    fallback: (context) => Expanded(
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              buildArticleItem(list[index], context),

                          /// list of index means a map here
                          separatorBuilder: (context, index) => Container(
                              width: double.infinity,
                              height: 1.0,
                              color: Colors.grey[400],
                              margin: const EdgeInsets.only(left: 20)),
                          itemCount: list.length),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
