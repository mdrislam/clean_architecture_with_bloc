import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:tikweb_task/features/repo_explorer/domain/entities/repo_entities.dart';
part 'repo_model.g.dart';

@HiveType(typeId: 0)
class RepoModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String fullName;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final int stars;
  @HiveField(5)
  final int forks;
  @HiveField(6)
  final String ownerName;
  @HiveField(7)
  final String ownerAvatarUrl;
  @HiveField(8)
  final String htmlUrl;

  const RepoModel({
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

  factory RepoModel.fromJson(Map<String, dynamic> json) {
    return RepoModel(
      id: json['id'],
      name: json['name'],
      fullName: json['full_name'],
      description: json['description'],
      stars: json['stargazers_count'],
      forks: json['forks_count'],
      ownerName: json['owner']['login'],
      ownerAvatarUrl: json['owner']['avatar_url'],
      htmlUrl: json['html_url'],
    );
  }

  RepoEntity toEntity() {
    return RepoEntity(
      id: id,
      name: name,
      fullName: fullName,
      description: description,
      stars: stars,
      forks: forks,
      ownerName: ownerName,
      ownerAvatarUrl: ownerAvatarUrl,
      htmlUrl: htmlUrl,
    );
  }

  @override
  List<Object?> get props => [id];
}
