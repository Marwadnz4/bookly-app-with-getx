import 'package:dartz/dartz.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dio/dio.dart';

import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:Programming');

      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (errMessage) {
      if (errMessage is DioException) {
        return left(ServerFailure.fromDioError(errMessage));
      }
      return left(ServerFailure(errMessage.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=subject:computer science',
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=$category',
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

  @override
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
