import 'package:bharat_cargo/constants/globals.dart';
import 'package:bharat_cargo/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'sdp.dart';

SizedBox get height5 => const SizedBox(height: 5);
SizedBox get height10 => const SizedBox(height: 10);
SizedBox get height15 => const SizedBox(height: 15);
SizedBox get height20 => const SizedBox(height: 20);
SizedBox get height50 => const SizedBox(height: 50);

SizedBox get width5 => const SizedBox(width: 5);
SizedBox get width10 => const SizedBox(width: 10);
SizedBox get width15 => const SizedBox(width: 15);
SizedBox get width20 => const SizedBox(width: 20);

SizedBox kHeight(double height) => SizedBox(
      height: height,
    );

Future<void> navPush(BuildContext context, Widget screen) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => screen));
}

Future<void> navPushReplacement(BuildContext context, Widget screen) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => screen));
}

Future<void> navPopUntilPush(BuildContext context, Widget screen) {
  Navigator.popUntil(context, (route) => false);
  return navPush(context, screen);
}

systemColors() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

class SubmitButton {
  static Widget text(
    BuildContext context, {
    required void Function()? onPressed,
    String? label,
    Color? buttonColor,
    EdgeInsetsGeometry? padding,
  }) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      highlightElevation: 0,
      color: buttonColor ?? kPrimaryColor,
      elevation: 0,
      padding: padding ?? EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          label ?? 'Proceed',
          style: TextStyle(
            color: Colors.white,
            fontSize: sdp(context, 12),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  static Widget icon(
    BuildContext context, {
    required void Function()? onPressed,
    String? label,
    Icon? icon,
    Color? buttonColor,
    EdgeInsetsGeometry? padding,
  }) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      highlightElevation: 0,
      color: buttonColor ?? kPrimaryColor,
      elevation: 0,
      padding: padding ?? EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label ?? 'Proceed',
            style: TextStyle(color: Colors.white, fontSize: sdp(context, 12)),
          ),
          icon ??
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
        ],
      ),
    );
  }
}

TextField kTextField(
  BuildContext context, {
  TextEditingController? controller,
  bool obscureText = false,
  int? maxLength,
  int? maxLines = 1,
  int? minLines = 1,
  String? prefixText = '',
  String? labelText,
  TextCapitalization textCapitalization = TextCapitalization.none,
  TextInputType? keyboardType,
  void Function(String)? onChanged,
}) {
  return TextField(
    obscureText: obscureText,
    controller: controller,
    textCapitalization: textCapitalization,
    keyboardType: keyboardType,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: sdp(context, 10),
      fontFamily: 'Poppins',
    ),
    maxLength: maxLength,
    maxLines: maxLines,
    minLines: minLines,
    decoration: InputDecoration(
      // isDense: true,
      counterText: '',
      prefixText: prefixText,
      prefixStyle: TextStyle(
        fontSize: sdp(context, 10),
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
      ),
      labelText: labelText,
      labelStyle: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade700,
        fontSize: sdp(context, 10),
      ),
      floatingLabelStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: sdp(context, 10),
        fontWeight: FontWeight.w500,
        color: Colors.grey.shade700,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
          width: 1,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.5,
        ),
      ),
    ),
    onChanged: onChanged,
  );
}

Container fullScreenLoading(BuildContext context) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    alignment: Alignment.center,
    color: Colors.white.withOpacity(0.7),
    child: const CircularProgressIndicator(),
  );
}

void kShowSnackBar(
  BuildContext context, {
  required String content,
  bool? isDanger = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: isDanger! ? Colors.red.shade700 : kPrimaryColor,
      dismissDirection: DismissDirection.vertical,
      content: Text(
        content,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontFamily: 'Poppins',
        ),
      ),
    ),
  );
}

Widget kPill(
  BuildContext context, {
  EdgeInsetsGeometry? padding,
  Color? color,
  required String? label,
  BorderRadiusGeometry? borderRadius,
}) {
  return Container(
    padding: padding ?? EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: color ?? Color(0xffe9f0fe),
      borderRadius: borderRadius ?? BorderRadius.circular(5),
      border: Border.all(
        color: kCompleteColor,
        width: .5,
      ),
    ),
    child: Text(
      label!.toUpperCase(),
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: kCompleteColor,
        fontSize: sdp(context, 8),
        letterSpacing: 1,
      ),
    ),
  );
}

Widget kTabbar(
  BuildContext context, {
  required List<Widget> tabs,
  required List<Widget> views,
}) {
  return DefaultTabController(
    length: 2,
    child: Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
        color: Color(0xfff6f6f6),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: showAppbar,
              builder: (context, isShow, child) {
                return AnimatedSize(
                  duration: Duration(milliseconds: 200),
                  reverseDuration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                  child: isShow
                      ? Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade300)),
                          child: TabBar(
                            indicatorColor: Colors.white,
                            dividerColor: Colors.white.withOpacity(0),
                            indicatorSize: TabBarIndicatorSize.tab,
                            unselectedLabelColor: Colors.black,
                            labelColor: Colors.white,
                            indicator: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            tabs: tabs,
                          ),
                        )
                      : Container(
                          width: double.infinity,
                        ),
                );
              }),
          height10,
          Expanded(
            child: TabBarView(children: views),
          ),
        ],
      ),
    ),
  );
}

Widget kTextButton(
    {required void Function()? onPressed, required String label}) {
  return InkWell(
    onTap: onPressed,
    child: Text(
      label,
      style: TextStyle(
        color: kPrimaryColor,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
    ),
  );
}
