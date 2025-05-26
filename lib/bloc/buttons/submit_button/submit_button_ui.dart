part of '../index.dart';

class SubmitButton extends StatelessWidget {
  /// ```dart
  /// @Example
  /// SubmitButton( "text",
  /// isPrimaryColor: true, // true for Primary Color as Background color false for white Background
  /// onClick: (buttonCubit) async {
  ///   buttonCubit.disableButton();
  ///   ...
  ///   buttonCubit.enableButton();
  /// }),
  /// ```
  const SubmitButton(this.text, {required this.onClick, this.onLongPress, this.isPrimaryColor = true, super.key});

  final String text;
  final Future<void> Function(SubmitButtonCubit) onClick;
  final Future<void> Function(SubmitButtonCubit)? onLongPress;
  final bool isPrimaryColor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SubmitButtonCubit(text),
      child: BlocBuilder<SubmitButtonCubit, SubmitButtonState>(
        builder: (context, state) {
          return ElevatedButton(
            key: key,
            onPressed: state.isDisabled
                ? null
                : (() async {
                    final networkCubit = context.read<NetworkConnectionCubit>();
                    if (!networkCubit.isConnected) return;
                    if (state.isLoading) return;
                    final controller = context.read<SubmitButtonCubit>();
                    controller.enableLoading();
                    await onClick(controller);
                    controller.disableLoading();
                  }),
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).primaryColor)),
            onLongPress: state.isDisabled || onLongPress == null
                ? null
                : (() async {
                    final networkCubit = context.read<NetworkConnectionCubit>();
                    if (!networkCubit.isConnected) return;
                    if (state.isLoading) return;
                    final controller = context.read<SubmitButtonCubit>();
                    controller.enableLoading();
                    await onLongPress!(controller);
                    controller.disableLoading();
                  }),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Visibility(
                  visible: !state.isLoading,
                  replacement: const SizedBox(height: 20, width: 20, child: CircularProgressIndicator()),
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                  ),
                )

                /*   Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                  ),
                  if (state.isLoading)
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Theme.of(context).primaryColor)),
                    )
                ],
              ), */
                ),
          );
        },
      ),
    );
  }
}
