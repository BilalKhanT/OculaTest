import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  final List<String> snellenLines = [
    'E',
    'FP',
    'TOZ',
    'LPED',
    'PECFD',
    'EDFCZP',
    'FELPZD',
    'DEFPOTEC',
    'LEFOCPDT',
    'FDPLTCEO',
    'FEOZLGTVD'
  ];

  final List<String> snellenScores = [
    '20/200',
    '20/100',
    '20/70',
    '20/50',
    '20/40',
    '20/30',
    '20/25',
    '20/20',
    '20/15',
    '20/10',
    '20/5'
  ];

  TestView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Snellen Chart Test'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: snellenLines.asMap().entries.map((entry) {
            int idx = entry.key;
            String line = entry.value;
            return Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    line,
                    style: TextStyle(
                      fontSize: screenHeight *
                          (0.05 - (idx * 0.003)), // Adjust font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    snellenScores[idx],
                    style: TextStyle(
                      fontSize: screenHeight *
                          (0.025 - (idx * 0.0015)), // Adjust font size
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
