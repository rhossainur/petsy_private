import 'package:flutter/material.dart';

class CustomPostViewFooter extends StatelessWidget {
  final GestureTapCallback? onPressedContactDetails;
  final GestureTapCallback? onPressedChatOwner;
  final IconData? contactDetailsIcon;
  final IconData? chatOwnerIcon;
  final String? contactDetailsString;
  final String? chatOwnerString;

  const CustomPostViewFooter(
      {Key? key,
      @required this.onPressedContactDetails,
      @required this.onPressedChatOwner,
      @required this.contactDetailsIcon,
      @required this.chatOwnerIcon,
      @required this.contactDetailsString,
      @required this.chatOwnerString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: onPressedContactDetails,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Icon(
                        contactDetailsIcon,
                        size: 30,
                      ),
                      Text(contactDetailsString.toString()),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  )),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white
                  ),
                  onPressed: onPressedChatOwner,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Icon(
                        chatOwnerIcon,
                        size: 30,
                      ),
                      Text(chatOwnerString.toString()),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  )),
            )),
          ],
        ));
  }
}
