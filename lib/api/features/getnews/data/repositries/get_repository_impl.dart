import 'package:dartz/dartz.dart';
import 'package:news_api/api/core/failure/allFailures.dart';
import 'package:news_api/api/core/failure/exception.dart';
import 'package:news_api/api/core/internetckecker/internet_checker.dart';
import 'package:news_api/api/features/getnews/data/data_source/remote_data_source.dart';
import 'package:news_api/api/features/getnews/domain/entities/entity_model.dart';
import 'package:news_api/api/features/getnews/domain/repositories/get_repository.dart';

class GetRepositoryImpl implements GetRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  GetRepositoryImpl(this.remoteDataSource, this.networkInfo);
  @override
  Future<Either<Failure, List<EntityModel>>> getNews(String category) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteget = await remoteDataSource.getNews(category);
        return Right(remoteget as List<EntityModel>);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OffLineFailure());
    }
  }
}
