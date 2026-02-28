enum ErrorSource { fashion, foodVision, home, insurance, salaries, startup }

class UiError {
  final ErrorSource source;
  final String message;

  UiError({required this.source, required this.message});
}
