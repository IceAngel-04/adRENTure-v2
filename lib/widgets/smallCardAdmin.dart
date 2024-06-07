// ignore_for_file: file_names
import 'package:flutter/material.dart';

class SmallCustomCardAdmin extends StatelessWidget {
  final String title;
  final String subtitle;
  final Image image; 
  final Icon icon;
  final Icon icon2;

  const SmallCustomCardAdmin({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.icon,
    required this.icon2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: image, // Using the provided car image
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      icon,
                    ],
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      icon2,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
