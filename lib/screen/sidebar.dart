import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopcard/config/redux/action.dart';
import 'package:shopcard/config/redux/redux.dart';
import 'package:shopcard/screen/account.dart';
import 'package:shopcard/screen/notification.dart';
import 'package:shopcard/screen/payment.dart';
import 'package:shopcard/screen/productsetting.dart';
import 'package:shopcard/screen/setting.dart';
import 'package:shopcard/widget/switch.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isHelpCollaped = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250, // Fixed width for sidebar
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 158, 158, 158),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Row(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            20), // Adjust for desired roundness
                        child: Image.asset(
                          'assets/img/profile.jpeg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(
                              2), // Adds padding around the icon
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface, // Background color for the container
                          ),
                          child: Icon(
                            Icons.male,
                            color: Theme.of(context)
                                .colorScheme
                                .surface, // Icon color
                            size: 20, // Icon size
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lina',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '18 years',
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context).colorScheme.tertiary),
                      child: IconButton(
                          onPressed: () => {context.pop()},
                          icon: const Icon(Icons.close)))
                ],
              ),
              const SizedBox(height: 32),
              Divider(
                color: Theme.of(context).colorScheme.onSurface,
                thickness: 1.0,
                height: 1,
              ),
              const SizedBox(height: 20),

              Expanded(
                  child: Column(
                children: [
                  Column(
                    children: [
                      // Menu Items
                      _buildMenuItem(
                        icon: Icons.person,
                        title: 'Account',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Account()));
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.settings_outlined,
                        title: 'Settings',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Setting()));
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.payment,
                        title: 'Payment',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Payment()));
                        },
                      ),

                      _buildMenuItem(
                        icon: Icons.shopping_cart_outlined,
                        title: 'Products setting',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ProductSetting()));
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.notification_important_outlined,
                        title: 'Notifications',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Notifications()));
                        },
                      )
                    ],
                  ),
                  ExpansionTile(
                    shape: const Border(),
                    title: Row(
                      children: [
                        Icon(
                          Icons.help_outline, // Help icon
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface, // Icon color
                          size: 30,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Help',
                          style: GoogleFonts.aBeeZee(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    childrenPadding: EdgeInsets.zero,
                    tilePadding: const EdgeInsets.symmetric(vertical: 0),
                    trailing: isHelpCollaped
                        ? Transform.rotate(
                            angle: 3.14 / 2,
                            child: Icon(
                              Icons.chevron_right,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          )
                        : Icon(
                            Icons.chevron_right,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),

                    onExpansionChanged: (bool v) {
                      setState(() {
                        isHelpCollaped = !isHelpCollaped;
                      });
                    },
                    collapsedIconColor: Theme.of(context)
                        .colorScheme
                        .onSecondary, // Color of the collapsed icon
                    children: const <Widget>[
                      ListTile(
                          title: Text(
                              textAlign: TextAlign.justify,
                              'If you have any problem regarding app, you can contacts our call center via phone number 099 5555 54')),
                    ],
                  ),
                ],
              )),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      StoreProvider.of<AppState>(context)
                          .dispatch(LogoutAction());
                          
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.red[100]!,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.red[400],
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Logout',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 16,
                              color: Colors.red[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // In parent widget that connects to Redux
                  StoreConnector<AppState, ValueChanged<bool>>(
                    converter: (store) => (isDark) => store.dispatch(
                          ChangeThemeAction(theme: isDark ? "dark" : "light"),
                        ),
                    builder: (context, onThemeChanged) {
                      final currentTheme =
                          StoreProvider.of<AppState>(context).state.theme.name;
                      return SwitchC(
                        isActive: currentTheme ==
                            'dark', // Now properly checks the name
                        onToggle: onThemeChanged,
                      );
                    },
                  )
                ],
              ),
            ],
          )),
    );
  }

  // Reusable menu item widget
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.onSurface,
              size: 30,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: GoogleFonts.aBeeZee(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right,
              color: Theme.of(context).colorScheme.onSurface,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
