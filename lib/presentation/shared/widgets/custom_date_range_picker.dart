import 'package:flutter/material.dart';

import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';

class CustomDateRangePicker extends StatelessWidget {
  final DateRange dateRange;
  const CustomDateRangePicker({
    Key? key,
    required this.dateRange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _datePicker(context, text: 'Desde'),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: _datePicker(context, text: 'Hasta'),
        ),
      ],
    );
  }

  Widget _datePicker(BuildContext context, {required String text}) =>
      TextFormField(
        autocorrect: false,
        enableInteractiveSelection: false,
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.date_range_rounded),
          labelText: text,
        ),
        onTap: () => _selectDate(context),
      );

  Future<DateTime?> _selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      // locale: const Locale('es', 'ES'),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1850),
      lastDate: DateTime.now(),
    );
  }
}
