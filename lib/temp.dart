// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Responsive Home Page',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   HomePage({super.key});

//   final List<Map<String, dynamic>> items = [
//     {
//       'icon': Icons.school_outlined,
//       'text': 'Canvas',
//       'subtext': 'Canvas LMS for Students and Faculty'
//     },
//     {
//       'icon': Icons.assignment_ind_outlined,
//       'text': 'Examination',
//       'subtext': 'Access all your evaluation needs and queries'
//     },
//     {
//       'icon': Icons.policy_outlined,
//       'text': 'University Policies',
//       'subtext': 'Access the university\'s official policies'
//     },
//     {
//       'icon': Icons.library_books_outlined,
//       'text': 'KREA E-Library',
//       'subtext': 'Read from over 5,00,000 eResources'
//     },
//     {
//       'icon': Icons.currency_rupee_outlined,
//       'text': 'Expense Management',
//       'subtext': 'All your expenses and reimbursements needs'
//     },
//     {
//       'icon': Icons.work_outlined,
//       'text': 'Employee Management',
//       'subtext': 'Canvas LMS for Students and Faculty'
//     },
//     {
//       'icon': Icons.help_outline,
//       'text': 'Helpdesk',
//       'subtext': 'Access all your evaluation needs and queries'
//     },
//     {
//       'icon': Icons.add,
//       'text': 'Additional Widget 1',
//       'subtext': 'Additional Limited Information related to the widget'
//     },
//     {
//       'icon': Icons.add,
//       'text': 'Additional Widget 2',
//       'subtext': 'Additional Limited Information related to the widget'
//     },
//     {
//       'icon': Icons.add,
//       'text': 'Additional Widget 3',
//       'subtext': 'Additional Limited Information related to the widget'
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Responsive Home Page'),
//       ),
//       // body: HomePage(),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           if (constraints.maxWidth < 600) {
//             // Single column
//             return SingleChildScrollView(
//               child: Column(
//                 children: items.map((item) => customCard(item)).toList(),
//               ),
//             );
//           } else {
//             // Two columns
//             return SingleChildScrollView(
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       children: items
//                           .asMap()
//                           .entries
//                           .where((entry) => entry.key % 2 == 0)
//                           .map((entry) => customCard(entry.value))
//                           .toList(),
//                     ),
//                   ),
//                   Expanded(
//                     child: Column(
//                       children: items
//                           .asMap()
//                           .entries
//                           .where((entry) => entry.key % 2 != 0)
//                           .map((entry) => customCard(entry.value))
//                           .toList(),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }

//   Widget customCard(Map<String, dynamic> item) {
//     return Container(
//       margin: const EdgeInsets.all(8.0),
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Row(
//         children: [
//           Container(
//               constraints: const BoxConstraints(maxHeight: 60, maxWidth: 60),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: const Color(0xff0095ff),
//               ),
//               child: Center(
//                   child: Icon(item['icon'], size: 24.0, color: Colors.white))),
//           const SizedBox(width: 16.0),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   item['text'],
//                   style: const TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 4.0),
//                 Text(item['subtext']),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class UpcomingEventWidget extends StatelessWidget {
//   const UpcomingEventWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final bool isWideScreen = constraints.maxWidth > 600;
//         final double imageWidth =
//             isWideScreen ? constraints.maxWidth * 0.3 : constraints.maxWidth;

//         return Container(
//           margin: const EdgeInsets.all(8.0),
//           padding: const EdgeInsets.all(16.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8.0),
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.black26,
//                 blurRadius: 4.0,
//                 offset: Offset(2, 2),
//               ),
//             ],
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (isWideScreen)
//                 Container(
//                   width: imageWidth,
//                   height: 200,
//                   decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(8.0),
//                       bottomLeft: Radius.circular(8.0),
//                     ),
//                     image: DecorationImage(
//                       image: NetworkImage(
//                           'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/graduation-poster-template-3-design-fcff1ac8a6ddd785ff08c3d4bae11ea9_screen.jpg?ts=1637036712'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               const Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Upcoming Events',
//                         style: TextStyle(
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 8.0),
//                       Divider(),
//                       SizedBox(height: 8.0),
//                       Text(
//                         'Start Date',
//                         style: TextStyle(
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       SizedBox(height: 4.0),
//                       Text(
//                         '16th July 2024, 03:30 PM,\nKothari Hall (SH2)',
//                         style: TextStyle(
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 8.0),
//                       Text(
//                         'Student Orientation Inauguration - Batch of 2028',
//                         style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 8.0),
//                       Text(
//                         'Please welcome us with the orientation programme of the upcoming cohort of 2028. The event is packed with fun stuff and cool games. See you all at the OAT.',
//                         style: TextStyle(
//                           fontSize: 16.0,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }



// import 'package:flutter/material.dart';

// /// Flutter code sample for [Card].

// void main() => runApp(const CardExampleApp());

// class CardExampleApp extends StatelessWidget {
//   const CardExampleApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Card Sample')),
//         body: const CardExample(),
//       ),
//     );
//   }
// }

// class CardExample extends StatelessWidget {
//   const CardExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Card(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             const ListTile(
//               leading: Icon(Icons.album),
//               title: Text('The Enchanted Nightingale'),
//               subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 TextButton(
//                   child: const Text('BUY TICKETS'),
//                   onPressed: () {/* ... */},
//                 ),
//                 const SizedBox(width: 8),
//                 TextButton(
//                   child: const Text('LISTEN'),
//                   onPressed: () {/* ... */},
//                 ),
//                 const SizedBox(width: 8),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
