import 'package:dartz/dartz.dart';
import 'package:news_api/api/features/getnews/domain/entities/entity_model.dart';

import '../../../../core/failure/allFailures.dart';

abstract class GetRepository {
  Future<Either<Failure,List<EntityModel>>> getNews(String category);
}