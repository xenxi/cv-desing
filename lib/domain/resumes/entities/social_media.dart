import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/url.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SocialMedias extends Equatable {
  factory SocialMedias.empty() => SocialMedias(
        facebookOption: none(),
        linkedinOption: none(),
        twitterOption: none(),
        githubOption: none(),
        instagramOption: none(),
        youtubeOption: none(),
        twitchOption: none(),
        personalOption: none(),
      );
  const SocialMedias({
    required this.facebookOption,
    required this.linkedinOption,
    required this.twitterOption,
    required this.githubOption,
    required this.instagramOption,
    required this.youtubeOption,
    required this.twitchOption,
    required this.personalOption,
  });

  final Option<Url> facebookOption;
  final Option<Url> linkedinOption;
  final Option<Url> twitterOption;
  final Option<Url> githubOption;
  final Option<Url> instagramOption;
  final Option<Url> youtubeOption;
  final Option<Url> twitchOption;
  final Option<Url> personalOption;
  @override
  List<Object?> get props => [
        facebookOption,
        linkedinOption,
        twitterOption,
        githubOption,
        instagramOption,
        youtubeOption,
        twitchOption,
        personalOption,
      ];

  SocialMedias copyWith({
    Option<Url>? facebookOption,
    Option<Url>? linkedinOption,
    Option<Url>? twitterOption,
    Option<Url>? githubOption,
    Option<Url>? instagramOption,
    Option<Url>? youtubeOption,
    Option<Url>? twitchOption,
    Option<Url>? personalOption,
  }) {
    return SocialMedias(
      facebookOption: facebookOption ?? this.facebookOption,
      linkedinOption: linkedinOption ?? this.linkedinOption,
      twitterOption: twitterOption ?? this.twitterOption,
      githubOption: githubOption ?? this.githubOption,
      instagramOption: instagramOption ?? this.instagramOption,
      youtubeOption: youtubeOption ?? this.youtubeOption,
      twitchOption: twitchOption ?? this.twitchOption,
      personalOption: personalOption ?? this.personalOption,
    );
  }

  Either<Failure, Unit> get failureOrUnit {
    return facebookOption
        .map((a) => a.failureOrUnit)
        .getOrElse(() => right(unit))
        .andThen(
          linkedinOption
              .map((a) => a.failureOrUnit)
              .getOrElse(() => right(unit)),
        )
        .andThen(
          twitterOption
              .map((a) => a.failureOrUnit)
              .getOrElse(() => right(unit)),
        )
        .andThen(
          githubOption.map((a) => a.failureOrUnit).getOrElse(() => right(unit)),
        )
        .andThen(
          instagramOption
              .map((a) => a.failureOrUnit)
              .getOrElse(() => right(unit)),
        )
        .andThen(
          youtubeOption
              .map((a) => a.failureOrUnit)
              .getOrElse(() => right(unit)),
        )
        .andThen(
          twitchOption.map((a) => a.failureOrUnit).getOrElse(() => right(unit)),
        )
        .andThen(
          personalOption
              .map((a) => a.failureOrUnit)
              .getOrElse(() => right(unit)),
        );
  }
}
