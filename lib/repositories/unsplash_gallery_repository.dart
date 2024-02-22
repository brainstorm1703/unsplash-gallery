import 'package:dio/dio.dart';
import 'package:unsplash_gallery/repositories/models/unsplash_gallery.dart';

class UnsplashGalleryRepository {
  final Dio dio;

  final String uri =
      'https://api.unsplash.com/photos/?client_id=ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';

  UnsplashGalleryRepository({required this.dio});

  Future<List<UnsplashGallery>> getUnsplashGallery({required int page}) async {
    try {
      final response = await dio.get('$uri&page=$page');
      final data = response.data as List<dynamic>;
      final gallery = data.map((json) {
        return UnsplashGallery(
          id: json['id'],
          author: json['user']['username'],
          description: json['description'] ?? 'no description',
          imageUrl: json['urls']['regular'],
        );
      }).toList();
      return gallery;
    } catch (error) {
      throw Exception('Error fetching Unsplash gallery: $error');
    }
  }
}
