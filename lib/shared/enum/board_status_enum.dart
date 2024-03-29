enum BoardStatusEnum {
  public(
    isPublic: true,
    title: 'Công khai',
    description:
        'Đây là bảng công khai. Mọi người đều có thể xem và tham gia vào bảng này',
  ),

  private(
    isPublic: false,
    title: 'Riêng tư',
    description:
        'Đây là bảng riêng tư. Chỉ bạn có thể xem làm việc trên bảng này',
  );

  const BoardStatusEnum({
    required this.isPublic,
    required this.title,
    required this.description,
  });
  final bool isPublic;
  final String title;
  final String description;
}
