import 'package:http/http.dart' as http;
import 'package:pop_movies/utils/api_constants.dart';

class ApiService {
  Future<http.Response> fetchMovies({int? page}) async {
    Uri url = Uri.parse('${ApiConstants.BASE_URL}${ApiConstants.POPULAR_MOVIE}?api_key=${ApiConstants.API_KEY}&page=$page');
    print(url);
    return await http.get(url);
  }
}
