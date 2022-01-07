import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/app/core/theme/utils/helpers/assets_path.dart';
import 'package:football/app/global_widgets/ripple_button_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  get _title => Text(
        "TIM",
        style: GoogleFonts.sourceSansPro(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25,
          // letterSpacing: 3,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _title,
        backgroundColor: const Color(0xFFff8e5c),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              BigButton(
                gradient1: const Color(0xFFff8e5c),
                gradient2: const Color(0xFFff6a66),
                caption: "TIM",
                icon: const Icon(
                  Entypo.users,
                  color: Colors.white,
                  size: 55,
                ),
                ontap: () {
                  debugPrint("asd");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BigButton extends StatelessWidget {
  final Color gradient1;
  final Color gradient2;
  final String caption;
  final Widget icon;
  final Function ontap;

  const BigButton({
    Key? key,
    required this.gradient1,
    required this.gradient2,
    required this.caption,
    required this.icon,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      height: 110,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        // boxShadow: [
        //   BoxShadow(
        //     color: gradient1.withOpacity(0.4),
        //     spreadRadius: 4,
        //     blurRadius: 7,
        //     offset: const Offset(3, 3),
        //   )
        // ],
        // gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [
        //       gradient1,
        //       gradient2,
        //     ]),
        // color: const Color(0xFFececfd).withOpacity(.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: RippleButtonWidget(
        isBlackRipple: true,
        borderRadius: BorderRadius.circular(20),
        onTap: ontap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Text(
                caption,
                style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                  // letterSpacing: 3,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 30),
              decoration: BoxDecoration(
                // color: const Color(0xFFff6e65),
                borderRadius: BorderRadius.circular(20),
              ),
              child: icon,
            ),
          ],
        ),
      ),
    );
  }
}
