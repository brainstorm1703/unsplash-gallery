import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/repositories/models/unsplash_gallery.dart';
import 'package:unsplash_gallery/repositories/unsplash_gallery_repository.dart';

part 'unsplash_gallery_state.dart';
part 'unsplash_gallery_event.dart';

class UnsplashGalleryBloc
    extends Bloc<UnsplashGalleryEvent, UnsplashGalleryState> {
  int currentPage = 1;
  UnsplashGalleryBloc(this.unsplashGalleryRepository)
      : super(UnsplashGalleryInitial()) {
    on<LoadCUnsplashGallery>(_load);
  }

  final UnsplashGalleryRepository unsplashGalleryRepository;

  Future<void> _load(
    LoadCUnsplashGallery event,
    Emitter<UnsplashGalleryState> emit,
  ) async {
    try {
      if (state is UnsplashGalleryLoading) return;
      final currentState = state;

      var oldGallery = <UnsplashGallery>[];
      if (currentState is UnsplashGalleryLoaded) {
        oldGallery = currentState.gallery;
      }
      emit(UnsplashGalleryLoading(oldGallery, isFirstFetch: currentPage == 1));
      final gallery =
          await unsplashGalleryRepository.getUnsplashGallery(page: currentPage);
      currentPage++;
      oldGallery.addAll(gallery);
      emit(UnsplashGalleryLoaded(gallery: oldGallery));
    } on DioException catch (e) {
      emit(UnsplashGalleryLoadingFailure(exception: 'dio Exeprion + $e'));
    } catch (e) {
      emit(UnsplashGalleryLoadingFailure(exception: Exception(e)));
    }
  }
}
