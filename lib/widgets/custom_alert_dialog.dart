import 'package:flutter/material.dart';
import 'package:petpal/configs/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:petpal/routes/route.dart' as routes;

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({Key? key}) : super(key: key);

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Alert"),
      content: Text("Are you really want to log out?"),
      actions: [
        TextButton(onPressed: () async {
          var authServiceProvider =
          Provider.of<AuthService>(context, listen: false);
          await authServiceProvider.logOut();
          Navigator.of(context).pushNamedAndRemoveUntil(routes.driverClass, (route) => false);
        }, child: Text("Log Out")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"))
      ],
    );
  }
}
