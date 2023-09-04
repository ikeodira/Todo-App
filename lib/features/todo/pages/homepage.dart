import 'package:flutter/material.dart';
import 'package:todo_app/common/utils/constants.dart';
import 'package:todo_app/common/widgets/appstyle.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';
import '../../../common/widgets/height_spacer.dart';
import '../../../common/widgets/width_spacer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ReusableText(
              text: "Todo",
              style: appstyle(26, AppConst.kBlueLight, FontWeight.bold),
            ),
            // const HeightSpacer(height: 30),
            // const WidthSpacer(width: 30),
            ReusableText(
              text: "Todo",
              style: appstyle(26, AppConst.kBlueLight, FontWeight.bold),
            ),
            ReusableText(
              text: "Todo",
              style: appstyle(26, AppConst.kBlueLight, FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
