import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base_test/firebase/fireStoreController.dart';
import 'package:fire_base_test/models/note.dart';
import 'package:fire_base_test/screens/addEdit.dart/addEdit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fire_base_test/screens/mainScreen/mainScreencontroller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      global: true,
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    Get.toNamed("/AddEdit");
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.logOut();
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
            body: StreamBuilder<QuerySnapshot<Note>>(
              stream: FirestoreController().read(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          snapshot.data!.docs[index].data().title!,
                        ),
                        subtitle: Text(
                          snapshot.data!.docs[index].data().info!,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            controller.delete(snapshot.data!.docs[index].id);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        onTap: () {
                          Note note = snapshot.data!.docs[index].data();
                          note.path = snapshot.data!.docs[index].id;
                          Get.toNamed("/AddEdit", arguments: {
                            "title": note.title,
                            "info": note.info,
                            "path": note.path
                          });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => AddEdit(
                          //         note: note,
                          //       ),
                          //     ));
                        },
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text("there is no data"),
                  );
                }
              },
            ));
      },
    );
  }
}
