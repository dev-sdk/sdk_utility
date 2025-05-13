part of "index.dart";

class SubmitButtonState {
  final bool isLoading;
  final bool isDisabled;
  final String text;
  SubmitButtonState({
    required this.isLoading,
    required this.isDisabled,
    required this.text,
  });

  SubmitButtonState copyWith({
    bool? isLoading,
    bool? isDisabled,
    String? text,
  }) {
    return SubmitButtonState(
      isLoading: isLoading ?? this.isLoading,
      isDisabled: isDisabled ?? this.isDisabled,
      text: text ?? this.text,
    );
  }

  @override
  String toString() => 'SubmitButtonState(isLoading: $isLoading, isDisabled: $isDisabled, text: $text)';

  @override
  bool operator ==(covariant SubmitButtonState other) {
    if (identical(this, other)) return true;

    return other.isLoading == isLoading && other.isDisabled == isDisabled && other.text == text;
  }

  @override
  int get hashCode => isLoading.hashCode ^ isDisabled.hashCode ^ text.hashCode;
}
