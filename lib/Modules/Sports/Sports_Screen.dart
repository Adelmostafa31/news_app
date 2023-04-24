
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/Cubit/Cubit.dart';
import 'package:news_app/Shared/Cubit/States.dart';
import 'package:news_app/Shared/components/components.dart';

class Sports_Screen extends StatelessWidget {
  const Sports_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<News_Cupit,News_States>(
      listener: (context,state){},
      builder: (context,state){
        var list = News_Cupit.get(context).Sports;
        return Container(
            child:
            list.length > 0 ?
            ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder:(context,index)=> BuildArticleItem(list[index],context),
                separatorBuilder: (context, index) =>myDivide() ,
                itemCount: News_Cupit.get(context).Sports.length
            ): Center(child: CircularProgressIndicator())

        );
      },
    );
  }
}
