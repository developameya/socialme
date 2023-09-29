import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:socialme/src/core/common/widgets/progress_indicator_widget.dart';

class IndicatorButtonWidget extends HookWidget {
  final String label;

  ///A button with loading indicator.
  ///
  const IndicatorButtonWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    return ElevatedButton(
      onPressed: () {
        //add logic
        isLoading.value = !isLoading.value;
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
