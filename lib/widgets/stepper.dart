import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikishaadmin/widgets/text_widget.dart';

class CustomeStepper extends ConsumerStatefulWidget {
  const CustomeStepper({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomeStepperState();
}

class _CustomeStepperState extends ConsumerState<CustomeStepper> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: index,
      onStepCancel: () {
        if (index > 0) {
          setState(() {
            index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (index <= 0) {
          setState(() {
            index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          index = index;
        });
      },
      steps: const [
        Step(
            title: InfoText(text: "Packed"),
            content: InfoText(text: "Packed for delivery ")),
        Step(
            title: InfoText(text: "Dispatched"),
            content: InfoText(text: "on the way")),
        Step(
            title: InfoText(text: "Ready for pick up"),
            content: InfoText(text: "You can pick your product"))
      ],
    );
  }
}
