abstract class NewsStates{}

class InitialState extends NewsStates{}
class ChangeNavBarState extends NewsStates{}


class NewsGetBusinessSuccessState extends NewsStates{}
class  NewsLoadingBusinessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
  final String error;

  NewsGetBusinessErrorState(this.error);
}


class NewsGetScienceSuccessState extends NewsStates{}
class  NewsLoadingScienceState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{
  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsGetSportsSuccessState extends NewsStates{}
class  NewsLoadingSportsState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates{
  final String error;

  NewsGetSportsErrorState(this.error);
}


class NewsGetSearchSuccessState extends NewsStates{}
class  NewsLoadingSearchState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates{
  final String error;

  NewsGetSearchErrorState(this.error);
}


class NewsChangeModeState extends NewsStates{}

