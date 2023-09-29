// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:socialme/src/core/utils/usecase/copyable.dart';

/// A class that represents an item in the newsFeed.
class NewsFeedItemEntity extends Equatable
    implements Copyable<NewsFeedItemEntity> {
  final String id;

  final String author;

  final String createdAt;

  final String? title;

  final String? description;

  final String? imageUrl;

  final String? authorImageUrl;

  const NewsFeedItemEntity({
    required this.id,
    required this.author,
    required this.createdAt,
    this.title,
    this.description,
    this.imageUrl,
    this.authorImageUrl,
  });

  @override
  List<Object?> get props =>
      [id, author, createdAt, title, description, imageUrl, authorImageUrl];

  @override
  NewsFeedItemEntity copy() => NewsFeedItemEntity(
        id: id,
        author: author,
        createdAt: createdAt,
      );

  @override
  NewsFeedItemEntity copyWith({
    String? id,
    String? author,
    String? createdAt,
    String? title,
    String? description,
    String? imageUrl,
    String? authorImageUrl,
  }) =>
      NewsFeedItemEntity(
        id: id ?? this.id,
        author: author ?? this.author,
        createdAt: createdAt ?? this.createdAt,
        title: title ?? this.title,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        authorImageUrl: authorImageUrl ?? this.authorImageUrl,
      );
}
