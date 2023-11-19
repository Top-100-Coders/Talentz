import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talentz/constants/asset_manager.dart';
import 'package:talentz/constants/constants.dart';
import 'package:talentz/constants/values_manger.dart';
import 'package:talentz/models/search_with_name_model.dart';

class TalentDetailsScreen extends StatelessWidget {
  const TalentDetailsScreen({super.key, required this.data});

  final MoreSkill? data;

  static const routeName = "/talent-details";

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(AppPadding.p20),
        children: [
          CircleAvatar(
            radius: 72.r,
            child: ClipOval(
              child: Image.asset(
                ImageAssets.personImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          kSizedBox20,
          Text(data?.name ?? "", style: textTheme.titleLarge),
          kSizedBox10,
          Text(data?.location ?? "", style: textTheme.titleMedium),
          kSizedBox20,
          const Divider(),
          kSizedBox20,
          Text("Skills", style: textTheme.titleMedium),
          kSizedBox10,
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              ...data?.skills?.map((e) => Chip(label: Text(e))) ?? [],
            ],
          ),
        ],
      ),
    );
  }
}
