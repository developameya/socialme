import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:socialme/src/core/common/widgets/progress_indicator_widget.dart';
import 'package:socialme/src/dummy_auth_provider.dart';

class IndicatorButtonWidget extends HookConsumerWidget {
  final String label;

  ///A button with loading indicator.
  ///
  const IndicatorButtonWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    return ElevatedButton(
      onPressed: () {
        //add logic
        isLoading.value = !isLoading.value;
        ref.read(dummyAuthProvider.notifier).state = true;
      },
      child: SizedBox(
        width: 100,
        child: Center(
          child:
              isLoading.value ? const ProgressIndicatorWidget() : Text(label),
        ),
      ),
    );
  }
}
