import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/cubit/dio.dart';
import 'package:newapp/cubit/states.dart';
import 'package:newapp/view/screens/business.dart';
import 'package:newapp/view/screens/science.dart';
import 'package:newapp/view/screens/sports.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(InitialState());

  static NewsCubit get(context) => BlocProvider.of(context);




  int currentIndex = 0;
List<BottomNavigationBarItem> items = const[
  BottomNavigationBarItem(
    icon: Icon(
      Icons.business,
    ),
    label: 'business',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.science,
    ),
    label: 'science',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.sports_baseball,
    ),
    label: 'sports',
  ),
];
void changeNav(index){
  currentIndex = index;
  emit(ChangeNavBarState());
}



List<Widget> screens = [
  const BusinessScreen(),
  const ScienceScreen(),
  const SportsScreen(),

];

List<Map> business =[];

void getBusiness() {
  DioHelper.getData(url: 'v2/top-headlines', query: {
    'country': 'eg',
    'category': 'business',
    'apiKey': 'ff978dce03944637884fe011dd70db94',
  }).then((value) {
    print(value.data);
    business = value.data['articles'];
  }
  ).catchError((error) {
    print(error.toString());
  });
}
}