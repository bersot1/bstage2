class PromoterEntity {
  final DateTime? acceptedPromoter;
  final DateTime? acceptedEventOwner;
  final int? amoutAccess;
  final int? amoutInvitations;
  final String idUser;
  final String idEvent;

  PromoterEntity({
    this.acceptedPromoter,
    this.acceptedEventOwner,
    this.amoutAccess,
    this.amoutInvitations,
    required this.idUser,
    required this.idEvent,
  });
}
