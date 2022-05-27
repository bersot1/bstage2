import 'package:bstage2/data/models/event_user_was_invited_model.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/domain/usecases/invites.dart';
import 'package:bstage2/ui/pages/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabInvitationBloc extends Bloc<ITabInvitationsEvent, ITabInvitationsState> {
  final IInvitesUsecase inviteUsecase;
  final IUserLocalUsecase userLocalUsecase;

  late String idUser;
  late List<EventUserWasInvitedModel> _eventsToGo;
  late List<EventUserWasInvitedModel> _eventsToBePromoter;

  TabInvitationBloc({
    required this.inviteUsecase,
    required this.userLocalUsecase,
  }) : super(TabInvitationLoadingState()) {
    on<TabInvitationGetDataEvent>(_getData);

    _eventsToGo = [];
    _eventsToBePromoter = [];
  }

  Future<void> _getData(
    TabInvitationGetDataEvent event,
    Emitter<ITabInvitationsState> emit,
  ) async {
    try {
      emit(TabInvitationLoadingState());
      await _getIdUser();
      _eventsToGo = await _getEventsToGo();
      _eventsToBePromoter = await _getEventsToBePromoter();
      emit(TabInvitationSuccessState(eventsToBePromoter: _eventsToBePromoter, eventsToGo: _eventsToGo));
    } catch (_) {
      emit(TabInvitationErrorState());
    }
  }

  Future<List<EventUserWasInvitedModel>> _getEventsToGo() async {
    try {
      return await inviteUsecase.getEventsThatUserWasInvitedToGo(idUser);
    } catch (_) {
      throw Exception();
    }
  }

  Future<List<EventUserWasInvitedModel>> _getEventsToBePromoter() async {
    try {
      return await inviteUsecase.getEventsThatUserWasInvitedToBePromoter(idUser);
    } catch (_) {
      throw Exception();
    }
  }

  Future<void> _getIdUser() async {
    try {
      final currentUser = await userLocalUsecase.getCurrentUser();
      idUser = currentUser!.id;
    } catch (_) {
      throw Exception();
    }
  }
}
