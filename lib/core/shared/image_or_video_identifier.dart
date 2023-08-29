// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

bool isImageFile(String filePath) {
  final extension = path.extension(filePath).toLowerCase();
  return ['.jpg', '.jpeg', '.png', '.gif', '.bmp'].contains(extension);
}

bool isVideoFile(String filePath) {
  final extension = path.extension(filePath).toLowerCase();
  return ['.mp4', '.mov', '.avi', '.mkv'].contains(extension);
}
