enum UIError {
  unexpected,
  userAlreadyCreated,
}

extension UIErrorExtension on UIError {
  String get description {
    switch (this) {
      case UIError.userAlreadyCreated:
        return "Usuário já criado.";
      default:
        return "Algo errado aconteceu. Tente novamente em breve.";
    }
  }
}
