import 'package:flutter/material.dart';
import 'package:poor_text/poor_text.dart';

void main() {
  runApp(const PoorTextDemoApp());
}

class PoorTextDemoApp extends StatelessWidget {
  const PoorTextDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PoorText Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.grey,
      ),
      home: const PoorTextExampleHomePage(),
    );
  }
}

class PoorTextExampleHomePage extends StatelessWidget {
  const PoorTextExampleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('💸 PoorText Examples'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SectionHeader('🪙 Basic PoorText'),
          const PoorText('I am affordable.'),

          const SectionHeader('🐢 Laggy Mode'),
          const PoorText(
            'Slow and steady...',
            laggy: true,
          ),

          const SectionHeader('📉 Auto Shrink Text'),
          const PoorText(
            'This is a very very very long string that must be shrunk to survive.',
            autoShrink: true,
          ),

          const SectionHeader('🎭 Pretend RichText'),
          const PoorText(
            '<b>Bold?</b> <i>Italic?</i> <u>Nope.</u>',
            pretendRich: true,
          ),

          const SectionHeader('🧩 PoorTextRich'),
          PoorTextRich([
            PoorTextSpan(text: 'Styled? '),
             PoorTextSpan(text: 'Nope. '),
             PoorTextSpan(text: 'Still broke.'),
          ]),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
