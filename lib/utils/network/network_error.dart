class NetworkError {
  final int code;
  final String? title;
  final String message;

  NetworkError({
    this.code = -1,
    this.title,
    this.message = 'Ops! ocorreu um erro.',
  });

  @override
  String toString() => message;
}
