enum BoardStatusEnum {
  public(
    title: 'Công khai',
    description: 'Mọi người đều có thể xem và tham gia vào bảng này',
  ),

  private(
    title: 'Riêng tư',
    description: 'Chỉ có bạn làm việc trên bảng này',
  );

  const BoardStatusEnum({
    required this.title,
    required this.description,
  });
  final String title;
  final String description;
}
