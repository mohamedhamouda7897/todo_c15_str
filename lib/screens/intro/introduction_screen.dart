import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_c15_str/providers/theme_provider.dart';
import 'package:todo_c15_str/screens/home/home_screen.dart';
import 'package:todo_c15_str/screens/register/login/login_screen.dart';
import 'dart:ui' as ui;

class IntroductionScreen extends StatelessWidget {
  static const String routeName = "intro";

  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/logo_h.png"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          spacing: 24.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/introduction.png",
              width: double.infinity,
            ),

            Text(
              "introduction_title".tr(),
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: Colors.blue,
              ),
            ),
            Text(
              "introduction_subtitle".tr(),
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: Color(0xFF1C1C1C),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "language".tr(),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.blue, width: 3),
                    ),
                    child: Row(
                      spacing: 16.w,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.setLocale(Locale('en'));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              border: Border.all(
                                color: Colors.blue,
                                width: 3.r,
                                style: context.locale.toString() == "en"
                                    ? BorderStyle.solid
                                    : BorderStyle.none,
                              ),
                            ),
                            child: Image.asset(
                              "assets/images/usa.png",
                              width: 30.w,
                              height: 30.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.setLocale(Locale('ar'));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              border: Border.all(
                                color: Colors.blue,
                                width: 3.r,
                                style: context.locale.toString() == "ar"
                                    ? BorderStyle.solid
                                    : BorderStyle.none,
                              ),
                            ),
                            child: Image.asset(
                              "assets/images/EG.png",
                              width: 30.w,
                              height: 30.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "theme".tr(),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.blue, width: 3),
                  ),
                  child: Row(
                    spacing: 16.w,
                    children: [
                      GestureDetector(
                        onTap: () {
                          provider.changeTheme(ThemeMode.light);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(
                              color: Colors.blue,
                              width: 3.r,
                              style: BorderStyle.none,
                            ),
                          ),
                          child: Image.asset(
                            "assets/images/sun.png",
                            width: 30.w,
                            height: 30.h,
                            color: Colors.white,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          provider.changeTheme(ThemeMode.dark);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(
                              color: Colors.blue,
                              width: 3.r,
                              style: BorderStyle.none,
                            ),
                          ),
                          child: Icon(
                            Icons.mode_night_rounded,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: 1.sw,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                child: Container(
                  child: Text(
                    "intro_btn".tr(),
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,

                      color: Colors.white,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
