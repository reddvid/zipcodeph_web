import 'package:flutter/material.dart';
import 'dart:js' as js;

class DownloadButton extends StatelessWidget {
  const DownloadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        js.context.callMethod(
            'open', ['https://reddavid.me/zipcodeph-app/download/']);
      },
      icon: const Icon(
        Icons.download,
        size: 24.0,
      ),
      label: const SizedBox(
        height: 48.0,
        child: Align(
          alignment: Alignment.center,
          child: Text("Download mobile app"),
        ),
      ),
    );
  }
}
