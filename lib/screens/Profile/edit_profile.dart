
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';
import '../../../Theme/app_colors.dart';
import 'package:image_picker/image_picker.dart';

import '../../stores/user_store.dart';
import '../../widgets/profile_pic.dart';


class EditProfile extends StatefulWidget {
  static const String id = '/edit-profile';
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  //Image Picker
  late PickedFile _imageFile;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Align(
          alignment: Alignment.topLeft,
          child: Text("Edit Profile",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.merge(const TextStyle(color: AppColors.black))),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfilePic(
          picUrl: "https://jugaad-sahi-hai.mustansirg.in/static/" + UserStore().token['profile_photo'].toString(),
          name: UserStore().token['username'].toString(),),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: MaterialButton(
                  //     shape: ContinuousRectangleBorder(
                  //         borderRadius: BorderRadius.circular(4),
                  //         side: const BorderSide(color: AppColors.grey)),
                  //     onPressed: () {
                  //       print("pressed");
                  //       showModalBottomSheet(
                  //         context: context,
                  //         builder: ((builder) => bottomSheet()),
                  //       );
                  //     },
                  //     child: Text(
                  //       'Change Profile Image',
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .headlineMedium
                  //           ?.merge(const TextStyle(color: AppColors.grey)),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.merge(
                                    const TextStyle(color: AppColors.black)),
                          ),
                          Consumer<UserStore>(builder: (_, userStore, __) {
                            // _usernameController.text =
                            //     userStore.currUser.username!;
                            return TextFormField(
                              // onChanged: (value) {
                              //   setState(() {
                              //     username = value;
                              //   });
                              // },
                              controller: _usernameController,
                              // initialValue: userStore.currUser.username,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                hintText: 'Enter your name',
                              ),
                            );
                          }),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bio ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.merge(const TextStyle(color: AppColors.black)),
                        ),
                        Consumer<UserStore>(builder: (_, userStore, __) {
                          // _bioController.text = userStore.currUser.bio!;
                          return TextFormField(
                            controller: _bioController,
                            // keyboardType: TextInputType.multiline,
                            // initialValue: userStore.currUser.bio,
                            minLines: 1,
                            maxLines: 5,
                            decoration: const InputDecoration(
                              hintText: 'Your Bio',
                            ),
                          );
                        }),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: MaterialButton(
                            height: 42,
                            minWidth: MediaQuery.of(context).size.width,
                            color: AppColors.greyLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Apply for verification',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.merge(
                                    const TextStyle(color: AppColors.black),
                                  ),
                            ),
                            onPressed: () async {
                              // _navigationService
                              //     .navigateTo(RoutePath.Verification);
                              if (!await launchUrl(Uri.parse(
                                  'https://airtable.com/shr6IFMRSxUiJqqiB'))) {
                                throw 'Could not launch';
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  onPressed: () async {
                    // print(_usernameController.text);
                    // print(_bioController.text);

                    // await _userRepository.updateProfile(
                    //     _usernameController.text, _bioController.text);
                    // Provider.of<UserStore>(context, listen: false)
                    //     .fetchCurrentUser();
                  },
                  height: 42,
                  minWidth: MediaQuery.of(context).size.width,
                  color: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Save',
                    style: Theme.of(context).textTheme.headlineLarge?.merge(
                          const TextStyle(color: AppColors.white),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      child: Column(
        children: [
          Text(
            "Profile Photo",
            style: Theme.of(context).textTheme.headlineLarge?.merge(
                  const TextStyle(color: AppColors.black),
                ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(
            height: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                // <-- TextButton
                onPressed: () async {
                  print("camera");
                  final pickedFile =
                      await _imagePicker.pickImage(source: ImageSource.camera);
                  //query
                  if (pickedFile != null) {
                    print("image change from camera");
                  } else {
                    print("Not changed");
                  }
                },
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: 40.0,
                  color: AppColors.black,
                ),
                label: Text(
                  'Camera',
                  style: Theme.of(context).textTheme.headlineLarge?.merge(
                        const TextStyle(color: AppColors.black),
                      ),
                ),
              ),
              SizedBox(
                width: 30.0,
              ),
              TextButton.icon(
                // <-- TextButton
                onPressed: () async {
                  print("gallery");
                  // var changedImg = selectImage(ImageSource.gallery);
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.image,
                  );
                  //query
                  if (result != null) {
                    print("image change from gallery");
                  } else {
                    print("Not changed");
                  }



                },
                icon: Icon(
                  Icons.image_outlined,
                  size: 40.0,
                  color: AppColors.black,
                ),
                label: Text(
                  'Gallery',
                  style: Theme.of(context).textTheme.headlineLarge?.merge(
                        const TextStyle(color: AppColors.black),
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
