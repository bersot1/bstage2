import 'package:bstage2/ui/pages/home/root/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPageBloc extends Bloc<IRootPageEvent, int> {
  late int currentIndex;

  RootPageBloc() : super(0) {
    on<IRootPageEvent>(changeTab);

    currentIndex = 0;
  }

  void updateEventInternalData() {
    // Eventos/eventosQueEuSoliciteiSerPromoter/idPerfil
    // Eventos/withPendenciesFromProdutorToPromotersTobePromoters/perfil/idPerfil
  }

  void changeTab(
    IRootPageEvent event,
    Emitter<int> emit,
  ) {
    if (event is RootPageTabEvent) {
      emit(0);
      currentIndex = 0;
    }
    if (event is RootPageTabInvitation) {
      emit(1);
      currentIndex = 1;
    }
    if (event is RootPageTabBackstage) {
      emit(2);
      currentIndex = 2;
    }
    if (event is RootPageTabProfile) {
      emit(3);
      currentIndex = 3;
    }
  }
}
