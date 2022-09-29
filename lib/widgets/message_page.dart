import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({
    required this.title,
    required this.message,
    this.profile = false,
    super.key,
  });

  final String title;
  final String message;
  final bool profile;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
            Visibility(
              visible: profile,
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: OutlinedButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse('https://www.linkedin.com/in/chaitanya-jadhav-b59b89251'));
                    }, child: const Text('Contact Developer')),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
