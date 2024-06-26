import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/feature/detail_card/extension/detail_card_comment_extension.dart';
import 'package:task_manager/shared/widgets/icons/send_icon.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class DetailCardCommentFieldWidget extends ConsumerWidget {
  const DetailCardCommentFieldWidget({super.key});

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    final width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: ColorConstants.inputBorder),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: TextFormField(
                focusNode: bloc.focusNodeComment,
                controller: bloc.commentController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  hintText: 'Thêm nhận xét',
                  hintStyle: AppTextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                maxLines: 5,
                minLines: 1,
                onChanged: (value) {
                  bloc.onChangeCommentField(value);
                },
                onTap: () {
                  bloc.onTapCommentField();
                },
              ),
            ),
          ),
          InkWell(
            onTap: () {
              bloc.onTapSendComment();
            },
            child: Ink(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: ObsBuilder(
                streams: [
                  bloc.isChatCommentSubject,
                  bloc.isLoadingAddCommentSubject,
                ],
                builder: (context) {
                  return !bloc.isChatCommentSubject.value
                      ? const SendIcon(
                          width: 20,
                          height: 20,
                        )
                      : bloc.isLoadingAddCommentSubject.value
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: ColorConstants.primary,
                              ),
                            )
                          : const SendIcon(
                              width: 20,
                              height: 20,
                              color: ColorConstants.primary,
                            );
                },
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }
}
