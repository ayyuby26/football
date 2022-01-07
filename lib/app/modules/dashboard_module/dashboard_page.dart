import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/app/core/theme/utils/helpers/assets_path.dart';
import 'package:football/app/global_widgets/ripple_button_widget.dart';
import 'package:football/app/modules/team_module/team_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  get _logo => Image.asset(
        AssetsPath().logo,
        width: Get.width / 2,
      );

  get _tim => BigButton(
        gradient1: const Color(0xFFff8e5c),
        gradient2: const Color(0xFFff6a66),
        caption: "TIM",
        icon: _icon(Entypo.users),
        ontap: () => Get.to(const TeamPage()),
      );

  get _player => BigButton(
        gradient1: const Color(0xFF4392e4),
        gradient2: const Color(0xFF3f56e7),
        caption: "PEMAIN",
        icon: _icon(Entypo.user),
        ontap: () {
          debugPrint("asd");
        },
      );

  get _versus => BigButton(
        gradient1: const Color(0xFFc61568),
        gradient2: const Color(0xFFc61538),
        caption: "VERSUS",
        icon: SvgPicture.asset(
          "assets/icons/vs_icon.svg",
          height: 40,
        ),
        ontap: () {
          debugPrint("asd");
        },
      );

  get _result => BigButton(
        gradient1: const Color(0xFF2eab6c),
        gradient2: const Color(0xFF368d61),
        caption: "HASIL",
        icon: _icon(Ionicons.clipboard),
        ontap: () {
          debugPrint("asd");
        },
      );

  Icon _icon(IconData icon) {
    return Icon(
      icon,
      color: Colors.white,
      size: 55,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _logo,
              const SizedBox(height: 40),
              _tim,
              _player,
              _versus,
              _result,
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

  get _shadow => BoxShadow(
        color: gradient1.withOpacity(0.4),
        spreadRadius: 4,
        blurRadius: 7,
        offset: const Offset(3, 3),
      );

  get _boxDecor => BoxDecoration(
        boxShadow: [_shadow],
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              gradient1,
              gradient2,
            ]),
        // color: const Color(0xFFececfd).withOpacity(.6),
        borderRadius: BorderRadius.circular(20),
      );

  get _caption => Padding(
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
      );

  get _icon => Container(
        margin: const EdgeInsets.only(right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: icon,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      height: 110,
      decoration: _boxDecor,
      child: RippleButtonWidget(
        isBlackRipple: true,
        borderRadius: BorderRadius.circular(20),
        onTap: ontap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_caption, _icon],
        ),
      ),
    );
  }
}
