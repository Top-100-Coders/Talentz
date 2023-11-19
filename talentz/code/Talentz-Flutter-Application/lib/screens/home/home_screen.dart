import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:talentz/constants/constants.dart';
import 'package:talentz/utils/search_types.dart';

import '../../../constants/values_manger.dart';
import '../../provider/general_notifier.dart';
import '../widget/main_app_bar_widget.dart';
import '../widget/square_tile_widget.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final generalNotifier = context.watch<GeneralNotifier>();
    final isLoading = useState<bool>(false);

    useEffect(() {
      Future.microtask(() => generalNotifier.checkAxisCount(context: context));
      return null;
    }, []);

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
                          "Choose one of the\nfollowing ways to search",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        kSizedBox20,
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: generalNotifier.getAxisCount,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: searchTypes
                                .map(
                                  (value) => SquareTileWidget(
                                    onTap: () => Navigator.pushNamed(
                                      context,
                                      value['route'] as String,
                                      arguments: value['searchType'],
                                    ),
                                    icon: value['icon'] as IconData?,
                                    name: 'By ${value['name']}',
                                  ),
                                )
                                .toList(),
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
