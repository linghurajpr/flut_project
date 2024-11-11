class Insurance {
  final String id;
  final String userId;
  final String details;
  final String status;  // e.g., "Pending", "Approved", "Rejected"
  final String documentUrl;

  Insurance({
    required this.id,
    required this.userId,
    required this.details,
    required this.status,
    required this.documentUrl,
  });

  factory Insurance.fromJson(Map<String, dynamic> json) {
    return Insurance(
      id: json['id'],
      userId: json['userId'],
      details: json['details'],
      status: json['status'],
      documentUrl: json['documentUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'details': details,
      'status': status,
      'documentUrl': documentUrl,
    };
  }
}
