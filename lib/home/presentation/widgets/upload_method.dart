import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_it/core/shared/image_or_video_identifier.dart';
import 'package:post_it/home/application/bloc/home_bloc.dart';

import 'package:post_it/home/presentation/widgets/video_player_widget.dart';

Future<dynamic> uploadMethod(BuildContext context, {bool isVideo = false}) {
  return showDialog(
      context: context,
      builder: (_) {
        final TextEditingController description = TextEditingController();
        return BlocProvider.value(
          value: context.read<HomeBloc>(),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return AlertDialog(
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (state.selectedPictureOrVideo != null)
                        Column(
                          children: [
                            isVideoFile(state.selectedPictureOrVideo!.path)
                                ? VideoPlayerWidget(
                                    videoUrl: '',
                                    file: state.selectedPictureOrVideo,
                                  )
                                : Image.file(state.selectedPictureOrVideo!),
                            TextField(
                              decoration: const InputDecoration(
                                  hintText: 'Description'),
                              controller: description,
                            )
                          ],
                        )
                      else
                        InkWell(
                          child: Text(isVideo
                              ? 'Select Vedio From Gallery'
                              : 'Select Image From Gallery'),
                          onTap: () => isVideo
                              ? context
                                  .read<HomeBloc>()
                                  .browseVideoFromGallery()
                              : context
                                  .read<HomeBloc>()
                                  .browsePhotoFromGallery(),
                        )
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      if (state.selectedPictureOrVideo != null) {
                        context.read<HomeBloc>().add(HomeUploadMediaEvent(
                            mediaFile: state.selectedPictureOrVideo!,
                            description: description.text.isEmpty
                                ? null
                                : description.text));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Upload'),
                  )
                ],
              );
            },
          ),
        );
      });
}
