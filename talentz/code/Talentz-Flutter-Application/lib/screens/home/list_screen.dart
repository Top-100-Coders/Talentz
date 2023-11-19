import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:talentz/constants/constants.dart';
import 'package:talentz/screens/widget/custom_button_widget.dart';
import 'package:talentz/screens/widget/talents_list_view.dart';

import '../../constants/asset_manager.dart';
import '../../core/notifier/search_notifier/searchWithName.dart';
import '../widget/text_field_widget.dart';

class ListViewScreen extends HookWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Search with name")),
      body: Column(
        children: [
          kSizedBox12,
          TextFormFieldCustom(
              controller: searchController,
              hintName: "Type a name",
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
            final data = snapshot.getResultModel?.users;
            return Expanded(
              child: data != null && data.isNotEmpty
                  ? TalentsListView(data: data)
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
