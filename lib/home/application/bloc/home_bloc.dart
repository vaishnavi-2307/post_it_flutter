// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:post_it/core/service/api_service.dart';
import 'package:post_it/core/service/pick_image_service.dart';
import 'package:post_it/home/infrastructure/domain/media_item.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._pickImageService, {required this.apiService})
      : super(HomeState.initial()) {
    on<HomeApiCallEvent>(_onHomeApiCallEvent);
    on<HomeUploadMediaEvent>(_onHomeUploadMediaEventToState);
  }

  final ApiService apiService;
  final PickImageService _pickImageService;

  Future<void> _onHomeApiCallEvent(
    HomeApiCallEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (!state.hasMore) {
      emit(state.copyWith(status: HomeStatus.loading));
    }
    // Fetch current page media items
    final currentPageMedia = await apiService.fetchMediaList(
      page: state.currentPage,
    );

    if (currentPageMedia != null) {
      final hasMore = currentPageMedia.isNotEmpty;

      if (state.currentPage == 0) {
        emit(state.copyWith(
          media: currentPageMedia,
          hasMore: hasMore,
          status: HomeStatus.loaded,
        ));
      } else {
        // If it's not the first page, combine new media with existing media
        final combinedMedia = [
          ...state.media ?? <MediaItem>[],
          ...currentPageMedia
        ];
        emit(state.copyWith(
          media: combinedMedia,
          hasMore: false,
          status: HomeStatus.loaded,
        ));
      }
    } else {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }

  Future<void> _onHomeUploadMediaEventToState(
    HomeUploadMediaEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    final failOrsuccess = await apiService.uploadMedia(
      event.mediaFile.path,
      event.description,
    );
    failOrsuccess.fold((l) => emit(state.copyWith(status: HomeStatus.error)),
        (r) {
      final updatedMedia = List<MediaItem>.from(state.media ?? []);
      updatedMedia.add(r);

      emit(state.copyWith(
        media: updatedMedia,
        status: HomeStatus.loaded,
        selectedPictureOrVideo: null,
        hasMore: false,
      ));
    });
  }

  Future<void> browsePhotoFromGallery() async {
    final pickedImageFile = await _pickImageService.pickImage();
    if (pickedImageFile != null) {
      emit(state.copyWith(selectedPictureOrVideo: pickedImageFile));
    }
  }

  Future<void> browseVideoFromGallery() async {
    final pickedImageFile = await _pickImageService.pickVideo();
    if (pickedImageFile != null) {
      emit(state.copyWith(selectedPictureOrVideo: pickedImageFile));
    }
  }

  void increaseCurrentPage() {
    emit(state.copyWith(currentPage: state.currentPage + 1));
  }
}
