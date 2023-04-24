
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/Cubit/Cubit.dart';
import 'package:news_app/Shared/Cubit/States.dart';
import 'package:news_app/Shared/components/components.dart';


class Business_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<News_Cupit,News_States>(
        listener: (context,state){},
      builder: (context,state){
          var list = News_Cupit.get(context).business;
          return Container(
            child: list.length > 0 ?
              ListView.separated(
                physics: BouncingScrollPhysics(),
              itemBuilder:(context,index)=> BuildArticleItem(list[index],context),
              separatorBuilder: (context, index) =>myDivide() ,
              itemCount: News_Cupit.get(context).business.length
          ): Center(child: CircularProgressIndicator())

        );
      },
    );
  }
}
