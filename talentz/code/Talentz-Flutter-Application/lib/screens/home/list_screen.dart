import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:talentz/constants/color_manger.dart';
import 'package:talentz/constants/constants.dart';
import 'package:talentz/constants/style_manager.dart';
import 'package:talentz/constants/values_manger.dart';
import 'package:talentz/screens/widget/custom_button_widget.dart';
import 'package:talentz/screens/widget/main_app_bar_widget.dart';

import '../../constants/asset_manager.dart';
import '../../core/notifier/search_notifier/searchWithName.dart';
import '../widget/text_field_widget.dart';

class ListViewScreen extends HookWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    return Scaffold(
      body: Column(
        children: [
          const MainAppBarWidget(
            isFirstPage: false,
            title: "Let's find Talentz",
          ),
          kSizedBox12,
          TextFormFieldCustom(
              controller: searchController,
              hintName: "Search the keyword",
              icon: Icons.search_rounded),
          kSizedBox10,
          Consumer<SearchNotifier>(builder: (context, snapshot, _) {
            return snapshot.getIsLoading
                ? const CircularProgressIndicator()
                : CustomButton(
                    onTap: () {
                      context.read<SearchNotifier>().searchWithNameNotifier(
                          context: context, skill: searchController.text);
                    },
                    width: 120.w,
                    isLight: false,
                    text: "Search");
          }),
          // kSizedBox10,
          Consumer<SearchNotifier>(builder: (context, snapshot, _) {
            return Expanded(
              child: (snapshot.getResultModel?.users?.isNotEmpty ?? false) ||
                      (snapshot.getResultModel?.users != null)
                  ? ListView.builder(
                      itemCount: snapshot.getResultModel?.users?.length,
                      itemBuilder: (BuildContext context, int index) {
                        final data = snapshot.getResultModel?.users?[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p12,
                              vertical: AppPadding.p8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p16,
                              vertical: AppPadding.p12),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: ColorManager.grey5,
                                  offset: const Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                              color: ColorManager.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(AppPadding.p16),
                                  bottomRight:
                                      Radius.circular(AppPadding.p16))),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20.r,
                                backgroundColor: ColorManager.grey5,
                                child: Center(
                                    child:
                                        Image.asset(ImageAssets.personImage)),
                              ),
                              kSizedW20,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data?.name ?? "",
                                    style:
                                        getBoldStyle(color: ColorManager.black),
                                  ),
                                  Text(
                                    "Skill: ${data?.skills ?? ""}",
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black),
                                  ),
                                  Text(
                                    "Location: ${data?.location ?? ""}",
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Lottie.asset(ImageAssets.loaderJson,
                          height: 140.h, repeat: false, animate: true),
                    ),
            );
          })
        ],
      ),
    );
  }
}
