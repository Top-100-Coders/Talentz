import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:talentz/constants/app_routes.dart';
import 'package:talentz/constants/color_manger.dart';
import 'package:talentz/constants/constants.dart';
import 'package:talentz/constants/font_manager.dart';
import 'package:talentz/constants/style_manager.dart';

import '../../../constants/values_manger.dart';
import '../../provider/general_notifier.dart';
import '../widget/main_app_bar_widget.dart';
import '../widget/square_tile_widget.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final generalNotifier = context.watch<GeneralNotifier>();
    double screenWidth = MediaQuery.of(context).size.width;
    final isLoading = useState<bool>(false);

    useEffect(() {
      Future.microtask(() => generalNotifier.checkAxisCount(context: context));

      return null;
    }, []);

    print(screenWidth);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MainAppBarWidget(isFirstPage: true, title: ""),
                kSizedBox20,
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Choose one option \nto continue",
                          style: getBoldStyle(
                              color: ColorManager.primaryLight,
                              fontSize: FontSize.s20),
                        ),
                        kSizedBox20,
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: generalNotifier.getAxisCount,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: List.generate(4, (index) {
                              String categoryType = index == 0
                                  ? "Skills"
                                  : index == 1
                                      ? "Location"
                                      : index == 2
                                          ? "Category"
                                          : "Post";
                              return SquareTileWidget(
                                icon: index == 0
                                    ? Icons.lightbulb
                                    : index == 1
                                        ? Icons.location_city_rounded
                                        : index == 2
                                            ? Icons.category_rounded
                                            : index == 3
                                                ? Icons.ac_unit_rounded
                                                : Icons.add,
                                index: index,
                                onTap: () async {
                                  isLoading.value = true;
                                  if (index == 0) {
                                    Navigator.pushNamed(context, listViewRoute);
                                  } else if (index == 1) {
                                  } else if (index == 2) {
                                  } else if (index == 3) {}
                                  isLoading.value = false;
                                },
                                name: categoryType,
                              );
                            })
                              ..add(kSizedBox2),
                          ),
                        ),
                        kSizedBox10
                      ],
                    ),
                  ),
                ),
              ],
            ),
            isLoading.value
                ? Positioned.fill(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          color: const Color(0x66ffffff),
                          child: const CircularProgressIndicator(),
                        )))
                : kSizedBox
          ],
        ),
      ),
    );
  }
}
