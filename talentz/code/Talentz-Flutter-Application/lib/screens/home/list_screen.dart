import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:talentz/constants/constants.dart';
import 'package:talentz/constants/values_manger.dart';
import 'package:talentz/screens/widget/custom_button_widget.dart';
import 'package:talentz/screens/widget/talents_list_view.dart';
import 'package:talentz/utils/enums.dart';

import '../../constants/asset_manager.dart';
import '../../core/notifier/search_notifier/search_notifier.dart';
import '../widget/text_field_widget.dart';

class ListViewScreen extends HookWidget {
  const ListViewScreen({super.key, required this.searchType});

  final SearchType searchType;

  static const routeName = "/list-view";

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Search with ${searchType.name}")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          kSizedBox12,
          TextFormFieldCustom(
              controller: searchController,
              hintName: "Type a ${searchType.name}",
              icon: Icons.search_rounded),
          kSizedBox10,
          Consumer<SearchNotifier>(builder: (context, snapshot, _) {
            return snapshot.getIsLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                    child: CustomButton(
                        onTap: () {
                          final searchNotifier = context.read<SearchNotifier>();
                          switch (searchType) {
                            case SearchType.name:
                              searchNotifier.searchWithName(searchController.text);
                              break;
                            case SearchType.skill:
                              searchNotifier.searchWithSkillNotifier(
                                  searchController.text);
                              break;
                            case SearchType.location:
                              searchNotifier.searchWithLocation(
                                  searchController.text);
                              break;
                            case SearchType.category:
                              searchNotifier.searchWithCategory(
                                  searchController.text);
                          }
                        },
                        width: 120.w,
                        isLight: false,
                        text: "Search"),
                  );
          }),
          Consumer<SearchNotifier>(
            builder: (_, snapshot, __) {
              final data = snapshot.getResultModel?.users;

              return Expanded(
                child: data != null && data.isNotEmpty
                    ? TalentsListView(data: data)
                    : Center(
                        child: Lottie.asset(
                          ImageAssets.loaderJson,
                          height: 140.h,
                          repeat: false,
                          animate: true,
                        ),
                      ),
              );
            },
          )
        ],
      ),
    );
  }
}
