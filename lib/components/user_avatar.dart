import 'package:chat_app_supabase/cubits/profile/profiles_cubit.dart';
import 'package:chat_app_supabase/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// Widget that will display a user's avatar
class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilesCubit, ProfilesState>(
      builder: (context, state) {
        if (state is ProfilesLoaded) {
          final user = state.profiles[userId];
          return CircleAvatar(
            child:
                user == null ? preloader : Text(user.username.substring(0, 2)),
          );
        } else {
          return const CircleAvatar(child: preloader);
        }
      },
    );
  }
}