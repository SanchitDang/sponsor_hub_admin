import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'consult_controller.dart';

class UpdateConsultScreen extends StatelessWidget {
  const UpdateConsultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final consultController = Get.put(ConsultController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Consult",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.60,
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // -- Form Fields
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: consultController.nameController,
                        decoration: const InputDecoration(
                            label: Text("Full Name"),
                            prefixIcon: Icon(Icons.person)),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: consultController.emailController,
                        decoration: const InputDecoration(
                            label: Text("Email"),
                            prefixIcon: Icon(Icons.email)),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: consultController.phoneNumberController,
                        decoration: const InputDecoration(
                            label: Text("Phone Number"),
                            prefixIcon: Icon(Icons.phone)),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: consultController.addressController,
                        decoration: InputDecoration(
                          label: const Text("Address"),
                          prefixIcon: const Icon(Icons.location_history),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: consultController.noteController,
                        decoration: const InputDecoration(
                            label: Text("Note"),
                            prefixIcon: Icon(Icons.note)),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: consultController.sponsorshipTypeController,
                        decoration: const InputDecoration(
                            label: Text("Sponsorship Type"),
                            prefixIcon: Icon(Icons.business)),
                      ),
                      const SizedBox(height: 20),

                      // -- Form Submit Button
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * 0.30,
                      //   height: 50,
                      //   child: ElevatedButton(
                      //     onPressed: () => consultController.submitConsultUpdate(),
                      //     style: ElevatedButton.styleFrom(
                      //         backgroundColor: primaryColor,
                      //         side: BorderSide.none,
                      //         shape: const StadiumBorder()),
                      //     child: const Text("Update",
                      //         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      //   ),
                      // ),
                      // const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
