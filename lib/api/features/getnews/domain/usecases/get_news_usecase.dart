import 'package:dartz/dartz.dart';
import 'package:news_api/api/core/failure/allFailures.dart';
import 'package:news_api/api/features/getnews/domain/entities/entity_model.dart';
import 'package:news_api/api/features/getnews/domain/repositories/get_repository.dart';

class GetNewsUsecase {
  GetRepository getRepository;
  GetNewsUsecase(this.getRepository);
  Future<Either<Failure,List<EntityModel>>> call(String category)async{
    return await getRepository.getNews(category);
  }
}