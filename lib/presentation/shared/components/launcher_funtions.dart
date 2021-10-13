import 'package:url_launcher/url_launcher.dart';

Future<void> openUrlLink(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> openMail(String email, {String subject = ''}) async {
  final url = 'mailto:$email?subject=$subject';
  return openUrlLink(url);
}
