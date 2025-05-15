// import 'package:flutter/material.dart';
// import '../widgets/background.dart';

// class HomeScreen extends StatefulWidget {
//   // pass this flag based on whether the user completed the questionnaire
//   final bool hasCompletedQuestionnaire;
//   const HomeScreen({Key? key, this.hasCompletedQuestionnaire = false})
//     : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final PageController _quoteController = PageController();
//   int _currentQuote = 0;
//   int _selectedIndex = 0;

//   final List<String> quotes = [
//     'When you realize nothing is lacking, the whole world belongs to you.\n–Lao Tzu',
//     'The greatest wealth is health.\n–Virgil',
//     'Peace comes from within. Do not seek it without.\n–Buddha',
//   ];

//   final List<Map<String, String>> recommended = [
//     {
//       'title': 'Focus',
//       'subtitle': 'Meditation • 3-10 min',
//       'image': 'assets/images/reduce_stress.png',
//     },
//     {
//       'title': 'Happiness',
//       'subtitle': 'Meditation • 3-10 min',
//       'image': 'assets/images/manage_anxiety.png',
//     },
//     {
//       'title': 'Reduce Stress',
//       'subtitle': 'Meditation • 3-10 min',
//       'image': 'assets/images/reduce_stress.png',
//     },
//     {
//       'title': 'Manage Anxiety',
//       'subtitle': 'Meditation • 3-10 min',
//       'image': 'assets/images/manage_anxiety.png',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GradientBackground(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 16),
//                 // Top bar
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Profile icon
//                     InkWell(
//                       onTap: () {},
//                       borderRadius: BorderRadius.circular(24),
//                       child: const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Icon(Icons.person_outline, color: Colors.white),
//                       ),
//                     ),
//                     // Logo
//                     Image.asset('assets/images/logo.png', width: 100),
//                     // SOS button
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white.withOpacity(0.8),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                       ),
//                       child: const Text(
//                         'SOS',
//                         style: TextStyle(color: Colors.red),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 24),
//                 // Greeting
//                 Text(
//                   'Good Morning, Hamza!',
//                   style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   'How would you like to start your day?',
//                   style: Theme.of(
//                     context,
//                   ).textTheme.titleMedium?.copyWith(color: Colors.white70),
//                 ),
//                 const SizedBox(height: 24),
//                 // Quotes carousel
//                 SizedBox(
//                   height: 120,
//                   child: Stack(
//                     children: [
//                       PageView.builder(
//                         controller: _quoteController,
//                         itemCount: quotes.length,
//                         onPageChanged: (i) => setState(() => _currentQuote = i),
//                         itemBuilder: (context, index) {
//                           return Card(
//                             color: Colors.pink.shade200,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Center(
//                                 child: Text(
//                                   quotes[index],
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontStyle: FontStyle.italic,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                       // Indicator dots
//                       Positioned(
//                         bottom: 8,
//                         left: 0,
//                         right: 0,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: List.generate(
//                             quotes.length,
//                             (i) => Container(
//                               margin: const EdgeInsets.symmetric(horizontal: 4),
//                               width: _currentQuote == i ? 12 : 8,
//                               height: _currentQuote == i ? 12 : 8,
//                               decoration: BoxDecoration(
//                                 color:
//                                     _currentQuote == i
//                                         ? Colors.white
//                                         : Colors.white70,
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 // Conditional card
//                 GestureDetector(
//                   onTap: () {
//                     if (widget.hasCompletedQuestionnaire) {
//                       Navigator.pushNamed(context, '/exercises');
//                     } else {
//                       Navigator.pushNamed(context, '/questionnaire');
//                     }
//                   },
//                   child: Card(
//                     color: Colors.pink.shade300,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 widget.hasCompletedQuestionnaire
//                                     ? 'Start therapy session'
//                                     : 'Start questionnaire',
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 4),
//                               Text(
//                                 widget.hasCompletedQuestionnaire
//                                     ? 'Meditation • 3-10 min'
//                                     : 'Questions • 5-7 min',
//                                 style: const TextStyle(color: Colors.white70),
//                               ),
//                             ],
//                           ),
//                           const Icon(
//                             Icons.play_circle_fill,
//                             size: 40,
//                             color: Colors.white,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 // Recommended for you
//                 const Text(
//                   'Recommended for you',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 SizedBox(
//                   height: 160,
//                   child: ListView.separated(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: recommended.length,
//                     separatorBuilder: (_, __) => const SizedBox(width: 16),
//                     itemBuilder: (context, index) {
//                       final item = recommended[index];
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.pushNamed(
//                             context,
//                             '/exercise_detail',
//                             arguments: item,
//                           );
//                         },
//                         child: Container(
//                           width: 140,
//                           decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.2),
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               ClipRRect(
//                                 borderRadius: const BorderRadius.vertical(
//                                   top: Radius.circular(16),
//                                 ),
//                                 child: Image.asset(
//                                   item['image']!,
//                                   height: 100,
//                                   width: double.infinity,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       item['title']!,
//                                       style: const TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 4),
//                                     Text(
//                                       item['subtitle']!,
//                                       style: const TextStyle(
//                                         color: Colors.white70,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
