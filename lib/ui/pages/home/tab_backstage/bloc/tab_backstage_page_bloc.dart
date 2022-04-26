import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/ui/pages/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBackstageBloc extends Bloc<ITabBackstageEvent, ITabBackstageState> {
  final IEventUsecases eventUsecases;
  final IUserLocalUsecase userLocalUsecase;
  TabBackstageBloc({
    required this.eventUsecases,
    required this.userLocalUsecase,
  }) : super(TabBackstageLoadingState()) {
    on<TabBackstageGetDataEvent>(getData);
  }

  Future<void> getData(
    TabBackstageGetDataEvent event,
    Emitter<ITabBackstageState> emit,
  ) async {
    try {
      emit(TabBackstageLoadingState());
      final myEvents = await getEvents();
      emit(TabBackstageSuccessState(myEvents));
    } catch (_) {
      emit(TabBackstageErrorState());
    }
  }

  Future<List<EventEntity>> getEvents() async {
    try {
      final idUser = await getIdUser();
      return await eventUsecases.getAllEventAsCreatorByUser(idUser: idUser);
    } catch (_) {
      throw Exception();
    }
  }

  Future<String> getIdUser() async {
    try {
      final currentUser = await userLocalUsecase.getCurrentUser();
      return currentUser!.id;
    } catch (_) {
      throw Exception();
    }
  }
}
