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

  if(index == 1 )
    getScience();

  if(index == 2 ) {
    getSports();
  }


  emit(ChangeNavBarState());
}



List<Widget> screens = [
  const BusinessScreen(),
  const ScienceScreen(),
  const SportsScreen(),

];

List<dynamic> business = [];
  void getBusiness(){
if(business.length == 0)
{
  emit(NewsLoadingBusinessState());
  DioHelper.getData(

      url: 'v2/top-headlines',
      query:{
        'country':'eg',
        'category':'business',
        'apiKey':'ff978dce03944637884fe011dd70db94',
      } ).then((value) {

    business = value.data['articles'];   // because articles is a list of map
    //print(business[0]['title']);

    emit(NewsGetBusinessSuccessState());
  }).catchError((error){
    // print(error.toString());
    emit(NewsGetBusinessErrorState(error.toString()));
  });
}
else { emit(NewsGetBusinessSuccessState()); }

}


List<dynamic> science = [];
  void getScience(){
    if(science.length == 0)
      {
        emit(NewsLoadingScienceState());
        DioHelper.getData(

            url: 'v2/top-headlines',
            query:{
              'country':'eg',
              'category':'science',
              'apiKey':'ff978dce03944637884fe011dd70db94',
            } ).then((value) {

          science = value.data['articles'];   // because articles is a list of map
          //print(business[0]['title']);

          emit(NewsGetScienceSuccessState());
        }).catchError((error){
          // print(error.toString());
          emit(NewsGetScienceErrorState(error.toString()));
        });
      }
    else
      {
        emit(NewsGetScienceSuccessState());
      }


}

List<dynamic> sports = [];
  void getSports(){
if(sports.length ==0 )
  {
    emit(NewsLoadingSportsState());
    DioHelper.getData(

        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'sports',
          'apiKey':'ff978dce03944637884fe011dd70db94',
        } ).then((value) {

      sports = value.data['articles'];   // because articles is a list of map
      //print(business[0]['title']);

      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      // print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }
else
  {
    emit(NewsGetSportsSuccessState());
  }

}












}