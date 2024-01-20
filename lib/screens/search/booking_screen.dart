import "package:flutter/material.dart";

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bookings and Plans")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [BookedList()],
          ),
        ),
      ),
    );
  }
}

class BookedList extends StatelessWidget {
  BookedList({super.key});

  final List<Map<String, dynamic>> bookedItems = [
    {
      "name": "Jakarta - Tokyo",
      "type": "Flight",
      "date": "19 January 2023",
      "time": "21:00 - 05:00",
      "image": ""
    },
    {
      "name": "Disneyland Tokyo",
      "type": "Attractions",
      "date": "21 January 2023",
      "time": "08:00 - Closed",
      "image": ""
    },
    {
      "name": "Universal Studio Tokyo",
      "type": "Attractions",
      "date": "23 January 2023",
      "time": "08:00 - Closed",
      "image": ""
    },
    {
      "name": "Tokyo - Jakarta",
      "type": "Flight",
      "date": "31 January 2023",
      "time": "21:00 - 05:00",
      "image": ""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: bookedItems.length,
        itemBuilder: ((context, index) {
          final bookedItem = bookedItems[index];
          return InkWell(
            onTap: () {},
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookedItem["name"],
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Text(
                      bookedItem["type"],
                      style: const TextStyle(fontSize: 13),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(bookedItem["date"]),
                    Text(bookedItem["time"]),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
