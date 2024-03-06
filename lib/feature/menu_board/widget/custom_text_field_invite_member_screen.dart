import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/edge_insets.dart';

class CustomTextFieldInviteMember extends ConsumerWidget {
  final TextEditingController controller;
  final TextInputType? keyBroadType;
  final bool? isObsText;
  final String? obsCurCharacter;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextFieldInviteMember({
    super.key,
    required this.controller,
    this.keyBroadType = TextInputType.text,
    this.isObsText = false,
    this.obsCurCharacter = '*',
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.inviteMember);
    return ObsBuilder(
      streams: [bloc.isSearchUsersSubject],
      builder: (context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 40,
          child: TextFormField(
            onChanged: (value) => bloc.onSearchTextChanged(controller.text),
            controller: controller,
            keyboardType: keyBroadType,
            obscureText: isObsText!,
            obscuringCharacter: obsCurCharacter!,
            onTap: () => bloc.onTapFocus(),
            focusNode: bloc.focusNode,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsetsConstants.top12 + EdgeInsetsConstants.left8,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.065,
              ),
              filled: true,
              fillColor: Colors.grey[100],
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.grey, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.grey, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.grey, width: 1),
              ),
            ),
          ),
        );
      },
    );
  }
}
