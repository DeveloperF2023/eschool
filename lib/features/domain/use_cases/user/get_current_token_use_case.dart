import '../../repositories/repository.dart';

class GetCurrentTokenUseCase {
  final Repository repository;

  GetCurrentTokenUseCase({required this.repository});
  Future<String> callback() {
    return repository.getCurrentTokenUser();
  }
}
