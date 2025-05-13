part of '../index.dart';

class PasswordCubit extends Cubit<bool> {
  PasswordCubit() : super(false);

  toggle() {
    emit(!state);
  }
}
