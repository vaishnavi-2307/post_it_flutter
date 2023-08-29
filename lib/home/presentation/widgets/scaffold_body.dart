import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_it/home/application/bloc/home_bloc.dart';

import 'video_player_widget.dart';

class ScaffoldBody extends StatefulWidget {
  const ScaffoldBody({super.key});

  @override
  State<ScaffoldBody> createState() => _ScaffoldBodyState();
}

class _ScaffoldBodyState extends State<ScaffoldBody> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_isLoadingMore &&
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
      setState(() {
        _isLoadingMore = true;
      });
      context.read<HomeBloc>().increaseCurrentPage();
      context.read<HomeBloc>().add(const HomeApiCallEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: context.read<HomeBloc>(),
      builder: (context, state) {
        if (state.status == HomeStatus.loading && !state.hasMore) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == HomeStatus.loaded) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 12.0,
                    ),
                    itemCount: state.media?.length ?? 0,
                    itemBuilder: (context, index) {
                      final mediaItem = state.media![index];

                      return mediaItem.type == "video/mp4"
                          ? VideoPlayerWidget(videoUrl: mediaItem.link)
                          : Column(
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          mediaItem.link),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                if (mediaItem.description != null)
                                  Text(mediaItem.description!)
                              ],
                            );
                    },
                  ),
                ),
              ),
              if (_isLoadingMore && state.hasMore)
                const Center(child: CircularProgressIndicator())
            ],
          );
        } else if (state.status == HomeStatus.error) {
          return const Center(
            child: Text('Something went wrong!'),
          );
        }
        return const SizedBox();
      },
    );
  }
}
