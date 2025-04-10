import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
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
              const Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Color(0xffFDCF09),
                    child: CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage('assets/img/profile.jpeg'),
                    )),
              ),
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
              Row(
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
                    'Dara',
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
                  Opacity(
                    opacity:
                        0.5, // 0.0 (fully transparent) to 1.0 (fully opaque)
                    child: Text(
                      "age",
                      style: GoogleFonts.aBeeZee(fontSize: 20),
                    ),
                  ),
                  Text(
                    '30y',
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
                  Opacity(
                    opacity:
                        0.5, // 0.0 (fully transparent) to 1.0 (fully opaque)
                    child: Text(
                      "birtday",
                      style: GoogleFonts.aBeeZee(fontSize: 20),
                    ),
                  ),
                  Text(
                    '12,9,2004',
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
                  Opacity(
                    opacity:
                        0.5, // 0.0 (fully transparent) to 1.0 (fully opaque)
                    child: Text(
                      "gender",
                      style: GoogleFonts.aBeeZee(fontSize: 20),
                    ),
                  ),
                  Text(
                    'male',
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
                  Opacity(
                    opacity:
                        0.5, // 0.0 (fully transparent) to 1.0 (fully opaque)
                    child: Text(
                      "Phone number",
                      style: GoogleFonts.aBeeZee(fontSize: 20),
                    ),
                  ),
                  Text(
                    '085909135',
                    style: GoogleFonts.aBeeZee(fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
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
                      ))),
              const SizedBox(
                height: 15,
              ),
              Container(
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
                      )))
            ],
          ),
        ));
  }
}
