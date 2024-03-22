import 'package:task_manager/feature/detail_card/detail_card_bloc.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';

extension DetailCardUserExtension on DetailCardBloc {
  void addUserToCard(Fragment$UserFragment? user) {
    // nếu đã có user trong danh sách thì xóa đi,nếu chưa có thì thêm vào
    final users = usersSubject.value;
    if (users.contains(user)) {
      users.remove(user);
    } else {
      users.add(user);
    }
    usersSubject.value = users;
  }
}
