import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/list_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/board/get_boards.graphql.dart';
import 'package:task_manager/graphql/Mutations/card/create_card.graphql.dart';
import 'package:task_manager/graphql/Mutations/list/get_lists.graphql.dart';
import 'package:task_manager/graphql/queries/board/get_user_of_board.graphql.dart';
import 'package:task_manager/schema.graphql.dart';

class AddCardBloc extends BlocBase {
  final Ref ref;
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);
  final listBoardSubject =
      BehaviorSubject<List<Fragment$BoardFragment?>>.seeded([]);
  final selectedBoardSubject =
      BehaviorSubject<Fragment$BoardFragment?>.seeded(null);

  final listListSubject =
      BehaviorSubject<List<Fragment$ListFragment?>>.seeded([]);
  final selectedListSubject =
      BehaviorSubject<Fragment$ListFragment?>.seeded(null);
  final selectedTextListSubject = BehaviorSubject<String?>.seeded(null);

  final listMemberSubject =
      BehaviorSubject<List<Fragment$UserFragment?>>.seeded([]);
  final listSelectedMemberSubject =
      BehaviorSubject<List<Fragment$UserFragment?>>.seeded([]);
  final selectedMemberSubject =
      BehaviorSubject<Fragment$UserFragment?>.seeded(null);
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);

  final timeStartSubject = BehaviorSubject<String?>.seeded(null);
  final timeFinishSubject = BehaviorSubject<String?>.seeded(null);

  final nameCardSubject = BehaviorSubject<String?>.seeded(null);
  final descriptionCardSubject = BehaviorSubject<String?>.seeded(null);
  final FocusNode focusNodeName = FocusNode();
  final FocusNode focusNodeDescription = FocusNode();
  final isSubmitSubject = BehaviorSubject<bool>.seeded(false);
  final isSubmitListSubject = BehaviorSubject<bool>.seeded(false);

  @override
  void dispose() {
    super.dispose();
    listBoardSubject.close();
    isLoadingSubject.close();
    selectedBoardSubject.close();
    listListSubject.close();
    selectedListSubject.close();
    selectedTextListSubject.close();
    listMemberSubject.close();
    listSelectedMemberSubject.close();
    timeStartSubject.close();
    timeFinishSubject.close();
    nameCardSubject.close();
    descriptionCardSubject.close();
    isSubmitSubject.close();
    focusNodeName.dispose();
    focusNodeDescription.dispose();
    isSubmitListSubject.close();
    selectedMemberSubject.close();
  }

  void init() {
    getBoard();
  }

  void onBackToBoardScreen() {
    routerService.pop();
  }

  Future<void> onTapAddCard() async {
    final String titleCrad = nameCardSubject.value ?? '';
    // final String descriptionCard = descriptionCardSubject.value??'';
    // final String timeStart = timeStartSubject.value??'';
    // final String timeFinish = timeFinishSubject.value??'';
    // listSelectedMemberSubject.value;
    focusNodeName.unfocus();
    focusNodeDescription.unfocus();
    if (selectedListSubject.value == null) return;
    if (nameCardSubject.value == null || nameCardSubject.value!.isEmpty) return;
    isLoadingSubject.value = true;
    final result = await graphqlService.client.mutate$CreateCard(
      Options$Mutation$CreateCard(
        variables: Variables$Mutation$CreateCard(
          input: Input$InputCreateCard(
            idList: selectedListSubject.value!.id,
            reminder: Enum$Reminder.Unknown,
            title: titleCrad,
          ),
        ),
      ),
    );
    isLoadingSubject.value = false;
    if (result.hasException) {
      toastService.showText(
        message: result.exception?.graphqlErrors[0].message,
      );
      routerService.pop(result: false);
      return;
    }
    routerService.pop(result: true);
  }

  void checkNameCard() {
    if (nameCardSubject.value == null || nameCardSubject.value!.isEmpty) {
      isSubmitSubject.value = false;
      return;
    }
    isSubmitSubject.value = true;
  }

  void getBoard() async {
    isSubmitSubject.value = false;
    isSubmitListSubject.value = false;
    isLoadingSubject.value = true;
    final result = await graphqlService.client.mutate$getBoards(
      Options$Mutation$getBoards(),
    );
    isLoadingSubject.value = false;
    if (result.hasException) {
      toastService.showText(
        message: result.exception?.graphqlErrors[0].message ?? 'Lỗi',
      );
      return;
    }
    listBoardSubject.value = result.parsedData?.getBoards ?? [];
    selectedBoardSubject.value = listBoardSubject.value.first;
    getListByIdBoard();
    memberBoard();
  }

  void getListByIdBoard() async {
    isSubmitSubject.value = false;
    isSubmitListSubject.value = false;
    final String? idBoard = selectedBoardSubject.value?.id;
    if (idBoard == null) return;
    idBoard.trim();
    if (idBoard.isEmpty) return;
    isLoadingSubject.value = true;
    final result = await graphqlService.client.mutate$getList(
      Options$Mutation$getList(
        variables: Variables$Mutation$getList(
          idBoard: idBoard,
        ),
      ),
    );
    isLoadingSubject.value = false;
    if (result.hasException) {
      toastService.showText(
        message: result.exception?.graphqlErrors[0].message ?? 'Lỗi',
      );
      return;
    }
    listListSubject.value = result.parsedData?.getLists ?? [];
    if (listListSubject.value.isEmpty) {
      selectedTextListSubject.value = 'Không có danh sách nào';
    } else if (listListSubject.value.length == 1) {
      selectedTextListSubject.value = listListSubject.value.first?.label ?? '';
    } else {
      selectedTextListSubject.value = 'Chọn danh sách';
    }
  }

  Future<void> memberBoard() async {
    final String idBoard = selectedBoardSubject.value!.id.trim();
    final result = await graphqlService.client.query$GetUserOfBoard(
      Options$Query$GetUserOfBoard(
        variables: Variables$Query$GetUserOfBoard(
          idBoard: idBoard,
          query: null,
        ),
      ),
    );
    if (result.hasException) return;
    listMemberSubject.value = result.parsedData?.getUsersOfBoard ?? [];
  }

  Future<void> showDateTimePickerFinish(BuildContext context) async {
    if (!context.mounted) return;
    DateTime selectedDate = DateTime.now();
    final TimeOfDay selectedTime = TimeOfDay.now();
    final DateTime tempDate =
        DateFormat('yyyy-MM-dd hh:mm:ss').parse(timeStartSubject.value ?? '');
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      selectableDayPredicate: (DateTime val) =>
          val.day < tempDate.day ? false : true,
    );

    if (pickedDate != null) {
      // Pick hour and minute
      // ignore: use_build_context_synchronously
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime,
      );
      if (pickedTime != null) {
        selectedDate = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        final String time = DateFormat('dd-MM-yyyy hh:mm').format(selectedDate);
        timeFinishSubject.value = time;
      }
    }
  }

  Future<void> showDateTimePickerStart(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final TimeOfDay selectedTime = TimeOfDay.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      selectableDayPredicate: (DateTime val) =>
          val.day < selectedDate.day ? false : true,
    );

    if (pickedDate != null) {
      // ignore: use_build_context_synchronously
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime,
      );
      if (pickedTime != null) {
        selectedDate = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        final String time = DateFormat('dd-MM-yyyy hh:mm').format(selectedDate);
        timeStartSubject.value = time;
      }
    }
  }

  late final appBloc = ref.read(BlocProvider.app);

  AddCardBloc(this.ref) {
    init();
  }
}
