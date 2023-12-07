// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:projek_akhir_rental_mobil_k1_c1/SettingScreen.dart';
// import 'package:projek_akhir_rental_mobil_k1_c1/about_page.dart';
// import 'package:projek_akhir_rental_mobil_k1_c1/introduction_page.dart';

// class Profil extends StatefulWidget {
//   const Profil({Key? key}) : super(key: key);

//   @override
//   State<Profil> createState() => __ProfilState();
// }

// class __ProfilState extends State<Profil> with SingleTickerProviderStateMixin {
//   late User _user;
//   TextEditingController _nameController = TextEditingController();

//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//     _getUserInfo();
//   }

//   Future<void> _getUserInfo() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       setState(() {
//         _user = user;
//         _nameController.text = _user.displayName ?? '';
//       });
//     }
//   }

//   Future<void> _updateUserName(String newName) async {
//     try {
//       await _user.updateDisplayName(newName);
//       // Update the local state after a successful update
//       setState(() {
//         _user = FirebaseAuth.instance.currentUser!;
//       });
//       // Show a success message or navigate to another screen
//       print('User display name updated successfully');
//     } catch (error) {
//       // Handle errors during the update process
//       print('Error updating user display name: $error');
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     ThemeData themeData = Theme.of(context);
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text('RENTCARS'),
//         centerTitle: true,
//         backgroundColor: Color.fromARGB(70, 0, 255, 238),
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               // Tambahkan logika logout di sini
//               FirebaseAuth.instance.signOut();
//               // Navigator.pushReplacementNamed(
//               //     context, 'Login'); // Ganti dengan rute login yang sesuai
//               Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => IntroductionPage()),
//                     );
//             },
//           ),
//         ],
//       ),
//       bottomNavigationBar: buildBottomNavBar(2, size, themeData),
//       body: Stack(
//         children: [
//           Image.asset(
//             'assets/BG.jpeg',
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 80,
//                   backgroundImage:
//                       AssetImage('assets/b790c867a12855ea7bcac8517c230283.jpg'),
//                 ),
//                 SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: Center(
//                         child: TextField(
//                           controller: _nameController,
//                           style: TextStyle(
//                             color: Color.fromARGB(255, 0, 0, 0),
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(left: 8.0), // Adjust as needed
//                       child: IconButton(
//                         icon: Icon(Icons.edit),
//                         onPressed: () {
//                           // Handle edit button pressed
//                           showDialog(
//                             context: context,
//                             builder: (context) => AlertDialog(
//                               title: Text('Edit Name'),
//                               content: TextField(
//                                 controller: _nameController,
//                               ),
//                               actions: [
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                   child: Text('Cancel'),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {
//                                     _updateUserName(_nameController.text);
//                                     Navigator.pop(context);
//                                   },
//                                   child: Text('Save'),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 8),
//                 Center(
//                   child: Text(
//                     _user.email ?? 'No Name',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 0, 0, 0),
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SettingsScreen()),
//                     );
//                   },
//                   child: Text("setting"),
//                 ),
//                 SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => Aboutpage())
//                       );
//                   },
//                   child: Text("About Page"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildBottomNavBar(int selectedIndex, Size size, ThemeData themeData) {
//     return BottomNavigationBar(
//       currentIndex: selectedIndex,
//       onTap: (index) {
//         setState(() {
//           selectedIndex = index;
//         });

//         switch (index) {
//           case 0:
//             Navigator.pushReplacementNamed(context, '/home');
//             break;
//           case 1:
//             Navigator.pushReplacementNamed(context, '/history');
//             break;
//           case 2:
//             Navigator.pushReplacementNamed(context, '/profile');
//             break;
//         }
//       },
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.history),
//           label: 'History',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: 'Profile',
//         ),
//       ],
//     );
//   }
// }

//============================================================
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:petshop/Auth.dart';
// import 'package:petshop/Login.dart';

// class Profile extends StatefulWidget {
//   const Profile({Key? key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   User? _user;
//   bool _isDarkMode = false;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   void initState() {
//     super.initState();
//     _auth.authStateChanges().listen((User? user) {
//       setState(() {
//         _user = user;
//       });
//     });
//   }

//   Future<void> _showEditProfileDialog(BuildContext context) async {
//     TextEditingController usernameController = TextEditingController();
//     usernameController.text = _user != null ? _user!.displayName ?? '' : '';

//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             'Edit Profile',
//             style: GoogleFonts.secularOne(),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               if (_user != null)
//                 TextFormField(
//                   controller: usernameController,
//                   inputFormatters: [LengthLimitingTextInputFormatter(25)],
//                   decoration: InputDecoration(
//                     hintText: 'Username',
//                     prefixIcon: Icon(Icons.person),
//                     prefixIconColor: Color(0xFF255e36),
//                   ),
//                 ),
//               SizedBox(height: 16),
//               Text(
//                 'Are you sure you want to edit your profile?',
//                 style: GoogleFonts.inter(),
//               ),
//             ],
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text(
//                 'Cancel',
//                 style: GoogleFonts.inter(),
//               ),
//             ),
//             TextButton(
//               onPressed: () async {
//                 // Update username
//                 await _updateUsername(usernameController.text);

//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text(
//                 'Save',
//                 style: GoogleFonts.inter(),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _updateUsername(String newUsername) async {
//     try {
//       await _user!.updateProfile(displayName: newUsername);
//       setState(() {
//         _user = FirebaseAuth.instance.currentUser;
//       });
//     } catch (e) {
//       print("Error updating username: $e");
//     }
//   }

//   Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             'Logout Confirmation',
//             style: GoogleFonts.secularOne(),
//           ),
//           content: Text(
//             'Are you sure you want to log out?',
//             style: GoogleFonts.inter(),
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text(
//                 'Cancel',
//                 style: GoogleFonts.inter(),
//               ),
//             ),
//             TextButton(
//               onPressed: () async {
//                 await Auth().signOut();
//                 // Navigate to the login page when log out is confirmed
//                 Navigator.of(context).pushAndRemoveUntil(
//                   MaterialPageRoute(builder: (context) => Login()),
//                   (Route<dynamic> route) => false,
//                 );
//               },
//               child: Text(
//                 'Logout',
//                 style: GoogleFonts.inter(),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 248, 242, 255),
//       appBar: AppBar(
//         centerTitle: true,
//         iconTheme: IconThemeData(
//           color: Color.fromARGB(255, 90, 83, 170),
//         ),
//         title: Text(
//           "Profile",
//           style: GoogleFonts.secularOne(
//             textStyle: TextStyle(
//               color: Color.fromARGB(255, 90, 83, 170),
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 16.0),
//             child: InkWell(
//               onTap: () => _showEditProfileDialog(context),
//               child: Text(
//                 'Edit',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 90, 83, 170),
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           IconButton(
//             onPressed: () => _showLogoutConfirmationDialog(context),
//             icon: Icon(
//               Icons.logout,
//             ),
//           ),
//           IconButton(
//             onPressed: () {
//               // Toggle dark mode
//               setState(() {
//                 _isDarkMode = !_isDarkMode;
//               });
//               // TODO: Implement dark mode logic
//             },
//             icon: Icon(
//               _isDarkMode ? Icons.light_mode : Icons.dark_mode,
//               color: _isDarkMode ? Colors.white : Colors.black,
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         padding: EdgeInsets.only(left: 8, right: 8),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/background/bg2-icon.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: ListView(
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     'My Account',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   CircleAvatar(
//                     radius: 50.0,
//                     backgroundImage: AssetImage('assets/tanoo.jpg'),
//                   ),
//                   SizedBox(height: 20.0),
//                   Text(
//                     _user != null ? _user!.displayName ?? 'Guest' : 'Guest',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   Text(
//                     _user != null
//                         ? _user!.email ?? 'Email not available'
//                         : 'Email not available',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             SizedBox(
//               height: 40,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//====================================================
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projek_akhir_rental_mobil_k1_c1/SettingScreen.dart';
import 'package:projek_akhir_rental_mobil_k1_c1/about_page.dart';
import 'package:projek_akhir_rental_mobil_k1_c1/introduction_page.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => __ProfilState();
}

class __ProfilState extends State<Profil> with SingleTickerProviderStateMixin {
  late User _user;
  TextEditingController _nameController = TextEditingController();

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _user = user;
        _nameController.text = _user.displayName ?? '';
      });
    }
  }

  Future<void> _updateUserName(String newName) async {
    try {
      await _user.updateDisplayName(newName);
      setState(() {
        _user = FirebaseAuth.instance.currentUser!;
      });
      print('User display name updated successfully');
    } catch (error) {
      print('Error updating user display name: $error');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('RENTCARS'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(70, 0, 255, 238),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IntroductionPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Edit Name'),
                  content: TextField(
                    controller: _nameController,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        _updateUserName(_nameController.text);
                        Navigator.pop(context);
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavBar(2, size, themeData),
      body: Stack(
        children: [
          Image.asset(
            'assets/BG.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage:
                      AssetImage('assets/b790c867a12855ea7bcac8517c230283.jpg'),
                ),
                SizedBox(height: 16),
                  Center(
                  child: Text(
                    _user.displayName ?? 'No Name',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(
                    _user.email ?? 'No Email',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsScreen()),
                    );
                  },
                  child: Text("Setting"),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Aboutpage()),
                    );
                  },
                  child: Text("About Page"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomNavBar(int selectedIndex, Size size, ThemeData themeData) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });

        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/history');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
