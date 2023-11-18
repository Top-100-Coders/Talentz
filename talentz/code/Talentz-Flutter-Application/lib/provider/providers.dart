

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:talentz/core/notifier/auth/searchWithName.dart';
import 'general_notifier.dart';


List<SingleChildWidget> providers = [...remoteProvider];

//independent providers
List<SingleChildWidget> remoteProvider = [
  ChangeNotifierProvider(create: (_) => SearchNotifier()),
  ChangeNotifierProvider(create: (_) => GeneralNotifier()),


];