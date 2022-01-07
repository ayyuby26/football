import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/app/core/theme/values/colors/theme_color.dart';
import 'package:football/app/core/theme/utils/helpers/assets_path.dart';
import 'package:football/app/global_widgets/snackbar_widget.dart';
import 'package:football/app/global_widgets/unfocus_widget.dart';
import 'package:football/app/modules/login_module/controller.dart';
import 'package:football/app/modules/login_module/page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _colours = ThemeColor();
  final _imagesPath = AssetsPath();

  DateTime? currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      SnackBarWidget.showSnackBar(context, "tekan sekali lagi untuk keluar");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colours.bg,
      body: WillPopScope(
        onWillPop: onWillPop,
        child: UnfocusWidget(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: SvgPicture.asset(
                      _imagesPath.logo,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 60),
                  FormLogin()
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}

class FormLogin extends StatelessWidget {
  FormLogin({Key? key}) : super(key: key);
  final _phoneNumberCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _colours = ThemeColor();
  final _imagesPath = AssetsPath();

  get _title => Text(
        "Masuk",
        style: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );

  get _desc => Text(
        "Masuk dengan mudah hanya dengan memasukkan nomor telepon",
        style: GoogleFonts.roboto(
          fontSize: 15,
          color: Colors.black45,
        ),
      );

  get _enabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Color(0xFFd2ddec),
          width: 1,
        ),
      );

  login(BuildContext context) async {
    final _formState = _formKey.currentState;
    if (_formState != null && _formState.validate()) {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = Get.put(LoginController());
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title,
          const SizedBox(height: 10),
          _desc,
          const SizedBox(height: 15),
          Text(
            "username",
            style: GoogleFonts.openSans(),
          ),
          const SizedBox(height: 10),
          TextFormField(
            onFieldSubmitted: (value) => login(context),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "tidak boleh kosong";
              }
            },
            maxLength: 10,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            controller: _phoneNumberCtrl,
            decoration: InputDecoration(
              counterText: "",
              hintText: "",
              fillColor: Colors.white,
              filled: true,
              enabledBorder: _enabledBorder,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue[700]!,
                  width: 1,
                ),
                gapPadding: 0,
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red[700]!,
                  width: 1,
                ),
                gapPadding: 0,
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red[700]!,
                  width: 1,
                ),
                gapPadding: 0,
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: const EdgeInsets.only(
                left: 15,
                bottom: 11,
                top: 11,
                right: 15,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "Password",
            style: GoogleFonts.openSans(),
          ),
          const SizedBox(height: 10),
          Obx(
            () => TextFormField(
              onFieldSubmitted: (value) => login(context),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "tidak boleh kosong";
                }
              },
              obscureText: c.hidePass(),
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              controller: _passCtrl,
              decoration: InputDecoration(
                counterText: "",
                hintText: "",
                // prefixIcon: ,
                suffixIcon: IconButton(
                  splashRadius: 5,
                  onPressed: c.change,
                  icon: Icon(
                    c.hidePass() ? Icons.lock_outline : Icons.lock_open,
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: _enabledBorder,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue[700]!,
                    width: 1,
                  ),
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red[700]!,
                    width: 1,
                  ),
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red[700]!,
                    width: 1,
                  ),
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding: const EdgeInsets.only(
                  left: 15,
                  bottom: 11,
                  top: 11,
                  right: 15,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Text(
                "Sudah punya akun? ",
                style: GoogleFonts.openSans(),
              ),
              GestureDetector(
                onTap: () => Get.off(const LoginPage()),
                child: Text(
                  "daftar disini",
                  style: GoogleFonts.openSans(color: Colors.blue[700]),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  elevation: 0,
                  primary: Colors.blue[600],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () {
                login(context);
              },
              child: const Text(
                "Daftar",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          // const SizedBox(height: 125),
        ],
      ),
    );
  }
}
