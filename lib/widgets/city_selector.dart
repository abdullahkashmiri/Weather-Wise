import 'package:flutter/material.dart';

class CitySelector extends StatefulWidget {
  final List<String> dropDownItems;
  final String initialSelectedValue;
  final Function(String) onCitySelected;

  const CitySelector({
    Key? key,
    required this.dropDownItems,
    required this.initialSelectedValue,
    required this.onCitySelected,
  }): super(key: key);

  @override
  State<CitySelector> createState() => _CitySelectorState();
}

class _CitySelectorState extends State<CitySelector> {
  late String selectedValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue = widget.initialSelectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            const Icon(
              Icons.location_pin,
              color: Colors.white,
            ),
            const SizedBox(width: 5.0,),
            Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.blue,
              ),
              child: DropdownButton(
                dropdownColor: Colors.blue.shade900.withOpacity(0.5),
                value: selectedValue,
                underline: Container(),
                style: const TextStyle(
                    color: Colors.white
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
                items: widget.dropDownItems.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(color: Colors.white),
                    ),);
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    selectedValue = val as String;
                    widget.onCitySelected(val);
                  });
                },
              ),
            )
          ],
        )
    );
  }
}
