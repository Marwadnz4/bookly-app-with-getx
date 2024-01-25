import 'package:dartz/dartz.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:dio/dio.dart';


class SearchRepo {
  final ApiService apiService;
  SearchRepo(this.apiService);

  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({
    required String keyword,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=$keyword',
      );

      List<BookModel> books = [];

      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          print(item);
        }
      }
      return right(books);
    } on Exception catch (errMessage) {
      if (errMessage is DioException) {
        return left(ServerFailure.fromDioError(errMessage));
      }
      return left(ServerFailure(errMessage.toString()));
    }
  }
}
