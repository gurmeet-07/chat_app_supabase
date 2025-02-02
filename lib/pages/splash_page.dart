import 'package:chat_app_supabase/pages/register_page.dart';
import 'package:chat_app_supabase/pages/rooms_page.dart';
import 'package:chat_app_supabase/utils/constants.dart';
import 'package:flutter/material.dart';

/// Page to redirect users to the appropreate page depending on the initial auth state
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInitialSession();
    super.initState();
  }

  Future<void> getInitialSession() async {
    // quick and dirty way to wait for the widget to mount
    await Future.delayed(const Duration(seconds: 2));

    try {
      final session = supabase.auth.currentSession;
      if (session == null) {
        Navigator.of(context)
            .pushAndRemoveUntil(RegisterPage.route(), (_) => false);
      } else {
        Navigator.of(context)
            .pushAndRemoveUntil(RoomsPage.route(), (_) => false);
      }
    } catch (_) {
      context.showErrorSnackBar(
        message: 'Error occured during session refresh',
      );
      Navigator.of(context)
          .pushAndRemoveUntil(RegisterPage.route(), (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Chat App',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Icon(
          Icons.chat,
          size: 100,
          color: Colors.blue,
        ),
      ],
    )));
  }
}
