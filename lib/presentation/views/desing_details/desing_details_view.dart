import 'package:cv_desing_website_flutter/application/desing_details/desing_details_bloc.dart';
import 'package:cv_desing_website_flutter/application/navigation/navigation_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/dependency_injections/ioc.dart';
import 'package:cv_desing_website_flutter/presentation/views/desing_details/widgets/details_body.dart';
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
              return DetailsBody(
                desing: state.desing,
              );
            }

            return const Center(
              child: Text('Loading...'),
            );
          },
        ),
      );
}
