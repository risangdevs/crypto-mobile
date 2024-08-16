import 'package:flutter/material.dart';


class BodySetting extends StatelessWidget {
  const BodySetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).colorScheme.inversePrimary,
      onRefresh: () async {
        
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Setting Page',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '1',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
