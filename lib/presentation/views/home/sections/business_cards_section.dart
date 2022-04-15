import 'package:cv_desing_website_flutter/application/navigation/navigation_bloc.dart';
import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/shared/section_tittle.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/desing_data.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:cv_desing_website_flutter/presentation/views/home/widgets/featured_desings/featured_desings_list.dart';
import 'package:cv_desing_website_flutter/presentation/views/home/widgets/show_more_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessCardsSection extends StatelessWidget {
  BusinessCardsSection({Key? key}) : super(key: key);
  final desings = DesingData.desings
      .where((e) => e.category == Category.businessCard)
      .take(5)
      .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.none,
          image: AssetImage(ImagePath.bg2),
          repeat: ImageRepeat.repeat,
          opacity: .2,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: CustomTheme.snowGradient,
        ),
      ),
      child: Column(
        children: [
          SectionTitle(
            title: Location.businessCards,
            subTitle: Location.portfolioSectionSubtitle,
            color: CustomTheme.primaryColor,
            trailing: ShowMoreButton(
              onPressed: () => BlocProvider.of<NavigationBloc>(context)
                  .add(const HomeOpened()),
            ),
          ),
          Expanded(
            child: FeaturedDesingsList(desings: desings),
          ),
        ],
      ),
    );
  }
}
