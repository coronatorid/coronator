// ID
// UserID
// Status
// ImagePath
// ImageDeleted
// CreatedAt
// UpdatedAt

class ReportSerializer {
  final int id;
  final int userId;
  final int status;
  final String imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;

  ReportSerializer(
    this.id,
    this.userId,
    this.status,
    this.imagePath,
    this.createdAt,
    this.updatedAt,
  );

  static ReportSerializer fromJson(Map<String, dynamic> json) {
    return ReportSerializer(
      json['id'],
      json['user_id'],
      json['status'],
      json['image_path'],
      DateTime.parse(json['created_at']),
      DateTime.parse(json['updated_at']),
    );
  }

  String statusHumanized() {
    switch (this.status) {
      case 0:
        return "dikonfirmasi";
        break;
      case 1:
        return "ditolak";
        break;
      case 2:
        return "diproses";
        break;
      default:
        return "diproses";
    }
  }
}
