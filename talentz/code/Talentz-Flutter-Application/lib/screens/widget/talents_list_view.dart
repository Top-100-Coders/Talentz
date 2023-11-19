import 'package:flutter/material.dart';
import 'package:talentz/constants/color_manger.dart';
import 'package:talentz/constants/values_manger.dart';
import 'package:talentz/models/search_with_name_model.dart';
import 'package:talentz/screens/widget/talent_list_tile.dart';

class TalentsListView extends StatelessWidget {
  const TalentsListView({super.key, required this.data});

  final List<MoreSkill> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppPadding.p20),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        final user = data[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: AppPadding.p8),
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16, vertical: AppPadding.p12),
          decoration: BoxDecoration(
              color: ColorManager.primaryLight.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppPadding.p16),
                  bottomRight: Radius.circular(AppPadding.p16))),
          child: TalentListTile(user: user),
        );
      },
    );
  }
}
