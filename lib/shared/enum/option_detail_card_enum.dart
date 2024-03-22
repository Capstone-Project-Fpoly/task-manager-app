enum OptionDetailCardEnum {
  watch(
    title: 'Xem',
    id: 0,
  ),

  move(
    title: 'Di chuyển thẻ',
    id: 1,
  ),

  copy(
    title: 'Sao chép thẻ',
    id: 2,
  ),

  save(
    title: 'Lưu',
    id: 3,
  ),

  delete(
    title: 'Xóa',
    id: 4,
  );

  const OptionDetailCardEnum({
    required this.title,
    required this.id,
  });
  final String title;
  final int id;
}
