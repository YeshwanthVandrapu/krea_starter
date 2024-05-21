import 'package:flutter/material.dart';

class Cardgrid extends StatefulWidget {
  const Cardgrid({super.key});

  @override
  State<Cardgrid> createState() => _CardgridState();
}

class _CardgridState extends State<Cardgrid> {
  final List<Map<String, dynamic>> items = [
    {
      'icon': Icons.school_outlined,
      'text': 'Canvas',
      'subtext': 'Canvas LMS for Students and Faculty'
    },
    {
      'icon': Icons.assignment_ind_outlined,
      'text': 'Examination',
      'subtext': 'Access all your evaluation needs and queries'
    },
    {
      'icon': Icons.policy_outlined,
      'text': 'University Policies',
      'subtext': 'Access the university\'s official policies'
    },
    {
      'icon': Icons.library_books_outlined,
      'text': 'KREA E-Library',
      'subtext': 'Read from over 5,00,000 eResources'
    },
    {
      'icon': Icons.currency_rupee_outlined,
      'text': 'Expense Management',
      'subtext': 'All your expenses and reimbursements needs'
    },
    {
      'icon': Icons.work_outlined,
      'text': 'Employee Management',
      'subtext': 'Canvas LMS for Students and Faculty'
    },
    {
      'icon': Icons.help_outline,
      'text': 'Helpdesk',
      'subtext': 'Access all your evaluation needs and queries'
    },
    {
      'icon': Icons.add,
      'text': 'Additional Widget 1',
      'subtext': 'Additional Limited Information related to the widget'
    },
    {
      'icon': Icons.add,
      'text': 'Additional Widget 2',
      'subtext': 'Additional Limited Information related to the widget'
    },
    {
      'icon': Icons.add,
      'text': 'Additional Widget 3',
      'subtext': 'Additional Limited Information related to the widget'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            constraints: const BoxConstraints(maxHeight: 60),
            // decoration: const BoxDecoration(color: Colors.white),
            child: const Text(
              'Access all your essential apps and resources at one place. ',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 620) {
                return SingleChildScrollView(
                  child: Column(
                    children: items.map((item) => customCard(item)).toList(),
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: items
                              .asMap()
                              .entries
                              .where((entry) => entry.key % 2 == 0)
                              .map((entry) => customCard(entry.value))
                              .toList(),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: items
                              .asMap()
                              .entries
                              .where((entry) => entry.key % 2 != 0)
                              .map((entry) => customCard(entry.value))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

Widget customCard(Map<String, dynamic> item) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Tooltip(
      message: item['subtext'],
      verticalOffset: 40,
      child: Row(
        children: [
          Container(
              constraints: const BoxConstraints(maxHeight: 60, maxWidth: 60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff0095ff),
              ),
              child: Center(
                  child: Icon(item['icon'], size: 24.0, color: Colors.white))),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['text'],
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  item['subtext'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
