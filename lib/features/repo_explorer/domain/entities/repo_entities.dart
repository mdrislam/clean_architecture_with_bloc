import 'package:equatable/equatable.dart';

class RepoEntity extends Equatable {
  final int id;
  final String name;
  final String fullName;
  final String? description;
  final int stars;
  final int forks;
  final String ownerName;
  final String ownerAvatarUrl;
  final String htmlUrl;

  const RepoEntity({
    required this.id,
    required this.name,
    required this.fullName,
    this.description,
    required this.stars,
    required this.forks,
    required this.ownerName,
    required this.ownerAvatarUrl,
    required this.htmlUrl,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    fullName,
    description,
    stars,
    forks,
    ownerName,
    ownerAvatarUrl,
    htmlUrl,
  ];
}
