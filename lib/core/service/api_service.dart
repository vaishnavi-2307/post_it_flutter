import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

import 'package:post_it/home/infrastructure/domain/media_item.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio _dio = Dio();
  ApiService(this.prefs);
  final SharedPreferences prefs;
  Future<Either<Exception, Unit>> getAccessToken() async {
    try {
      final response = await _dio.post(
        'https://api.imgur.com/oauth2/token',
        data: {
          'refresh_token': '8de96d168f8fa32dddf6e4a5906f282531bd126d',
          'client_id': '366fbcffb2b9f29',
          'client_secret': '14b4900a22341ffd75b743450dd5b6f0fff04a40',
          'grant_type': 'refresh_token',
        },
      );
      // Store the access token in SharedPreferences

      await prefs.setString('access_token', response.data['access_token']);
      return right(unit);
    } catch (error) {
      return left(Exception('Failed to refresh token: $error'));
    }
  }

  Future<String?> getStoredAccessToken() async {
    return prefs.getString('access_token');
  }

  Future<Either<Exception, MediaItem>> uploadMedia(
      String imagePath, String? description) async {
    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(imagePath),
        'description': description,
      });
      final token = await getStoredAccessToken();
      final response = await _dio.post(
        'https://api.imgur.com/3/upload',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final media = MediaItem.fromJson(response.data['data']);
        return right(media);
      } else {
        return left(Exception());
      }
    } catch (error) {
      return left(Exception());
    }
  }

  Future<List<MediaItem>?> fetchMediaList({
    int page = 0,
  }) async {
    final token = await getStoredAccessToken();
    final response = await _dio.get(
      'https://api.imgur.com/3/account/me/images/$page',
      queryParameters: {
        'perPage': 8,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = response.data['data'] as List<dynamic>;
      final mediaList = data.map((item) => MediaItem.fromJson(item)).toList();
      return mediaList;
    } else {
      return null;
    }
  }
}
