
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Modules/Business/Business_Screen.dart';
import 'package:news_app/Modules/Sceince/Sceince_Screen.dart';
import 'package:news_app/Modules/Sports/Sports_Screen.dart';
import 'package:news_app/Shared/Cubit/States.dart';
import 'package:news_app/Shared/network/Cach_Helper/cach_helper.dart';
import 'package:news_app/Shared/network/remote/Dio_Helper/Dio_Helper.dart';

class News_Cupit extends Cubit<News_States>{
  News_Cupit():super(NewsIntialState());

  static News_Cupit get(context) => BlocProvider.of(context);

  var CurrentIndex = 0;

  List<Widget> Screens = [
    Business_Screen(),
    Sports_Screen(),
    Sceince_Screen(),
  ];

List<BottomNavigationBarItem> BottomItem = [
  BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      label: 'Business'
  ),
  BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports'
  ),
  BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science'
  ),
];

void ChangeBottomNav(int index){
  CurrentIndex = index;

  emit(NewsBottomNavState());
}

List<dynamic> business = [];
List<dynamic> Sports = [];
List<dynamic> Science = [];
List<dynamic> Search = [];

void getBusiness(){
  emit(NewsGetBusinessLoadingState());
  DioHelper.getData(
      url: 'top-headlines',
      query: {
        'country': 'eg',
        'category':'business',
        'apiKey':'b45ddf9358514eb9854d28a5dffd3879',
      }
  ).then((value){
    // print([0]['title']);
    business =value.data['articles'];
    print(business[0]['title']);
    emit(NewsGetBusinessSuccessState()
    );
  }).catchError((Erorr){
    print('${Erorr.toString()}');
    emit(NewsGetBusinessErorrState(Erorr.toString()));
  });
}

void getScience(){
  emit(NewsGetScienceLoadingState());

  if(Science.length == 0){
    DioHelper.getData(
        url: 'top-headlines',
        query: {
          'country': 'eg',
          'category':'science',
          'apiKey':'b45ddf9358514eb9854d28a5dffd3879',
        }
    ).then((value){
      // print([0]['title']);
      Science =value.data['articles'];
      print(Science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((Erorr){
      print('${Erorr.toString()}');
      emit(NewsGetScienceErorrState(Erorr.toString()));
    });
  }else{
    emit(NewsGetScienceSuccessState());
  }
}

void getSport(){
  emit(NewsGetSportsLoadingState());

  if(Sports.length==0){
    DioHelper.getData(
        url: 'top-headlines',
        query: {
          'country': 'eg',
          'category':'sports',
          'apiKey':'b45ddf9358514eb9854d28a5dffd3879',
        }
    ).then((value){
      // print([0]['title']);
      Sports =value.data['articles'];
      print(Sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((Erorr){
      print('${Erorr.toString()}');
      emit(NewsGetSportsErorrState(Erorr.toString()));
    });
  }else{
    emit(NewsGetSportsSuccessState());
  }
}

void getSearch(String value){
  emit(NewsGetSearchLoadingState());
  DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q':'${value}',
        'apiKey':'b45ddf9358514eb9854d28a5dffd3879',
      }
  ).then((value){
    Search =value.data['articles'];
    print(Search[0]['title']);
    emit(NewsGetSearchSuccessState());
  }).catchError((Erorr){
    print(Erorr.toString());
    emit(NewsGetSearchErorrState(Erorr.toString()));
  });
}


  bool isDark = false;
  void changeAppMode({bool? isBlackMode}){
    if(isBlackMode != null){
      isDark = isBlackMode ;
      emit(ChangeAppMode());
    }else{
      isDark = !isDark;
      CachHelper.putData(value: isDark, key: 'isDark').then((value){
        emit(ChangeAppMode());
      });
    }
  }



}