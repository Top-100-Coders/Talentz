

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:talentz/core/notifier/auth/auth_notifier.dart';
import '../core/notifier/auth/logout_notifier.dart';
import 'general_notifier.dart';


List<SingleChildWidget> providers = [...remoteProvider];

//independent providers
List<SingleChildWidget> remoteProvider = [
  ChangeNotifierProvider(create: (_) => LoginNotifier()),
  ChangeNotifierProvider(create: (_) => LogoutNotifier()),
  ChangeNotifierProvider(create: (_) => GeneralNotifier()),


];