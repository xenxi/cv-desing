import 'package:cv_desing_website_flutter/domain/curriculum.dart';
import 'package:cv_desing_website_flutter/presentation/core/adaptative.dart';
import 'package:flutter/material.dart';

final data = [
  Curriculum(1, 'CV12A', 'assets/cvs/CV12A.jpg'),
  Curriculum(2, 'CV12B', 'assets/cvs/CV12B.jpg'),
  Curriculum(3, 'CV12C', 'assets/cvs/CV12C.jpg'),
  Curriculum(4, 'CV12E', 'assets/cvs/CV12E.jpg'),
  Curriculum(5, 'CV12H', 'assets/cvs/CV12H.jpg'),
  Curriculum(6, 'CV12J', 'assets/cvs/CV12J.jpg'),
  Curriculum(7, 'CV12K', 'assets/cvs/CV12K.jpg'),
  Curriculum(8, 'CV12M', 'assets/cvs/CV12M.jpg'),
  Curriculum(9, 'CV12N', 'assets/cvs/CV12N.jpg'),
  Curriculum(10, 'CV12O', 'assets/cvs/CV12O.jpg'),
  Curriculum(11, 'CV12P', 'assets/cvs/CV12P.jpg'),
  Curriculum(12, 'CV12Q', 'assets/cvs/CV12Q.jpg'),
  Curriculum(13, 'CV12R', 'assets/cvs/CV12R.jpg'),
];

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CV"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.red),
        width: widthOfScreen(context),
        height: heightOfScreen(context),
        child: ListView(
          children: [
            Wrap(
              direction: Axis.horizontal,
              spacing: assignWidth(context: context, fraction: 0.0099),
              runSpacing: assignHeight(context: context, fraction: 0.02),
              children: _buildItems(context),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildItems(BuildContext context) {
    return data.map((cv) => _buildItem(context, data: cv)).toList();
  }

  Widget _buildItem(BuildContext context, {required Curriculum data}) =>
      Container(
        height: 400,
        width: 500,
        child: Stack(
          children: [
            Image.asset(
              data.url,
              width: 500,
              height: 400,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            )
          ],
        ),
      );
}
