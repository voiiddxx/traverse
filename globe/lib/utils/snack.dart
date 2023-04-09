import 'package:flutter/material.dart';

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
// Container(
            //   width: double.infinity,
            //   height: 100,
            //   decoration: BoxDecoration(
            //     color: Color.fromARGB(255, 187, 187, 187),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: Row(
            //     children: [
            //       Container(
            //         height: double.infinity,
            //         width: 100,
            //         color: Color.fromARGB(255, 26, 26, 26),
            //         child: Icon(
            //           Icons.person_2_outlined,
            //           color: Colors.white,
            //           size: 35,
            //         ),
            //       ),
            //       Container(
            //         height: double.infinity,
            //         width: 150,
            //         color: Colors.white70,
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.only(top: 15, left: 15),
            //               child: Text(
            //                 "Nikhil Kumar",
            //                 style: TextStyle(
            //                     color: Colors.black,
            //                     fontSize: 20,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(left: 15, top: 5),
            //               child: Text(
            //                 "Nikhildesign55@gmail.com",
            //                 style: TextStyle(
            //                     color: Colors.black,
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.w500),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(left: 15, top: 7),
            //               child: Text(
            //                 "8546215478",
            //                 style: TextStyle(
            //                     color: Colors.black,
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.w500),
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //       Container(
            //         height: double.infinity,
            //         width: 100,
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.only(top: 15, left: 15),
            //               child: Text(
            //                 "Application",
            //                 style: TextStyle(
            //                     color: Colors.black,
            //                     fontSize: 17,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(left: 15, top: 10),
            //               child: Text(
            //                 "Mobile Application Based Product",
            //                 style: TextStyle(
            //                     color: Colors.black,
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.w500),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),