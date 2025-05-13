part of '../index.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final bool requiredValidation;
  final InputBorder? border;
  const PasswordTextField(this.controller, {this.label, this.border, this.requiredValidation = true, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PasswordCubit(),
      child: BlocBuilder<PasswordCubit, bool>(
        builder: (context, state) {
          return TextFormField(
            key: key,
            controller: controller,
            validator: !requiredValidation ? null : (value) => PasswordValidations().validateFull(value),
            obscureText: !state,
            decoration: InputDecoration(
              border: border,
              labelText: label,
              suffixIcon: IconButton(
                  onPressed: () {
                    final passwordCubit = context.read<PasswordCubit>();
                    passwordCubit.toggle();
                  },
                  icon: Icon(
                    state ? Icons.lock_open : Icons.lock,
                  )),
            ),
          );
        },
      ),
    );
  }
}
