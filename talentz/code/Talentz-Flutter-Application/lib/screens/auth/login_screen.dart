import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:talentz/constants/app_routes.dart';
import 'package:talentz/constants/color_manger.dart';
import 'package:talentz/constants/constants.dart';
import 'package:talentz/constants/font_manager.dart';
import 'package:talentz/constants/style_manager.dart';
import 'package:talentz/constants/values_manger.dart';
import 'package:provider/provider.dart';

import '../../constants/asset_manager.dart';
import '../../core/notifier/search_notifier/searchWithName.dart';
import '../../provider/general_notifier.dart';
import '../widget/custom_button_widget.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final userController = useTextEditingController();
    final passController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100.h),
                child: Center(
                    child:Lottie.asset(ImageAssets.lockJson,height: 80.h,repeat: false,animate: true),),
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello 👋",
                          style: getSemiBoldStyle(
                              color: ColorManager.primaryLight,
                              fontSize: FontSize.s30)),
                      Text("Welcome !",
                          style: getSemiBoldStyle(
                              color: ColorManager.primaryLight,
                              fontSize: FontSize.s28)),
                      kSizedBox50,
                      AuthTextField(
                          userController: userController,
                          title: "Enter User Name",
                          isPassword: false),
                      kSizedBox20,
                      AuthTextField(
                        userController: passController,
                        title: "Enter Password",
                        isPassword: true,
                      ),

                      kSizedBox35,
                      Center(
                        child: CustomButton(
                          text: "Login",
                          onTap: () async {
                            Navigator.pushReplacementNamed(context, mainRoute);
                          }, width: 120.w, isLight: false,
                        ),
                      ),
                      kSizedBox10,
                      Center(child: Text("Version 3.0.0",style: getSemiBoldStyle(color: ColorManager.grey),))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AuthTextField extends HookWidget {
  const AuthTextField({
    Key? key,
    required this.userController,
    required this.title,
    required this.isPassword,
  }) : super(key: key);

  final TextEditingController userController;
  final String title;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    ValueNotifier obsecure = useState<bool>(isPassword);
    return TextFormField(
      controller: userController,
      obscureText: obsecure.value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      style:
      getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s14),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: title,

          hintStyle: TextStyle(color: Colors.grey),
          prefixIconColor: Colors.red,
          contentPadding:
          EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.grey5, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.primaryLight, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffD32F2F), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffD32F2F), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
                obsecure.value ? Icons.visibility_off : Icons.visibility,
                color: ColorManager.primaryLight),
            onPressed: () => obsecure.value = !obsecure.value,
          )
              : kSizedBox),
    );
  }
}