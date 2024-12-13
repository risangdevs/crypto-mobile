import 'package:crypto_mobile/components/buttons/flat_button.dart';
import 'package:crypto_mobile/components/buttons/raised_button.dart';
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
            FlatButton(label: 'Flat Button', onPressed: ()=>{print('flat button pressed')}),
            RaisedButton(label: 'Raised Button', onPressed: ()=>{print('raised button pressed')}),
            OutlinedButton(child: Text('Outlined Button'), onPressed: ()=>{print('outlined button pressed')}),
            
          ],
        ),
      ),
    );
  }
}
