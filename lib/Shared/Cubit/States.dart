abstract class News_States {}

class NewsIntialState extends News_States {}

class NewsBottomNavState extends News_States {}

//Business
class NewsGetBusinessLoadingState extends News_States {}

class NewsGetBusinessSuccessState extends News_States{}

class NewsGetBusinessErorrState extends News_States{
  final String Erorr;
  NewsGetBusinessErorrState(this.Erorr);
}
//Sports
class NewsGetSportsLoadingState extends News_States {}

class NewsGetSportsSuccessState extends News_States{}

class NewsGetSportsErorrState extends News_States{
  final String Erorr;
  NewsGetSportsErorrState(this.Erorr);
}
//Science
class NewsGetScienceLoadingState extends News_States {}

class NewsGetScienceSuccessState extends News_States{}

class NewsGetScienceErorrState extends News_States{
  final String Erorr;
  NewsGetScienceErorrState(this.Erorr);
}
//Search
class NewsGetSearchLoadingState extends News_States {}

class NewsGetSearchSuccessState extends News_States{}

class NewsGetSearchErorrState extends News_States{
  final String Erorr;
  NewsGetSearchErorrState(this.Erorr);
}

class ChangeAppMode extends News_States{}