import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/core/common/entities/user.dart';
import 'package:blog_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLogInuseCase implements UseCase<User, UserLogInParams> {
  final AuthRepository authRepository;
  const UserLogInuseCase(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserLogInParams params) async {
    return await authRepository.loginWithEmailPassword(
        email: params.email, password: params.password);
  }
}

class UserLogInParams {
  final String email;
  final String password;

  const UserLogInParams({required this.email, required this.password});
}
