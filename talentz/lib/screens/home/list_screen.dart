import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talentz/constants/color_manger.dart';
import 'package:talentz/constants/constants.dart';
import 'package:talentz/constants/style_manager.dart';
import 'package:talentz/constants/values_manger.dart';
import 'package:talentz/screens/widget/main_app_bar_widget.dart';

import '../../constants/asset_manager.dart';
import '../widget/text_field_widget.dart';


class ListViewScreen extends HookWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    return Scaffold(
      body: Column(
        children: [
          MainAppBarWidget(isFirstPage: false,title: "Let's find Talentz",),
          kSizedBox12,
          TextFormFieldCustom(
            controller: searchController,
            hintName: "Search the keyword",
            icon: Icons.search_rounded
          ),
          kSizedBox10,
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: AppPadding.p12,vertical: AppPadding.p8),
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p16,vertical: AppPadding.p12),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.grey5,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    color: ColorManager.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(AppPadding.p16),bottomRight: Radius.circular(AppPadding.p16) )
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundColor: ColorManager.grey5,
                        child: Center(
                          child:Image.asset(ImageAssets.personImage)),
                      ),
                       kSizedW20,
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Rohan Khan",style: getBoldStyle(color: ColorManager.black),),
                          Text("Skill: Python",style: getSemiBoldStyle(color: ColorManager.black),),
                          Text("Location: Kochi",style: getSemiBoldStyle(color: ColorManager.black),)
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
