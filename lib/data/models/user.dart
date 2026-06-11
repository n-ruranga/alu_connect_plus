class UserModel {
  final String id;
  final String name;
  final String campus;
  final String avatarUrl;
  final int eventsJoined;
  final int communities;
  final int connections;

  const UserModel({
    required this.id,
    required this.name,
    required this.campus,
    required this.avatarUrl,
    required this.eventsJoined,
    required this.communities,
    required this.connections,
  });
}
