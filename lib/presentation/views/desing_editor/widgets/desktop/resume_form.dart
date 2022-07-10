import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/desktop/form_builder.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_editor/widgets/desktop/step_list.dart';
import 'package:flutter/material.dart';

class ResumeForm extends StatelessWidget {
  const ResumeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        StepList(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: FormBuilder(),
          ),
        )
      ],
    );
  }
}
