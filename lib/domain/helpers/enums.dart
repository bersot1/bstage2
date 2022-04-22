enum enumEventType { private, public }

extension DescriptionType on enumEventType {
  String get description {
    switch (this) {
      case enumEventType.private:
        return 'Privado';
      case enumEventType.public:
        return 'Publico';
      default:
        return 'N/A';
    }
  }
}
