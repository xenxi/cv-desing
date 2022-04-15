import 'package:cv_desing_website_flutter/application/desing_details/desing_details_bloc.dart';
import 'package:cv_desing_website_flutter/application/navigation/navigation_bloc.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/core/dependency_injections/ioc.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/adaptative_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/widgets/close_button.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_details/widgets/details_mockup.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_details/widgets/request_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesingDetailsView extends StatelessWidget {
  const DesingDetailsView({
    Key? key,
    required this.reference,
  }) : super(key: key);
  final String reference;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            getIt<DesingDetailsBloc>()..add(DesingOpened(reference: reference)),
        child: BlocConsumer<DesingDetailsBloc, DesingDetailsState>(
          listener: (context, state) {
            if (state is LoadFailure) {
              BlocProvider.of<NavigationBloc>(context)
                  .add(const DesingsOpened());
            }
          },
          builder: (context, state) {
            if (state is LoadSuccess) {
              return SizedBox(
                height: heightOfScreen(context),
                child: Stack(
                  children: [
                    DetailMockUp(child: _buildImage(state.desing)),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(CustomTheme.defaultPadding),
                        child: RoundedCloseButton(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: CustomTheme.defaultPadding,
                        ),
                        child: RequestButton(
                          reference: state.desing.reference,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }

            return const Center(
              child: Text('Loading...'),
            );
          },
        ),
      );

  Widget _buildImage(Desing desing) => Hero(
        tag: desing.reference,
        child: Image(
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
          image: AssetImage(
            desing.image(),
          ),
        ),
      );
}
