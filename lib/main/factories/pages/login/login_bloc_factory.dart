import '../../../../main/factories/usecases/user_local_usecase_factory.dart';
import '../../../../main/factories/usecases/user_remote_usecase_factory.dart';
import '../../../../ui/ui.dart';

LoginPageBloc makeLoginBloc() => LoginPageBloc(
      userLocalUsecase: makeUserLocalUsecase(),
      userRemoteUsecase: makeUserRemoteUsecase(),
    );
