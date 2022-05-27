import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/ui/pages/event_details/bloc/event_details_page_event.dart';
import 'package:bstage2/ui/pages/event_details/bloc/event_details_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum WhoAmI {
  promoter, // Promoter do event
  owner, // dono do evento
  guess, // normal utilizador que ja está na lista do evento
  normalUser, // normal utilizador
}

class EventDetailsBloc extends Bloc<IEventDetailsPageEvent, IEventDetailsPageState> {
  EventDetailsBloc({required this.eventParam}) : super(EventDetailsPageLoadingState()) {
    eventDetails = eventParam;

    on<EventDetailsPageGetInitialDataEvent>(getInitialData);
  }

  final EventEntity eventParam;

  late EventEntity eventDetails;
  late String idUser;
  late WhoAmI whoAmI;
  late String? invitedBy;
  late bool isEventExpired;
  late String categoryName;

  Future<void> getInitialData(
    EventDetailsPageGetInitialDataEvent event,
    Emitter<IEventDetailsPageState> emit,
  ) async {
    print('teste');
    print(eventDetails.name);
  }
}

//     1. IdPerfil ✅
// 2. Verificar se é convidado (gellAllInvitersOfTheEvent ✅)
// 3. Verificar o nome de quem convidou (eventsThatIamInvitedPublicEvent) -> pegar dados no tabInvitation ✅
// 4. verificar se o evento está expirado ✅ -> date
// 5. nome da categoria ✅
// 6. verificar se é criador ✅
