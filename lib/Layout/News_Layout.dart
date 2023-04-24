import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Modules/searchScreen/searchScreen.dart';
import 'package:news_app/Shared/Cubit/Cubit.dart';
import 'package:news_app/Shared/Cubit/States.dart';

class News_Layout extends StatelessWidget {
  const News_Layout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<News_Cupit,News_States>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = News_Cupit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:Text('News App',),
            actions: [
              IconButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return searchScreen();
                        }
                        ),
                    );
                  },
                  icon: Icon(Icons.search)
              ),
              IconButton(
                  onPressed: (){
                    News_Cupit.get(context).changeAppMode();
                  },
                  icon: Icon(
                      Icons.brightness_6_outlined
                  ),
              ),
            ],
          ),
          body: cubit.Screens[cubit.CurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.CurrentIndex,
              onTap: (index){
              cubit.ChangeBottomNav(index);
              },
              items: cubit.BottomItem
          ),
        );
      },
    );
  }
}
