part of 'cv_editor_actor_bloc.dart';

class CvEditorActorState extends Equatable {
  factory CvEditorActorState.initial() =>
      CvEditorActorState(template: CvTemplates.green, resume: Resume.empty());
  const CvEditorActorState({required this.resume, required this.template});
  final CvTemplates template;
  final Resume resume;
  @override
  List<Object> get props => [template, resume];

  CvEditorActorState copyWith({
    CvTemplates? template,
    Resume? resume,
  }) {
    return CvEditorActorState(
      template: template ?? this.template,
      resume: resume ?? this.resume,
    );
  }
}
