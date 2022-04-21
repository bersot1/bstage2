import 'package:bstage2/main/factories/usecases/user_local_usecase_factory.dart';
import 'package:bstage2/ui/pages/splash/bloc/splash_page_bloc.dart';

SplashPageBloc makeSplashPageBloc() => SplashPageBloc(userLocalUsecase: makeUserLocalUsecase());
