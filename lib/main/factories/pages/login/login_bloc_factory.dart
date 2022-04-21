import 'package:bstage2/main/factories/usecases/user_local_usecase_factory.dart';
import 'package:bstage2/main/factories/usecases/user_remote_usecase_factory.dart';
import 'package:bstage2/ui/pages/login/bloc/bloc.dart';

LoginPageBloc makeLoginBloc() => LoginPageBloc(
      userLocalUsecase: makeUserLocalUsecase(),
      userRemoteUsecase: makeUserRemoteUsecase(),
    );
