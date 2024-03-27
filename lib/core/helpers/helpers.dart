// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

void showLoading(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    // ignore: deprecated_member_use
    builder: (context) => WillPopScope(
      onWillPop: () async => false,
      child: const AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading...'),
          ],
        ),
      ),
    ),
  );
}
