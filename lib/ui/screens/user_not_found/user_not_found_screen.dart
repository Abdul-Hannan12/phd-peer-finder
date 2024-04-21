import 'package:flutter/material.dart';
import 'package:phd_peer/core/constants/text_style.dart';
import 'package:phd_peer/ui/custom_widgets/gradient_text/custom_gradient_text.dart';
import 'package:phd_peer/ui/screens/active_call/active_call_view_model.dart';
import 'package:provider/provider.dart';

class UserNotFoundScreen extends StatelessWidget {
  const UserNotFoundScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ActiveCallViewModel(),
      child: Consumer<ActiveCallViewModel>(
        builder: (context, model, child) => Scaffold(
          ///
          /// App Bar
          ///
          appBar: AppBar(
              centerTitle: true,
              title: CustomGradientText(
                text: 'No User',
                style: style22,
              )),

          ///
          /// Start Body
          ///

          body: const Center(
            child: Text("No User Found"),
          ),
        ),
      ),
    );
  }
}
