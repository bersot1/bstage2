import 'package:bstage2/main/factories/usecases/user/get_current_usecase_factory.dart';
import 'package:bstage2/ui/pages/splash/bloc/splash_page_bloc.dart';

SplashPageBloc makeSplashPageBloc() => SplashPageBloc(getCurrentUsecase: makeGetCurrentUsecase());
