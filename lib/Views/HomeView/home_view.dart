import 'package:breathin_app/Controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'User List',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(
                  () {
                    if (homeController.userList.isEmpty) {
                      return const Center(
                        child: Text('No users found'),
                      );
                    }
                    return ListView.builder(
                      itemCount: homeController.userList.length,
                      itemBuilder: (context, index) {
                        final user = homeController.userList[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(user['username'] ?? 'No Name'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Email: ${user['email'] ?? 'No Email'}'),
                                if (user['language'] != null &&
                                    user['language']!.isNotEmpty)
                                  Text('Language: ${user['language']}'),
                                if (user['createdAt'] != null &&
                                    user['createdAt']!.isNotEmpty)
                                  Text('Created At: ${user['createdAt']}'),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
