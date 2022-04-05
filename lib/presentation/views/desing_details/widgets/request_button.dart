import 'package:cv_desing_website_flutter/presentation/shared/components/launcher_funtions.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/email_address.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/material.dart';

class RequestButton extends StatelessWidget {
  const RequestButton({Key? key, required this.reference}) : super(key: key);

  final String reference;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => requestDesing(context, reference: reference),
      icon: const Icon(
        Icons.shopping_cart_outlined,
        color: Colors.black,
      ),
      label: const Text(
        Location.requestDesing,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Future<void> requestDesing(
    BuildContext context, {
    required String reference,
  }) async {
    Navigator.of(context).pop();

    await openMail(EmailAddress.defaultAccount, subject: reference);
  }
}
