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
          child: TextFormField(
            autocorrect: false,
            enableInteractiveSelection: false,
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.date_range_rounded),
              labelText: 'Desde',
            ),
            onTap: () {
              _selectDate(context);
            },
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: TextFormField(
            autocorrect: false,
            enableInteractiveSelection: false,
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.date_range_rounded),
              labelText: 'Hasta',
            ),
            onTap: () => _selectDate(context),
          ),
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

  Future<DateTime?> _selectDate(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1850),
        lastDate: DateTime.now(),
      );
}
