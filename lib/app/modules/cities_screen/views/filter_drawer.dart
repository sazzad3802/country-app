import 'package:country_app/app/extensions/space_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/base/base_view.dart';
import '../controllers/cities_controller.dart';

class FilterDrawer extends BaseView<CityController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.height,
            TextField(
              decoration: InputDecoration(labelText: "Keyword"),
              onChanged: (value) {
                // Store value in controller if needed
              },
            ),
            20.height,
            DropdownButton<String>(
              value: "Ascending",
              onChanged: (value) {
                // Update sorting direction
              },
              items: [
                DropdownMenuItem(value: "Ascending", child: Text("Ascending")),
                DropdownMenuItem(
                    value: "Descending", child: Text("Descending")),
              ],
            ),
            20.height,
            ElevatedButton(
              onPressed: () {
                controller.applyFilters();
                Navigator.pop(context); // Close the drawer
              },
              child: Text("Apply"),
            ),
          ],
        ),
      ),
    );
  }
}
