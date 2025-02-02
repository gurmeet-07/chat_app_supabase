import 'package:chat_app_supabase/cubits/profile/profiles_cubit.dart';
import 'package:chat_app_supabase/pages/splash_page.dart';
import 'package:chat_app_supabase/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    // TODO: Replace credentials with your own
    url: 'https://rzcevyndjjdmjanmzjkx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6Y2V2eW5kampkbWphbm16amt4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzgzNDE3MDQsImV4cCI6MjA1MzkxNzcwNH0.chJU8gMa7jj1LD-fu8XE4utLqn2fCcYi26sPzKjZ3I4',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilesCubit>(
      create: (context) => ProfilesCubit(),
      child: MaterialApp(
        title: 'SupaChat',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const SplashPage(),
      ),
    );
  }
}
