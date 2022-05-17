part of 'work_experience_form_bloc.dart';

class WorkExperienceFormState extends Equatable {
  factory WorkExperienceFormState.initial() => WorkExperienceFormState(
        showErrorMessages: false,
        isLoaded: false,
        saveFailureOrSuccessOption: none(),
        workExperience: WorkExperience.empty(),
      );
  const WorkExperienceFormState({
    required this.showErrorMessages,
    required this.isLoaded,
    required this.saveFailureOrSuccessOption,
    required this.workExperience,
  });
  final bool showErrorMessages;
  final bool isLoaded;
  final Option saveFailureOrSuccessOption;
  final WorkExperience workExperience;
  @override
  List<Object> get props => [
        showErrorMessages,
        isLoaded,
        saveFailureOrSuccessOption,
        workExperience,
      ];

  WorkExperienceFormState copyWith({
    bool? showErrorMessages,
    bool? isLoaded,
    Option? saveFailureOrSuccessOption,
    WorkExperience? workExperience,
  }) {
    return WorkExperienceFormState(
      showErrorMessages: showErrorMessages ?? this.showErrorMessages,
      isLoaded: isLoaded ?? this.isLoaded,
      saveFailureOrSuccessOption:
          saveFailureOrSuccessOption ?? this.saveFailureOrSuccessOption,
      workExperience: workExperience ?? this.workExperience,
    );
  }
}
