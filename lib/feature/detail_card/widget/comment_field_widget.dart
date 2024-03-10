import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/shared/widgets/icons/send_icon.dart';

class CommentFieldWidget extends ConsumerWidget {
  const CommentFieldWidget({super.key});

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    final double width = MediaQuery.of(context).size.width;
    return ObsBuilder(
      streams: [bloc.listCommemtFragmentsSubject, bloc.isSendCommentSubject],
      builder: (context) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: width,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: ColorConstants.inputBorder,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Container(
                      width: width - 52,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryColorBlueLight,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: bloc.commentController,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          hintText: 'Thêm nhận xét',
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        maxLines: 5,
                        minLines: 1,
                        onChanged: (value) {
                          bloc.onChangeCommentField(value);
                        },
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      bloc.sendComment();
                    },
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: !bloc.isSendCommentSubject.value
                          ? const SendIcon(
                              width: 20,
                              height: 20,
                            )
                          : const SendIcon(
                              width: 20,
                              height: 20,
                              color: ColorConstants.primary,
                            ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
