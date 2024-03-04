enum NotificationOptionsEnum {
  all(
    title: 'Tất cả',
  ),
  me(
    title: 'Tôi',
  ),
  comment(
    title: 'Bình luận',
  ),
  invite(
    title: 'Yêu cầu tham gia',
  );

  const NotificationOptionsEnum({
    required this.title,
  });
  final String title;
}
