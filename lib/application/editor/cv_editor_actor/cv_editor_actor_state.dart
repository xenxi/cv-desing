part of 'cv_editor_actor_bloc.dart';

class CvEditorActorState extends Equatable {
  factory CvEditorActorState.initial() =>
      CvEditorActorState(resume: Resume.empty());
  const CvEditorActorState({required this.resume});
  final Resume resume;
  @override
  List<Object> get props => [resume];

  CvEditorActorState copyWith({
    CvTemplates? template,
    Resume? resume,
  }) {
    return CvEditorActorState(
      resume: resume ?? this.resume,
    );
  }
}
