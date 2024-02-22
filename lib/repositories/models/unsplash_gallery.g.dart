// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsplash_gallery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnsplashGallery _$UnsplashGalleryFromJson(Map<String, dynamic> json) =>
    UnsplashGallery(
      id: json['id'] as String,
      author: json['author'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$UnsplashGalleryToJson(UnsplashGallery instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };
