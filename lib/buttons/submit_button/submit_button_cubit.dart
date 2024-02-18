part of '../index.dart';


class SubmitButtonCubit extends Cubit<SubmitButtonState> {
  SubmitButtonCubit(String text) : super(SubmitButtonState(isDisabled: false, isLoading: false, text: text));

  enableButton() {
    emit(state.copyWith(isDisabled: false));
  }

  disableButton() {
    emit(state.copyWith(isDisabled: true));
  }

  enableLoading() {
    emit(state.copyWith(isLoading: true));
  }

  disableLoading() {
    emit(state.copyWith(isLoading: false));
  }

  updateText(String newText) {
    emit(state.copyWith(text: newText));
  }
}

