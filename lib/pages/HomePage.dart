
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../Storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, });

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PapaComm.materialApp(
        title: "",
        locale: const Locale('ko'),
        home: WillPopScope(
          onWillPop: () async => false,
          child : Scaffold(
            backgroundColor: Colors.white,

          ),
        ));
  }

}
