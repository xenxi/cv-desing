import 'package:cv_desing_website_flutter/domain/value_failures.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateRangePicker extends StatelessWidget {
  const CustomDateRangePicker({
    Key? key,
    required this.dateRange,
    required this.onChanged,
  }) : super(key: key);
  final DateRange dateRange;
  final void Function(DateTime? start, DateTime? end) onChanged;

  @override
  Widget build(BuildContext context) {
    final Option<DateTime> sinceOption = dateRange.fold(
      (f) => f is InvalidEndDate ? optionOf(f.failedValue?.since) : none(),
      (r) => some(r.since),
    );

    final startController = TextEditingController(
      text: _formatDate(
        dateRange.fold(
          (l) => optionOf(l.failedValue?.since),
          (r) => some(r.since),
        ),
      ),
    );
    final endController = TextEditingController(
        text: _formatDate(
      dateRange.fold(
        (l) => optionOf(l.failedValue?.until.fold(() => null, (a) => a)),
        (r) => r.until,
      ),
    ));
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: startController,
            autocorrect: false,
            readOnly: true,
            enableInteractiveSelection: false,
            keyboardType: TextInputType.datetime,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.date_range_rounded),
              labelText: 'Desde',
            ),
            validator: (_) => dateRange.fold(
              (l) => l is! InvalidEndDate ? '$l' : null,
              (r) => null,
            ),
            onTap: () async {
              final selectedStartDate = await _selectDate(context);
              onChanged(selectedStartDate, null);
            },
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: TextFormField(
            controller: endController,
            readOnly: true,
            autocorrect: false,
            enabled: sinceOption.isSome(),
            enableInteractiveSelection: false,
            keyboardType: TextInputType.datetime,
            validator: (_) => dateRange.fold(
              (l) => l is InvalidEndDate ? '$l' : null,
              (r) => null,
            ),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.date_range_rounded),
              labelText: 'Hasta',
            ),
            onTap: sinceOption.fold(
              () => null,
              (since) => () async {
                final selectedStartDate = await _selectDate(context);
                onChanged(since, selectedStartDate);
              },
            ),
          ),
        ),
      ],
    );
  }

  String _formatDate(Option<DateTime> dateOption) => dateOption.fold(
        () => '',
        (date) => DateFormat('dd/MM/yyyy').format(date),
      );
  Future<DateTime?> _selectDate(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1850),
        lastDate: DateTime.now().add(const Duration(days: 365)),
      );
}
