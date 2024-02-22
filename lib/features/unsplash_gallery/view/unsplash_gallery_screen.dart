import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:unsplash_gallery/features/unsplash_gallery/bloc/unsplash_gallery_bloc.dart';
import 'package:unsplash_gallery/features/unsplash_gallery/widgets/photo_title.dart';
import 'package:unsplash_gallery/repositories/models/unsplash_gallery.dart';
import 'package:unsplash_gallery/repositories/unsplash_gallery_repository.dart';

class UnsplashGalleryScreen extends StatefulWidget {
  const UnsplashGalleryScreen({super.key});

  @override
  State<UnsplashGalleryScreen> createState() => _UnsplashGalleryScreenState();
}

class _UnsplashGalleryScreenState extends State<UnsplashGalleryScreen> {
  final ScrollController _scrollController = ScrollController();
  final _unsplashGalleryBloc =
      UnsplashGalleryBloc(GetIt.I<UnsplashGalleryRepository>());

  @override
  void initState() {
    _unsplashGalleryBloc.add(LoadCUnsplashGallery());
    super.initState();
  }

  void setupScrollController(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          _unsplashGalleryBloc.add(LoadCUnsplashGallery());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    setupScrollController(context);
    bool isLoading = false;
    List<UnsplashGallery> gallery = [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unsplash Gallery'),
        centerTitle: true,
      ),
      body: BlocBuilder<UnsplashGalleryBloc, UnsplashGalleryState>(
        bloc: _unsplashGalleryBloc,
        builder: (context, state) {
          if (state is UnsplashGalleryLoading && state.isFirstFetch) {
            const Center(child: CircularProgressIndicator());
          } else if (state is UnsplashGalleryLoading) {
            gallery = state.oldGallery;
            isLoading = true;
          } else if (state is UnsplashGalleryLoaded) {
            gallery = state.gallery;
          } else if (state is UnsplashGalleryLoadingFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    state.exception.toString(),
                    style: theme.textTheme.headlineMedium,
                  ),
                  Text(
                    'Please try againg later',
                    style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      _unsplashGalleryBloc.add(LoadCUnsplashGallery());
                    },
                    child: const Text('Try againg'),
                  ),
                ],
              ),
            );
          }
          return ListView.separated(
            controller: _scrollController,
            itemCount: gallery.length + (isLoading ? 1 : 0),
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              if (index < gallery.length) {
                final photo = gallery[index];
                return PhotoTitle(photo: photo);
              } else {
                Timer(const Duration(milliseconds: 30), () {
                  _scrollController
                      .jumpTo(_scrollController.position.maxScrollExtent);
                });
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }
}
