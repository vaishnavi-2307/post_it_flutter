part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final List<MediaItem>? media;
  final File? selectedPictureOrVideo;
  final int currentPage;
  final bool hasMore;

  const HomeState(
      {required this.status,
      required this.media,
      required this.currentPage,
      required this.hasMore,
      required this.selectedPictureOrVideo});

  static HomeState initial() => const HomeState(
      status: HomeStatus.initial,
      media: null,
      hasMore: false,
      selectedPictureOrVideo: null,
      currentPage: 0);

  HomeState copyWith({
    HomeStatus? status,
    List<MediaItem>? media,
    File? selectedPictureOrVideo,
    int? currentPage,
    bool? hasMore,
  }) =>
      HomeState(
        currentPage: currentPage ?? this.currentPage,
        status: status ?? this.status,
        hasMore: hasMore ?? this.hasMore,
        media: media ?? this.media,
        selectedPictureOrVideo:
            selectedPictureOrVideo ?? selectedPictureOrVideo,
      );

  @override
  List<Object?> get props =>
      [status, media, selectedPictureOrVideo, currentPage, hasMore];
}
