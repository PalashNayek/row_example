import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../di/service_locator.dart';
import '../view_models/row_viewmodel.dart';

class RowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<RowViewModel>(),  // Provide RowViewModel to the widget tree
      child: Scaffold(
        appBar: AppBar(
          title: Text('Row with MVVM and DI'),
        ),
        body: Center(
          child: Consumer<RowViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Row to display the icons or widgets
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: viewModel.items,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.addItem(Icon(Icons.add));  // Add new item to the Row
                    },
                    child: Text("Add Item"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (viewModel.items.isNotEmpty) {
                        viewModel.removeItem(viewModel.items.first);  // Remove first item
                      }
                    },
                    child: Text("Remove First Item"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
