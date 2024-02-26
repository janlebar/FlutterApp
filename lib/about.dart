import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        } else if (!value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a message';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Message',
                      ),
                      maxLines: 5,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          _launchEmail();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Set background color to red
                      ),
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'jst5321@gmail.com',
      queryParameters: {
        'subject': 'Contact Form Submission',
        // You can add more parameters here like body, cc, bcc, etc.
      },
    );

    if (await canLaunchUrl(emailLaunchUri.toString() as Uri)) {
      await launchUrl(emailLaunchUri.toString() as Uri);
    } else {
      throw 'Could not launch ${emailLaunchUri.toString()}';
    }
  }
}


