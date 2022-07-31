import 'package:cv_desing_website_flutter/application/editor/cv_templates.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CvTemplateButton extends StatelessWidget {
  const CvTemplateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CvEditorBloc, CvEditorState>(
      buildWhen: (previous, current) => previous.template != current.template,
      builder: (context, state) {
        return Card(
          color: CustomTheme.primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.design_services_outlined,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                ...CvTemplates.values.map(
                  (e) => Row(
                    children: [
                      Row(
                        children: [
                          Radio<CvTemplates>(
                            fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white,
                            ),
                            splashRadius: 18,
                            value: e,
                            groupValue: state.template,
                            onChanged: (_) =>
                                BlocProvider.of<CvEditorBloc>(context)
                                    .add(TemplateChanged(e)),
                          ),
                          Text(
                            e.name,
                            style: const TextStyle(color: Colors.white),
                          )
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
