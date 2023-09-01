import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
           // SizedBox(height: 30),
            profileWidget(),

            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                children: [
                  textIconWidget(text: 'Path Finder'),
                  const SizedBox(height: 20),
                  textIconWidget(text: 'My Life Profile'),
                  const SizedBox(height: 20),
                  textIconWidget(text: 'Next Life Profile'),
                  const SizedBox(height: 20),
                  textIconWidget(text: 'Path Profile'),
                  const SizedBox(height: 20),
                  textIconWidget(text: 'Store'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget profileWidget(){
    return Container(
      padding: const EdgeInsets.only(top: 30,bottom: 20),
      decoration: const BoxDecoration(
          color : Color(0xFF7EBEB2),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(25))
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: GestureDetector(
              onTap: () {
                // goToPage(1);
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                backgroundImage: AssetImage('assets/meta/avatar.jpg'),
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'Brianna James',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          )
        ],
      ),
    );
  }

  Widget textIconWidget({required String text}){
    return Row(
      children: [
        Icon(Icons.person),
        SizedBox(width: 20),
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        )
      ],
    );
  }
}
