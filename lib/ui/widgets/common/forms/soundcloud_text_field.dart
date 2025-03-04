import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SoundcloudTextField extends StatelessWidget {
  const SoundcloudTextField({
    Key? key,
    this.onSaved,
    this.initialValue,
  }) : super(key: key);

  final void Function(String)? onSaved;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        // is able to enter lowercase letters
        FilteringTextInputFormatter.allow(RegExp(r'[a-z0-9_\.\-\$]')),
      ],
      initialValue: initialValue,
      decoration: const InputDecoration(
        prefixIcon: Icon(FontAwesomeIcons.soundcloud),
        prefixText: 'soundcloud.com/',
        labelText: 'Soundcloud',
      ),
      onSaved: (input) {
        input = input?.trim().toLowerCase();
        if (onSaved != null) onSaved!(input ?? '');
      },
    );
  }
}
