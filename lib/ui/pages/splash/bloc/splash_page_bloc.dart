import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/ui/pages/splash/bloc/splash_page_event.dart';
import 'package:bstage2/ui/pages/splash/bloc/splash_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPageBloc extends Bloc<ISplashPageEvent, ISplashPageState> {
  final IUserLocalUsecase userLocalUsecase;

  SplashPageBloc({
    required this.userLocalUsecase,
  }) : super(SplashPageLoadingState()) {
    on<SplashPageStartEvent>(_verifyUserExist);
  }

  Future<void> _verifyUserExist(
    SplashPageStartEvent event,
    Emitter<ISplashPageState> emit,
  ) async {
    emit(SplashPageLoadingState());
    try {
      final result = await userLocalUsecase.getCurrentUser();
      if (result != null) {
        emit(SplashPageUserLoggedState());
      } else {
        emit(SplashPageUserNotFoundState());
      }
    } catch (_) {
      emit(SplashPageUnexpectedErrorState());
    }
  }
}
