enum NotificationOptionsEnum {
  all(
    title: 'Tất cả',
  ),
  card(
    title: 'Thẻ',
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
