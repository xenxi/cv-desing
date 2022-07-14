import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/editor/contact_information_form/contact_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/personal_information_form/personal_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/email_address.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/academy_training.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/complementary_training.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/contact_information.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/personal_information.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/social_media.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/work_experience.dart';
import 'package:cv_desing_website_flutter/domain/resumes/resume.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/course_hours.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/description.dart'
    as domain;
import 'package:cv_desing_website_flutter/domain/value_objects/employer.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/languages.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/locality.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/name.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/percentage.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/phone_number.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/schoold.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/skills.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/software_skill.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/title.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/unique_id.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/url.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockContactInformationFormBloc extends Mock
    implements ContactInformationFormBloc {}

class MockPersonalInformationFormBloc extends Mock
    implements PersonalInformationFormBloc {}

void main() {
  late CvEditorBloc bloc;
  late MockContactInformationFormBloc contactInformationFormBloc;
  late MockPersonalInformationFormBloc personalInformationFormBloc;
  setUp(() {
    contactInformationFormBloc = MockContactInformationFormBloc();
    personalInformationFormBloc = MockPersonalInformationFormBloc();
    bloc = CvEditorBloc(
      contactInformationFormBloc,
      personalInformationFormBloc,
    );
  });
  final initialState = CvEditorState(
    section: Section.personalInformation,
    resume: Resume(
      academyTrainings: const AcademyTrainings([]),
      complementaryTrainings: const ComplementaryTrainings([]),
      contactInformation: ContactInformation(
        emailAddress: EmailAddress(''),
        phoneNumber: PhoneNumber(''),
        socialMedias: SocialMedias(
          facebookOption: none(),
          linkedinOption: none(),
          twitterOption: none(),
          githubOption: none(),
          instagramOption: none(),
          youtubeOption: none(),
          twitchOption: none(),
          personalOption: none(),
        ),
      ),
      languages: const Languages([]),
      skills: const Skills([]),
      softwareSkills: const SoftwareSkills([]),
      workExperiences: const WorkExperiences([]),
      personalInformation: PersonalInformation(
        description: domain.Description(''),
        job: Job(''),
        locality: Locality(''),
        name: Name(''),
        avatarOption: none(),
      ),
    ),
  );
  final otherAcademyTraining = AcademyTraining(
    schoold: Schoold('otherSchoold'),
    title: Title('otherTitle'),
    dateRange: DateRange(
      since: DateTime.now().subtract(const Duration(days: 20)),
      until: DateTime.now(),
    ),
    uniqueId: UniqueId.fromString('otherId'),
  );
  final anyAcademyTraining = AcademyTraining(
    schoold: Schoold('otherSchoold'),
    title: Title('otherTitle'),
    dateRange: DateRange(
      since: DateTime.now().subtract(const Duration(days: 60)),
      until: null,
    ),
    uniqueId: UniqueId.fromString('anyId'),
  );

  final anyComplementaryTraining = ComplementaryTraining(
    schoold: Schoold('anySchoold'),
    title: Title('anyTitle'),
    dateRange: DateRange(
      since: DateTime.now().subtract(const Duration(days: 10)),
      until: DateTime.now(),
    ),
    uniqueId: UniqueId.fromString('anyId'),
    courseHoursOption: some(CourseHours(2)),
  );
  final otherComplementaryTraining = ComplementaryTraining(
    schoold: Schoold('otherSchoold'),
    title: Title('otherTitle'),
    dateRange: DateRange(
      since: DateTime.now().subtract(const Duration(days: 20)),
      until: DateTime.now(),
    ),
    uniqueId: UniqueId.fromString('otherId'),
    courseHoursOption: none(),
  );

  group('CvEditorBloc should', () {
    test('has empty as initial state', () {
      expect(
        bloc.state,
        equals(
          initialState,
        ),
      );
    });

    blocTest<CvEditorBloc, CvEditorState>(
      'change to contact info section',
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.contactInformation)),
      expect: () => <CvEditorState>[
        initialState.copyWith(section: Section.contactInformation)
      ],
    );

    blocTest<CvEditorBloc, CvEditorState>(
      'change to academic training section',
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.academicTraining)),
      expect: () => <CvEditorState>[
        initialState.copyWith(section: Section.academicTraining)
      ],
    );

    blocTest<CvEditorBloc, CvEditorState>(
      'change to complementary formations section',
      build: () => bloc,
      act: (bloc) => bloc
          .add(const SectionChanged(section: Section.complementaryFormations)),
      expect: () => <CvEditorState>[
        initialState.copyWith(section: Section.complementaryFormations)
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'change to work experience section',
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.workExperience)),
      expect: () => <CvEditorState>[
        initialState.copyWith(section: Section.workExperience)
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'change to languages section',
      build: () => bloc,
      act: (bloc) => bloc.add(const SectionChanged(section: Section.languages)),
      expect: () =>
          <CvEditorState>[initialState.copyWith(section: Section.languages)],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'change to software skills section',
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.softwareSkills)),
      expect: () => <CvEditorState>[
        initialState.copyWith(section: Section.softwareSkills)
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'change to skills and aptitudes section',
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.skillsandAptitudes)),
      expect: () => <CvEditorState>[
        initialState.copyWith(section: Section.skillsandAptitudes)
      ],
    );

    blocTest<CvEditorBloc, CvEditorState>(
      'update languages',
      build: () => bloc,
      act: (bloc) => bloc
        ..add(const LanguageAdded('anyLanguage', level: LanguageLevel.native))
        ..add(
          const LanguageAdded(
            'otherLanguage',
            level: LanguageLevel.intermediate,
          ),
        )
        ..add(const LanguageDeleted('otherLanguage')),
      expect: () => <CvEditorState>[
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            languages: Languages(
              [Language('anyLanguage', level: LanguageLevel.native)],
            ),
          ),
        ),
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            languages: Languages([
              Language('anyLanguage', level: LanguageLevel.native),
              Language('otherLanguage', level: LanguageLevel.intermediate)
            ]),
          ),
        ),
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            languages: Languages(
              [Language('anyLanguage', level: LanguageLevel.native)],
            ),
          ),
        ),
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'update skills',
      build: () => bloc,
      act: (bloc) => bloc
        ..add(const SkillAdded(skill: 'anySkill'))
        ..add(const SkillAdded(skill: 'otherSkill'))
        ..add(const SkillDeleted(skill: 'anySkill')),
      expect: () => <CvEditorState>[
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            skills: const Skills(
              ['anySkill'],
            ),
          ),
        ),
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            skills: const Skills(
              ['anySkill', 'otherSkill'],
            ),
          ),
        ),
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            skills: const Skills(
              ['otherSkill'],
            ),
          ),
        ),
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'update personal information',
      build: () => bloc,
      act: (bloc) => bloc
        ..add(
          PersonalInformationUpdated(
            personalInformation: PersonalInformation(
              name: Name('anyName'),
              locality: Locality('anyLocality'),
              job: Job('anyProfession'),
              description: domain.Description('anyPersonalDescription'),
              avatarOption: none(),
            ),
          ),
        ),
      expect: () => <CvEditorState>[
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            personalInformation: PersonalInformation(
              name: Name('anyName'),
              locality: Locality('anyLocality'),
              job: Job('anyProfession'),
              description: domain.Description('anyPersonalDescription'),
              avatarOption: none(),
            ),
          ),
        ),
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'update contact information',
      build: () => bloc,
      act: (bloc) => bloc
        ..add(
          ContactInformationUpdated(
            contactInformation: ContactInformation(
              emailAddress: EmailAddress('anyEmail'),
              phoneNumber: PhoneNumber('anyPhoneNumber'),
              socialMedias: SocialMedias.empty().copyWith(
                twitterOption: some(Url('https://twitter.com/anyTwitter')),
              ),
            ),
          ),
        ),
      expect: () => <CvEditorState>[
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            contactInformation: ContactInformation(
              emailAddress: EmailAddress('anyEmail'),
              phoneNumber: PhoneNumber('anyPhoneNumber'),
              socialMedias: SocialMedias.empty().copyWith(
                twitterOption: some(Url('https://twitter.com/anyTwitter')),
              ),
            ),
          ),
        ),
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'update academy training',
      build: () => bloc,
      act: (bloc) => bloc
        ..add(
          AcademyTrainingAdded(anyAcademyTraining),
        )
        ..add(
          AcademyTrainingAdded(
            otherAcademyTraining,
          ),
        )
        ..add(
          AcademyTrainingDeleted(
            otherAcademyTraining,
          ),
        ),
      expect: () => <CvEditorState>[
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            academyTrainings: AcademyTrainings(
              [
                anyAcademyTraining,
              ],
            ),
          ),
        ),
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            academyTrainings: AcademyTrainings(
              [
                anyAcademyTraining,
                otherAcademyTraining,
              ],
            ),
          ),
        ),
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            academyTrainings: AcademyTrainings(
              [
                anyAcademyTraining,
              ],
            ),
          ),
        ),
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'update complementary training',
      build: () => bloc,
      act: (bloc) => bloc
        ..add(
          ComplementaryTrainingAdded(anyComplementaryTraining),
        )
        ..add(
          ComplementaryTrainingAdded(
            otherComplementaryTraining,
          ),
        )
        ..add(
          ComplementaryTrainingDeleted(
            otherComplementaryTraining,
          ),
        ),
      expect: () => <CvEditorState>[
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            complementaryTrainings: ComplementaryTrainings(
              [
                anyComplementaryTraining,
              ],
            ),
          ),
        ),
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            complementaryTrainings: ComplementaryTrainings(
              [
                anyComplementaryTraining,
                otherComplementaryTraining,
              ],
            ),
          ),
        ),
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            complementaryTrainings: ComplementaryTrainings(
              [
                anyComplementaryTraining,
              ],
            ),
          ),
        ),
      ],
    );

    blocTest<CvEditorBloc, CvEditorState>(
      'update software skills',
      build: () => bloc,
      act: (bloc) => bloc
        ..add(
          const SoftwareSkillAdded(name: 'anySoftwareSkillA', percentage: 50),
        )
        ..add(
          const SoftwareSkillAdded(name: 'otherSoftwareSkillA', percentage: 10),
        )
        ..add(
          const SoftwareSkillDeleted(name: 'otherSoftwareSkillA'),
        ),
      expect: () => <CvEditorState>[
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            softwareSkills: SoftwareSkills(
              [
                SoftwareSkill(
                  'anySoftwareSkillA',
                  percentage: Percentage(50),
                ),
              ],
            ),
          ),
        ),
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            softwareSkills: SoftwareSkills(
              [
                SoftwareSkill(
                  'anySoftwareSkillA',
                  percentage: Percentage(50),
                ),
                SoftwareSkill(
                  'otherSoftwareSkillA',
                  percentage: Percentage(10),
                ),
              ],
            ),
          ),
        ),
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            softwareSkills: SoftwareSkills(
              [
                SoftwareSkill(
                  'anySoftwareSkillA',
                  percentage: Percentage(50),
                ),
              ],
            ),
          ),
        ),
      ],
    );
    final anyWorkExperience = WorkExperience(
      dateRange: DateRange(
        since: DateTime.now().subtract(const Duration(days: 10)),
        until: DateTime.now(),
      ),
      description: domain.Description('anyDescription'),
      employer: Employer('anyEmployer'),
      job: Job('anyJob'),
      uniqueId: UniqueId.fromString('anyUniqueId'),
    );
    final otherWorkExperience = WorkExperience(
      dateRange: DateRange(
        since: DateTime.now().subtract(const Duration(days: 1)),
        until: null,
      ),
      description: domain.Description('otherDescription'),
      employer: Employer('otherEmployer'),
      job: Job('otherJob'),
      uniqueId: UniqueId.fromString('otherUniqueId'),
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'update work experience',
      build: () => bloc,
      act: (bloc) => bloc
        ..add(
          WorkExperienceAdded(anyWorkExperience),
        )
        ..add(
          WorkExperienceAdded(
            otherWorkExperience,
          ),
        )
        ..add(
          WorkExperienceDeleted(
            otherWorkExperience,
          ),
        ),
      expect: () => <CvEditorState>[
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            workExperiences: WorkExperiences(
              [
                anyWorkExperience,
              ],
            ),
          ),
        ),
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            workExperiences: WorkExperiences(
              [
                anyWorkExperience,
                otherWorkExperience,
              ],
            ),
          ),
        ),
        initialState.copyWith(
          resume: initialState.resume.copyWith(
            workExperiences: WorkExperiences(
              [
                anyWorkExperience,
              ],
            ),
          ),
        ),
      ],
    );
  });

  final anyContactInformation = ContactInformation.empty()
      .copyWith(emailAddress: EmailAddress('anyEmail'));
  final anyPersonalInformation =
      PersonalInformation.empty().copyWith(name: Name('anyName'));
  blocTest<CvEditorBloc, CvEditorState>(
    'load resume',
    build: () => bloc,
    seed: () => initialState.copyWith(
      resume: initialState.resume.copyWith(skills: const Skills(['anySkill'])),
    ),
    verify: (_) {
      verify(
        () => contactInformationFormBloc
            .add(ContactInformationLoaded(anyContactInformation)),
      ).called(1);
      verify(
        () => personalInformationFormBloc
            .add(PersonalInformationLoaded(anyPersonalInformation)),
      ).called(1);
    },
    act: (bloc) => bloc
      ..add(
        Loaded(
          Resume.empty().copyWith(
            contactInformation: anyContactInformation,
            personalInformation: anyPersonalInformation,
          ),
        ),
      ),
    expect: () => <CvEditorState>[
      initialState.copyWith(
        resume: Resume.empty().copyWith(
          contactInformation: anyContactInformation,
          personalInformation: anyPersonalInformation,
        ),
      ),
    ],
  );

  blocTest<CvEditorBloc, CvEditorState>(
    'clear resume',
    build: () => bloc,
    seed: () => initialState.copyWith(
      resume: initialState.resume.copyWith(
        skills: const Skills(['anySkill']),
        contactInformation: anyContactInformation,
      ),
      section: Section.contactInformation,
    ),
    verify: (_) => verify(
      () => contactInformationFormBloc
          .add(ContactInformationLoaded(ContactInformation.empty())),
    ).called(1),
    act: (bloc) => bloc
      ..add(
        const Cleaned(),
      ),
    expect: () => <CvEditorState>[
      initialState.copyWith(
        resume: Resume.empty(),
        section: Section.contactInformation,
      ),
    ],
  );
}
