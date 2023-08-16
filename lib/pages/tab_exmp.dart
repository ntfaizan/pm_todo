import 'package:flutter/material.dart';

class TabExamp extends StatelessWidget {
  const TabExamp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.chat_bubble),
                text: "Chats",
              ),
              Tab(
                icon: Icon(Icons.video_call),
                text: "Calls",
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: "Settings",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("Chats..."),
            ),
            Center(
              child: Text("Calls..."),
            ),
            Center(
              child: Text("Settings..."),
            ),
          ],
        ),
      ),
    );
  }
}
