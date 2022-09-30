import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _callNativeActivity();
  }

  Future<void> _callNativeActivity() async {
    const platform = MethodChannel('com.example.guideapp_flutter/page');
    try {
      var result = await platform.invokeMethod('graphic');
      Get.offAllNamed(result);
    } on MissingPluginException catch (error) {
      debugPrint(error.toString());
      _callNativeActivity();
    } catch (error) {
      debugPrint(error.toString());
      _callNativeActivity();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
