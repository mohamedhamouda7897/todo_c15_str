import 'package:flutter/material.dart';

abstract class BaseConnector {
  showLoading({String? message});

  showErrorMessage({String? message});

  showSuccessDialog();
}

class BaseViewModel<T extends BaseConnector> extends ChangeNotifier {
  T? connector;
}

abstract class BaseView<ST extends StatefulWidget, T extends BaseViewModel>
    extends State<ST>
    implements BaseConnector {
  late T viewModel;

  T initViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
  }
  @override
  showErrorMessage({String? message}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(message ?? ""),
        actions: [ElevatedButton(onPressed: () {}, child: Text("Okay"))],
      ),
    );
  }

  @override
  showLoading({String? message}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        title: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  @override
  showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Success"),
        content: Text("Thanks" ?? ""),
        actions: [ElevatedButton(onPressed: () {}, child: Text("Okay"))],
      ),
    );

  }
}
