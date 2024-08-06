import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_profile_controller.dart';

class UpdateUserProfileScreen extends StatelessWidget {
  UpdateUserProfileScreen(this.type, {Key? key}) : super(key: key);

  String? type;

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(UserProfileController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Profile",
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

                // -- IMAGE with ICON
                SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        image: (profileController.profileUrl.value.isNotEmpty &&
                                profileController.profileUrl.value !=
                                    "profilePicURL")
                            ? NetworkImage(profileController.profileUrl.value)
                            : const NetworkImage(
                                "https://firebasestorage.googleapis.com/v0/b/sponsor-hub-dnm.appspot.com/o/user_image%2Fuser.jpg?alt=media&token=de49dd69-ce8c-44f9-8a1f-10a09816b1b7"),
                      ),
                    )),
                const SizedBox(height: 50),

                // -- Form Fields
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: profileController.nameController,
                        decoration: const InputDecoration(
                            label: Text("Full Name"),
                            prefixIcon: Icon(Icons.person)),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: profileController.emailController,
                        decoration: const InputDecoration(
                            label: Text("Email"),
                            prefixIcon: Icon(Icons.email)),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: profileController.phoneController,
                        decoration: const InputDecoration(
                            label: Text("Phone"),
                            prefixIcon: Icon(Icons.call)),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: profileController.socialMediaLinkController,
                        decoration: const InputDecoration(
                            label: Text("Social Media Link"),
                            prefixIcon: Icon(Icons.link)),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: profileController.locationController,
                        decoration: InputDecoration(
                          label: const Text("City"),
                          prefixIcon: const Icon(Icons.location_history),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // -- Form Submit Button
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * 0.30,
                      //   height: 50,
                      //   child: ElevatedButton(
                      //     onPressed: () =>
                      //         profileController.submitProfileUpdate(),
                      //     style: ElevatedButton.styleFrom(
                      //         backgroundColor: primaryColor,
                      //         side: BorderSide.none,
                      //         shape: const StadiumBorder()),
                      //     child: const Text("Update",
                      //         style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold)),
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
