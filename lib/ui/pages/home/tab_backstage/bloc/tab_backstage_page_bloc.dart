import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/ui/pages/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBackstageBloc extends Bloc<ITabBackstageEvent, ITabBackstageState> {
  final IEventUsecases eventUsecases;
  final IUserLocalUsecase userLocalUsecase;

  late List<EventEntity> _myEventsAsProdutor;
  late List<EventEntity> _myEventsAsPromoter;
  late String _idUser;

  TabBackstageBloc({
    required this.eventUsecases,
    required this.userLocalUsecase,
  }) : super(TabBackstageLoadingState()) {
    on<TabBackstageGetDataEvent>(getData);

    _myEventsAsProdutor = [];
    _myEventsAsPromoter = [];
  }

  Future<void> getData(
    TabBackstageGetDataEvent event,
    Emitter<ITabBackstageState> emit,
  ) async {
    try {
      emit(TabBackstageLoadingState());
      await getIdUser();
      _myEventsAsProdutor = await getEventsAsProdutor();
      _myEventsAsPromoter = await getEventsAsPromoter();
      emit(TabBackstageSuccessState(myEventsAsCreator: _myEventsAsProdutor, myEventsAsPromoter: _myEventsAsPromoter));
    } catch (_) {
      emit(TabBackstageErrorState());
    }
  }

  Future<List<EventEntity>> getEventsAsProdutor() async {
    try {
      return await eventUsecases.getAllEventAsCreatorByUser(idUser: _idUser);
    } catch (_) {
      throw Exception();
    }
  }

  Future<List<EventEntity>> getEventsAsPromoter() async {
    try {
      return await eventUsecases.getAllEventAsPromoterByUser(idUser: _idUser);
    } catch (_) {
      throw Exception();
    }
  }

  Future<void> getIdUser() async {
    try {
      final currentUser = await userLocalUsecase.getCurrentUser();
      _idUser = currentUser!.id;
    } catch (_) {
      throw Exception();
    }
  }
}
