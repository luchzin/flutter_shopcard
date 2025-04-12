import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String? username;
  int? age;
  String? birtday;
  String? gender;
  String? email;
  String? phonenumber;
  bool lockprofile = false;
  bool pubProfile = false;
  bool pubPurchasedGood = false;
  String? profilePathImage;
  SharedPreferences? pref;

  File? _savedImage;

  Future<void> _loadPreferences() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('username');
      age = pref.getInt('age');
      birtday = pref.getString('birtday');
      email = pref.getString('email');
      phonenumber = pref.getString('phonenumber');
      gender = pref.getString('gender');
      lockprofile = pref.getBool('lockprofile') ?? false;
      pubProfile = pref.getBool('pubProfile') ?? false;
      pubPurchasedGood = pref.getBool('pubPurchasedGood') ?? false;
      profilePathImage = pref.getString('profilePathImage');
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  void updateLockProfile() async {
    final newValue = !lockprofile;
    setState(() {
      lockprofile = newValue;
    });
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('lockprofile', newValue);
  }

  void updatePubProfile() async {
    final newValue = !pubProfile;
    setState(() {
      pubProfile = newValue;
    });
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('pubProfile', newValue);
  }

  void updatePubPurchase() async {
    final newValue = !pubPurchasedGood;
    setState(() {
      pubPurchasedGood = newValue;
    });
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('pubPurchasedGood', newValue);
  }

  void updateEmail(BuildContext context) async {
    TextEditingController emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter New Email'),
          content: TextField(
            controller: emailController,
            decoration: const InputDecoration(hintText: 'New Email'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                String newEmail = emailController.text.trim();
                if (newEmail.isNotEmpty) {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('email', newEmail);
                  setState(() {
                    email = newEmail;
                  });
                  if (mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Email saved')),
                    );
                  }
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void updateField(String fieldName) async {
    TextEditingController fieldController = TextEditingController();

    if (fieldName == 'birtday') {
      final DateTime? date = await showDatePicker(
          context: context,
          firstDate: DateTime(1970),
          lastDate: DateTime(2036));
      final pref = await SharedPreferences.getInstance();

      if (date != null) {
        await pref.setString(
            'birtday', '${date.year},${date.month},${date.day}');
        setState(() {
          birtday = '${date.year},${date.month},${date.day}';
        });
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter New $fieldName'),
            content: TextField(
              controller: fieldController,
              keyboardType: fieldName == 'age' || fieldName == 'phoneNumber'
                  ? TextInputType.number
                  : TextInputType.text,
              decoration: InputDecoration(hintText: 'New $fieldName'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  String newValue = fieldController.text.trim();
                  if (newValue.isNotEmpty) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    switch (fieldName) {
                      case 'age':
                        int? value = int.tryParse(newValue);
                        if (value != null) {
                          await prefs.setInt('age', value);
                          setState(() {
                            age = value;
                          });
                        }
                        break;

                      case 'gender':
                        await prefs.setString('gender', newValue);
                        setState(() {
                          gender = newValue;
                        });
                        break;
                      case 'phonenumber':
                        await prefs.setString('phonenumber', newValue);
                        setState(() {
                          phonenumber = newValue;
                        });
                        break;
                      case 'username':
                        await prefs.setString('username', newValue);
                        setState(() {
                          username = newValue;
                        });
                        break;
                    }

                    if (mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$fieldName saved')),
                      );
                    }
                  }
                },
                child: const Text('Save'),
              ),
            ],
          );
        },
      );
    }
  }

  void updatePassword() async {
    TextEditingController passController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter New password'),
          content: TextField(
            controller: passController,
            decoration: const InputDecoration(hintText: 'New password'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                String newPass = passController.text.trim();
                if (newPass.isNotEmpty) {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('password', newPass);

                  if (mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('password saved')),
                    );
                  }
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void updateProfilePic() async {
    final ImagePicker picker = ImagePicker();

    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final savedImage =
          await File(pickedFile.path).copy('${appDir.path}/${pickedFile.name}');
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profilePathImage', savedImage.path);

      setState(() {
        profilePathImage = savedImage.path;
        _savedImage = savedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.chevron_left,
                size: 40,
              ),
              onPressed: () => context.pop(),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.person),
              )
            ]),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      updateProfilePic();
                    },
                    child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Color(0xffFDCF09),
                        child: CircleAvatar(
                          radius: 75,
                          backgroundImage: _savedImage != null
                              ? FileImage(_savedImage!) as ImageProvider
                              : (profilePathImage != null
                                  ? FileImage(File(profilePathImage!))
                                      as ImageProvider
                                  : const AssetImage(
                                      'assets/img/profile.jpeg')),
                        )),
                  )),
              const SizedBox(
                height: 15,
              ),
              Opacity(
                  opacity: 0.5,
                  child: SizedBox(
                      height: 15,
                      child: Divider(
                        color: Theme.of(context).colorScheme.onSurface,
                        thickness: 1.0,
                        height: 1,
                      ))),
              GestureDetector(
                  onTap: () {
                    updateField('username');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity:
                            0.5, // 0.0 (fully transparent) to 1.0 (fully opaque)
                        child: Text(
                          "Username",
                          style: GoogleFonts.aBeeZee(fontSize: 20),
                        ),
                      ),
                      Text(
                        username ?? "Not set yet",
                        style: GoogleFonts.aBeeZee(fontSize: 20),
                      )
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                  onTap: () {
                    updateField('age');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity:
                            0.5, // 0.0 (fully transparent) to 1.0 (fully opaque)
                        child: Text(
                          "age",
                          style: GoogleFonts.aBeeZee(fontSize: 20),
                        ),
                      ),
                      Text(
                        age == null ? "Not set yet" : age.toString(),
                        style: GoogleFonts.aBeeZee(fontSize: 20),
                      )
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                  onTap: () {
                    updateField('birtday');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity:
                            0.5, // 0.0 (fully transparent) to 1.0 (fully opaque)
                        child: Text(
                          "birtday",
                          style: GoogleFonts.aBeeZee(fontSize: 20),
                        ),
                      ),
                      Text(
                        birtday ?? 'Not set yet',
                        style: GoogleFonts.aBeeZee(fontSize: 20),
                      )
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                  onTap: () {
                    updateField('gender');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity:
                            0.5, // 0.0 (fully transparent) to 1.0 (fully opaque)
                        child: Text(
                          "gender",
                          style: GoogleFonts.aBeeZee(fontSize: 20),
                        ),
                      ),
                      Text(
                        gender ?? 'Not set yet',
                        style: GoogleFonts.aBeeZee(fontSize: 20),
                      )
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                  onTap: () {
                    updateField('phonenumber');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity:
                            0.5, // 0.0 (fully transparent) to 1.0 (fully opaque)
                        child: Text(
                          "Phone number",
                          style: GoogleFonts.aBeeZee(fontSize: 20),
                        ),
                      ),
                      Text(
                        phonenumber ?? 'Not set yet',
                        style: GoogleFonts.aBeeZee(fontSize: 20),
                      )
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity:
                        0.5, // 0.0 (fully transparent) to 1.0 (fully opaque)
                    child: Text(
                      "email",
                      style: GoogleFonts.aBeeZee(fontSize: 20),
                    ),
                  ),
                  Text(
                    email ?? 'Not set yet',
                    style: GoogleFonts.aBeeZee(fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Opacity(
                        opacity:
                            0.5, // 0.0 (fully transparent) to 1.0 (fully opaque)
                        child: Text(
                          "Lock profile",
                          style: GoogleFonts.aBeeZee(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.lock,
                        color: Theme.of(context).colorScheme.tertiary,
                      )
                    ],
                  ),
                  Switch(
                      splashRadius: 100,
                      value: lockprofile,
                      onChanged: (bool v) {
                        updateLockProfile();
                      }),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Opacity(
                      opacity: 0.5,
                      child: Text(
                        "Allow others to see your profile detail",
                        style: GoogleFonts.aBeeZee(fontSize: 20),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  Switch(
                      value: pubProfile,
                      onChanged: (bool b) {
                        updatePubProfile();
                      }),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Opacity(
                      opacity: 0.5,
                      child: Text(
                        "Allow others to see your all purchased goods",
                        style: GoogleFonts.aBeeZee(fontSize: 20),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  Switch(
                      value: pubPurchasedGood,
                      onChanged: (bool g) {
                        updatePubPurchase();
                      }),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                  onTap: () {
                    updateEmail(context);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).colorScheme.tertiary),
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Opacity(
                                opacity:
                                    0.5, // 0.0 (fully transparent) to 1.0 (fully opaque)
                                child: Text(
                                  "Update email",
                                  style: GoogleFonts.aBeeZee(fontSize: 20),
                                ),
                              ),
                              Icon(
                                Icons.email,
                                color: Colors.blue[400],
                              )
                            ],
                          )))),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                  onTap: () {
                    updatePassword();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).colorScheme.tertiary),
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Opacity(
                                opacity:
                                    0.5, // 0.0 (fully transparent) to 1.0 (fully opaque)
                                child: Text(
                                  "Update password",
                                  style: GoogleFonts.aBeeZee(fontSize: 20),
                                ),
                              ),
                              Icon(
                                Icons.lock,
                                color: Colors.blue[400],
                              )
                            ],
                          ))))
            ],
          ),
        ));
  }
}
