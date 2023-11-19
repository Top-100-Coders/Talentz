import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talentz/constants/asset_manager.dart';
import 'package:talentz/constants/color_manger.dart';
import 'package:talentz/constants/constants.dart';
import 'package:talentz/constants/font_manager.dart';
import 'package:talentz/constants/style_manager.dart';
import 'package:talentz/models/search_with_name_model.dart';
import 'package:talentz/screens/home/talent_details_screen.dart';
import 'package:talentz/utils/global_keys.dart';

class TalentListTile extends StatelessWidget {
  const TalentListTile({super.key, required this.user});

  final MoreSkill user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigatorKey.currentState?.pushNamed(
        TalentDetailsScreen.routeName,
        arguments: user,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24.r,
            backgroundColor: ColorManager.grey5,
            foregroundImage: const AssetImage(ImageAssets.personImage),
          ),
          kSizedW20,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name ?? "",
                style: getBoldStyle(
                  color: ColorManager.text,
                  fontSize: FontSize.s16,
                ),
              ),
              Text(
                "Skill: ${user.skills?.sublist(2).join(', ') ?? ""}, ...",
                style: getSemiBoldStyle(color: ColorManager.text),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Location: ${user.location ?? ""}",
                style: getSemiBoldStyle(color: ColorManager.text),
              )
            ],
          ),
        ],
      ),
    );
  }
}
