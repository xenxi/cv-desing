import 'package:cv_desing_website_flutter/application/editor/cv_editor_actor/cv_editor_actor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_actor/cv_templates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CvTemplateButton extends StatelessWidget {
  const CvTemplateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CvEditorActorBloc, CvEditorActorState>(
      buildWhen: (previous, current) => previous.template != current.template,
      builder: (context, state) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...CvTemplates.values.map(
                  (e) => Row(
                    children: [
                      Row(
                        children: [
                          Radio<CvTemplates>(
                            value: e,
                            groupValue: state.template,
                            onChanged: (_) =>
                                BlocProvider.of<CvEditorActorBloc>(context)
                                    .add(TemplateChanged(e)),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
