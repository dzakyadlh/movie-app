import "package:flutter/material.dart";

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: const Card(
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/kamiya3.jpg"),
                        radius: 56,
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Admin",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                          Text("admin@gmail.com")
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ProfileMenu(),
                  const Divider(),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(fontSize: 14.0, color: Colors.red),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  ProfileMenu({super.key});

  final List<Map<String, dynamic>> menuItems = [
    {"name": "Account", "icon": Icons.person},
    {"name": "My Bookings", "icon": Icons.card_travel},
    {"name": "Wishlist", "icon": Icons.favorite},
    {"name": "Promos", "icon": Icons.discount},
    {"name": "Payment Methods", "icon": Icons.payment},
    {"name": "Notifications", "icon": Icons.notifications},
    {"name": "Accessibility", "icon": Icons.accessibility},
    {"name": "Privacy and Security", "icon": Icons.lock_person},
    {"name": "Help Center", "icon": Icons.help}
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: menuItems.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final menuItem = menuItems[index];
          return Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Row(
              children: [
                Icon(menuItem["icon"]),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  menuItem["name"],
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
