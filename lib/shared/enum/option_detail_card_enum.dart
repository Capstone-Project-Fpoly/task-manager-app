enum OptionDetailCardEnum {
  watch(
    title: 'Xem',
    id: 1,
  ),

  move(
    title: 'Di chuyển thẻ',
    id: 2,
  ),

  copy(
    title: 'Sao chép thẻ',
    id: 3,
  ),

  save(
    title: 'Lưu',
    id: 4,
  ),

  delete(
    title: 'Xóa',
    id: 5,
  );

  const OptionDetailCardEnum({
    required this.title,
    required this.id,
  });
  final String title;
  final int id;
}
