part of 'unsplash_gallery_bloc.dart';

abstract class UnsplashGalleryState extends Equatable {
  get gallery => null;
}

class UnsplashGalleryInitial extends UnsplashGalleryState {
  @override
  List<Object?> get props => [];
}

class UnsplashGalleryLoading extends UnsplashGalleryState {
  final List<UnsplashGallery> oldGallery;

  final bool isFirstFetch;

  UnsplashGalleryLoading(this.oldGallery, {this.isFirstFetch = false});
  @override
  List<Object?> get props => [oldGallery];
}

class UnsplashGalleryLoaded extends UnsplashGalleryState {
  UnsplashGalleryLoaded({
    required this.gallery,
  });

  @override
  final List<UnsplashGallery> gallery;

  @override
  List<Object?> get props => [gallery];
}

class UnsplashGalleryLoadingFailure extends UnsplashGalleryState {
  UnsplashGalleryLoadingFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
