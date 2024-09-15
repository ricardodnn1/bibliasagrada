import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdownButtonWidget<T> extends StatelessWidget {
  CustomDropdownButtonWidget({
    super.key,
    required this.listItems,
    required this.onChanged,
    this.item,
  }) : assert(
          listItems == null ||
              listItems.isEmpty ||
              item == null ||
              listItems.where((DropdownMenuItem<T?> menuItem) {
                    return menuItem.value == item;
                  }).length ==
                  1,
        );

  final List<DropdownMenuItem<T>>? listItems;
  final T? item;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width / 2.2,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton<T>(
            value: item,
            items: listItems,
            onChanged: onChanged,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
