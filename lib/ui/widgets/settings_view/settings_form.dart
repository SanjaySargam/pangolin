import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intheloopapp/data/auth_repository.dart';
import 'package:intheloopapp/domains/models/user_model.dart';
import 'package:intheloopapp/ui/themes.dart';
import 'package:intheloopapp/ui/views/settings/settings_cubit.dart';
import 'package:intheloopapp/ui/widgets/common/forms/bio_text_field.dart';
import 'package:intheloopapp/ui/widgets/common/forms/instagram_text_field.dart';
import 'package:intheloopapp/ui/widgets/common/forms/location_text_field.dart';
import 'package:intheloopapp/ui/widgets/common/forms/soundcloud_text_field.dart';
import 'package:intheloopapp/ui/widgets/common/forms/tiktok_text_field.dart';
import 'package:intheloopapp/ui/widgets/common/forms/twitter_text_field.dart';
import 'package:intheloopapp/ui/widgets/common/forms/username_text_field.dart';
import 'package:intheloopapp/ui/widgets/common/forms/youtube_text_field.dart';
import 'package:intheloopapp/ui/widgets/settings_view/theme_switch.dart';

class SettingsForm extends StatelessWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel>(
      stream: RepositoryProvider.of<AuthRepository>(context).user,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();

        final currentUser = snapshot.data!;

        return BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Form(
              key: state.formKey,
              child: Column(
                children: [
                  UsernameTextField(
                    initialValue: state.username,
                    onSaved: (input) {
                      if (input != null) {
                        context.read<SettingsCubit>().changeUsername(input);
                      }
                    },
                    currentUserId: currentUser.id,
                  ),
                  BioTextField(
                    onSaved: (value) =>
                        context.read<SettingsCubit>().changeBio(value ?? ''),
                    initialValue: state.bio,
                  ),
                  LocationTextField(
                    onSaved: (value) => context
                        .read<SettingsCubit>()
                        .changeLocation(value ?? ''),
                    initialValue: state.location,
                  ),
                  TwitterTextField(
                    initialValue: state.twitterHandle,
                    onSaved: (value) =>
                        context.read<SettingsCubit>().changeTwitter(value),
                  ),
                  InstagramTextField(
                    initialValue: state.instagramHandle,
                    onSaved: (value) =>
                        context.read<SettingsCubit>().changeInstagram(value),
                  ),
                  TikTokTextField(
                    initialValue: state.tiktokHandle,
                    onSaved: (value) =>
                        context.read<SettingsCubit>().changeTikTik(value),
                  ),
                  SoundcloudTextField(
                    initialValue: state.soundcloudHandle,
                    onSaved: (value) =>
                        context.read<SettingsCubit>().changeSoundcloud(value),
                  ),
                  YoutubeTextField(
                    initialValue: state.youtubeChannelId,
                    onSaved: (value) =>
                        context.read<SettingsCubit>().changeYoutube(value),
                  ),
                  const SizedBox(height: 15),
                  const ThemeSwitch(),
                  if (state.status.isSubmissionInProgress) const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(tappedAccent),
                        ) else const SizedBox.shrink(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
