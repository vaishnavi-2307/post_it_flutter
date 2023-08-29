part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class HomeApiCallEvent extends HomeEvent {
  const HomeApiCallEvent();
}

class HomeUploadMediaEvent extends HomeEvent {
  final File mediaFile;
  final String? description;

  const HomeUploadMediaEvent({
    required this.mediaFile,
    required this.description,
  });

  @override
  List<Object?> get props => [mediaFile, description];
}
