class NoParameters {
  static final NoParameters _instance = NoParameters._internal();

  factory NoParameters() {
    return _instance;
  }

  NoParameters._internal();
}