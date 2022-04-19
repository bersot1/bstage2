import 'package:bstage2/main/factories/usecases/user/create_account_factory.dart';
import 'package:bstage2/main/factories/usecases/user/insert_account_local_factory.dart';
import 'package:bstage2/main/factories/usecases/user/login_social_usecase_factory.dart';
import 'package:bstage2/main/factories/usecases/user/verify_account_exist_factory.dart';
import 'package:bstage2/ui/pages/login/bloc/bloc.dart';

LoginPageBloc makeLoginBloc() => LoginPageBloc(
      createAccountUsecase: makeCreateAccount(),
      loginSocial: makeLoginSocial(),
      insertAccountLocalUsecase: makeInsertAccountLocal(),
      verifyAccountExistUsecase: makeVerifyAccountUsecase(),
    );
