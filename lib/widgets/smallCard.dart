import 'package:flutter/material.dart';

class SmallCustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onBuyTicketsPressed;
  final VoidCallback onListenPressed;

  const SmallCustomCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onBuyTicketsPressed,
    required this.onListenPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.album),
            title: Text(title),
            subtitle: Text(subtitle),
          ),
          ButtonBar(
            children: <Widget>[
              TextButton(
                child: const Text('BUY TICKETS'),
                onPressed: onBuyTicketsPressed,
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('LISTEN'),
                onPressed: onListenPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}