// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lunch_office/screens/add_entry_form.dart';
// import 'package:lunch_office/model/home_provider.dart';

// // final modelProvider = Provider<HomeProvider>(...);

// class HomePageScreen extends ConsumerWidget {
//   static const String route = "home_page_screen";

//   final ScrollController scrollController = ScrollController();

//   HomePageScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     HomeProvider homeProvider = ref.watch(modelProvider);
//     return SafeArea(
//       child: Scaffold(
//         drawer: Drawer(
//           child: Container(
//             padding: const EdgeInsets.all(20.0),
//             color: Colors.brown,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 GestureDetector(
//                   onTap: () async {
//                     Navigator.pop(context);
//                     int totalAmount = homeProvider.getTotalAmount();
//                     // ignore: use_build_context_synchronously
//                     showAdaptiveDialog(
//                       context: context,
//                       builder: (_) {
//                         return AlertDialog.adaptive(
//                           title: const Text(
//                             "Total",
//                             textAlign: TextAlign.center,
//                           ),
//                           content: Text(
//                             totalAmount.toString(),
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(fontSize: 15),
//                           ),
//                           actions: [
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.pop(context);
//                               },
//                               child: const Text("OK"),
//                             )
//                           ],
//                         );
//                       },
//                     );
//                   },
//                   child: const Card(
//                     shadowColor: Colors.black,
//                     elevation: 10,
//                     child: Padding(
//                       padding: EdgeInsets.all(10.0),
//                       child: Text(
//                         "Get Total",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 GestureDetector(
//                   onTap: () async {
//                     Navigator.pop(context);
//                     homeProvider.resetRecord();
//                     // ignore: use_build_context_synchronously
//                     showAdaptiveDialog(
//                       context: context,
//                       builder: (_) {
//                         return AlertDialog.adaptive(
//                           // title: const Text(
//                           //   "Total",
//                           //   textAlign: TextAlign.center,
//                           // ),
//                           content: const Text(
//                             "Record reset successfully",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 15),
//                           ),
//                           actions: [
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.pop(context);
//                               },
//                               child: const Text("OK"),
//                             )
//                           ],
//                         );
//                       },
//                     );
//                   },
//                   child: const Card(
//                     shadowColor: Colors.black,
//                     elevation: 10,
//                     child: Padding(
//                       padding: EdgeInsets.all(10.0),
//                       child: Text(
//                         "Reset All",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 GestureDetector(
//                   onTap: () async {
//                     Navigator.pop(context);
//                     showModalBottomSheet(
//                       context: context,
//                       builder: (BuildContext builder) {
//                         return const AddEntryForm();
//                       },
//                     );
//                   },
//                   child: const Card(
//                     shadowColor: Colors.black,
//                     elevation: 10,
//                     child: Padding(
//                       padding: EdgeInsets.all(10.0),
//                       child: Text(
//                         "Add Custom Data",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         appBar: AppBar(
//           backgroundColor: Colors.brown,
//           title: const Text("Lunch Office"),
//         ),
//         body: SingleChildScrollView(
//           controller: scrollController,
//           child: Column(
//             children: [
//               for (int index = 0; index < homeProvider.record.length; index++)
//                 Padding(
//                   padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 2.5),
//                   child: Chip(
//                     label: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Text("${(index + 1).toString()}."),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text("PC Battery"),
//                             Text(
//                               homeProvider.record[index]['date'],
//                               style: const TextStyle(fontSize: 10),
//                             ),
//                           ],
//                         ),
//                         Text(homeProvider.record[index]['price'].toString()),
//                       ],
//                     ),
//                     deleteIcon: const Icon(Icons.delete),
//                     onDeleted: () {
//                       homeProvider.deleteRecord(index);
//                     },
//                   ),
//                 ),
//             ],
//           ),
//         ),
//         floatingActionButton: GestureDetector(
//           behavior: HitTestBehavior.translucent,
//           onTap: () {
//             homeProvider.addRecord(price: 10, entryName: "abc");
//             scrollController.animateTo(
//               MediaQuery.of(context).size.height > (scrollController.position.maxScrollExtent + 60)
//                   ? MediaQuery.of(context).size.height
//                   : scrollController.position.maxScrollExtent + 40,
//               duration: const Duration(milliseconds: 500),
//               curve: Curves.easeIn,
//             );
//           },
//           child: Container(
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.brown,
//             ),
//             child: const Icon(
//               Icons.add,
//               size: 50,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
