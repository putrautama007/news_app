import 'data/repository/news_repository_test.dart';
import 'domain/usecases/get_list_news_use_case_test.dart';

void main(){
  /// Use Case
  testGetListNewsUseCase();

  /// Repository
  testNewsRepositoryTest();
}