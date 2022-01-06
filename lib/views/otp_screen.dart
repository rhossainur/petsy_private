import 'package:flutter/material.dart';
import 'package:petpal/configs/auth_service.dart';
import 'package:petpal/widgets/custom_elevated_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  AuthService authService = AuthService();
  String? otp;
  String? tempUid;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("OTP Verification"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text("We have sent a verification code to"),
              const SizedBox(
                height: 30,
              ),
              PinCodeTextField(
                  keyboardType: TextInputType.number,
                  appContext: context,
                  length: 6,
                  pinTheme: PinTheme(
                      activeColor: Colors.yellow,
                      inactiveColor: Colors.black,
                      selectedColor: Colors.green),
                  onChanged: (value) {
                    setState(() {
                      otp = value;
                    });
                    print(otp);
                  }),
              const SizedBox(
                height: 30,
              ),
              CustomElevatedButton(
                  childText: "Submit OTP",
                  onPressed: () async {
                    var authServiceProvider =
                        Provider.of<AuthService>(context, listen: false);
                    //String vid=context.watch<AuthService>().verificationIdFetched;
                    print("Fetching the vid val : " +
                        authServiceProvider.verificationIdFetched);
                    await authServiceProvider.otpVerification(
                        authServiceProvider.verificationIdFetched,
                        otp.toString());
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
