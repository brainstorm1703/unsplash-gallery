import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unsplash_gallery.g.dart';

@JsonSerializable()
class UnsplashGallery extends Equatable {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'author')
  final String author;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'imageUrl')
  final String imageUrl;

  const UnsplashGallery({
    required this.id,
    required this.author,
    required this.description,
    required this.imageUrl,
  });

  factory UnsplashGallery.fromJson(Map<String, dynamic> json) =>
      _$UnsplashGalleryFromJson(json);

  Map<String, dynamic> toJson() => _$UnsplashGalleryToJson(this);

  @override
  List<Object> get props => [
        id,
        author,
        description,
        imageUrl,
      ];
}
