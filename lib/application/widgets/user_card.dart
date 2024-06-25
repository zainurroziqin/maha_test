import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard(
      {super.key,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});
  final String email;
  final String avatar;
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0.1,
              blurRadius: 3,
              offset: const Offset(0, 3), // mengatur posisi bayangan
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.network(
                  avatar,
                  width: 80,
                  height: 80,fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '$firstName $lastName',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    email,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
