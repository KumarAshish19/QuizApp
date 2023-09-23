import 'package:flutter/material.dart';

class Questionssummary extends StatelessWidget {
  const Questionssummary(this.SummaryData, {super.key});

  final List<Map<String, Object>> SummaryData;
  
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: SummaryData.map(
            (data) {
              final isAnswerCorrect = data['useranswer'] == data['correctanswer'];
              return Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0,0,12,50),
                    child: CircleAvatar(
                        backgroundColor: isAnswerCorrect ? Colors.green : Colors.red,
                      child: Text(
                        ((data['question-index'] as int) + 1).toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['questions'].toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            data['useranswer'].toString(),
                            style: const TextStyle(color: Colors.grey),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data['correctanswer'].toString(),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.cyan,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
