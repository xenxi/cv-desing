import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/presentation/core/routes/app_router.dart';
import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem(this.desing, {Key? key}) : super(key: key);
  final Desing desing;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: desing.id,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0, .5), //(x,y)
              blurRadius: 2.0,
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.all(20),
        child: InkWell(
          onTap: () => openDetailView(context, desing: desing),
          child: Image(
            image: AssetImage(
              desing.thumbnail(),
            ),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  void openDetailView(BuildContext context, {required Desing desing}) {
    Navigator.pushNamed(context, AppRouter.details, arguments: desing);
  }
}
