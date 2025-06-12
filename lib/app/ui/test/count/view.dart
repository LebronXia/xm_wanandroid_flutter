import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';
import 'event.dart';
import 'state.dart';

class CountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counte')),
      body: BlocProvider(  //提供blc或 Cubit 给组件树
        create: (BuildContext context) => CountBloc(),
        child: Builder(builder: (context) => _buildPage(context)),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    final countBloc = BlocProvider.of<CountBloc>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CountBloc, int>(
            builder: (context, count) {
              return Text('Count: $count', style: TextStyle(fontSize: 24));
            },
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  countBloc.add(CounterIncrementPressed());
                },
                child: Icon(Icons.add),
              ),
              SizedBox(width: 16),
              FloatingActionButton(
                onPressed: () {
                  countBloc.add(CounterDecrementPressed());
                },
                child: Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

