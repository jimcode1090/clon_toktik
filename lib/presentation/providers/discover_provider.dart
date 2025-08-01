import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';


class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepository videoPostsRepository;

  List<VideoPost> videos = [];
  bool initialLoading = true;

  DiscoverProvider({required this.videoPostsRepository});

  Future<void> loadNextPage() async {
    final newVideos = await videoPostsRepository.getTrendingVideosByPage(1);
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
