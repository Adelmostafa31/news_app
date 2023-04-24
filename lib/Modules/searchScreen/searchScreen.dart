

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/Cubit/Cubit.dart';
import 'package:news_app/Shared/Cubit/States.dart';
import 'package:news_app/Shared/components/components.dart';

class searchScreen extends StatelessWidget {

  bool IsSearch = false;
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<News_Cupit,News_States>(
      listener: (context,state){},
      builder: (context,state){

        var list = News_Cupit.get(context).Search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: defaultFormField(
                    type: TextInputType.text,
                    label: 'Search',
                    controller: searchController,
                    Validatorfunction: (String? value){
                      if(value!.isEmpty){
                        return 'This Feild Must Not Be Embty';
                      }
                      return null;
                    },
                    prefix: Icons.search,
                    onChange: (value){
                      News_Cupit.get(context).getSearch(value);
                    }
                ),
              ),
              Expanded(child: list.length > 0 ?
              ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder:(context,index)=> BuildArticleItem(list[index],context),
                  separatorBuilder: (context, index) =>myDivide() ,
                  itemCount: News_Cupit.get(context).Search.length,
              ):Center(child: CircularProgressIndicator())
              ),
            ],
          ),
        );
      },
    );
  }
}
