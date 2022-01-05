import 'package:flutter/material.dart';
import 'package:petpal/configs/auth_service.dart';
import 'package:petpal/routes/route.dart' as route;
import 'package:petpal/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({Key? key}) : super(key: key);

  @override
  _LoginSignupState createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  AuthService authService = AuthService();
  String? phoneNumber;
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 249, 228, 91),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Image(image: AssetImage('images/login_home.png')),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: CustomTextField(
                    textEditingController: phoneController,
                    onChanged: (value) {
                      setState(() {
                        phoneNumber = value;
                      });
                    },
                    hintText: "Enter Phone Number",
                    textInputType: TextInputType.phone,
                    textAlign: TextAlign.center,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<AuthService>()
                          .verifyNumber(phoneNumber.toString());
                      Navigator.pushNamed(context, route.otpScreenPage);
                    },
                    child: const Text("Send OTP"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      elevation: 0,
                    ),
                  ),
                ),
                Row(
                  children: const [
                    Expanded(
                        child: Divider(
                      thickness: 3,
                    )),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Or"),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 3,
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(0),
                          primary: Colors.transparent,
                          elevation: 0),
                      onPressed: () {},
                      child: const Image(
                        image: AssetImage("images/fb_logo.png"),
                        width: 55,
                        height: 55,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(0),
                          primary: Colors.transparent,
                          elevation: 0),
                      onPressed: () async {
                        await context.read<AuthService>().googleLogIn();
                      },
                      child: const Image(
                        image: AssetImage("images/google_logo.png"),
                        width: 40,
                        height: 40,
                      ),
                    )
                  ],
                ),
                const Text(
                  "By continuing, you are agree to our\nTerms of Service  Privacy Policy  Content Policy",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )),
    );
  }
}
