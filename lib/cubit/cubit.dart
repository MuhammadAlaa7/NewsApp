import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/cubit/states.dart';
import 'package:http/http.dart' as http;
import 'package:newapp/models/article_model.dart';


class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(InitialState());
  static NewsCubit get(context)=> BlocProvider.of(context);
  String? selectedCategory;
  List<ArticleModel> data = [];
Future<List<ArticleModel>> getData() async {
  http.Response response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2022-01-16&sortBy=publishedAt&apiKey=ff978dce03944637884fe011dd70db94'));
  var body = json.decode(utf8.decode(response.bodyBytes));


    var jsonResult =  body['articles'] as List;
    
  var data =
  jsonResult.map((item) =>ArticleModel.fromJson(item)).toList();
  
  return data;
}


}
