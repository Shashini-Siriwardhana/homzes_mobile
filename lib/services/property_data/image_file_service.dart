import 'package:http/http.dart' as http;

class FileService {
  static Future<String> fetchFile(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        return imageUrl;
      }
      return '';
    } catch (e) {
      print('Error fetching file: $e');
      return '';
    }
  }
}
