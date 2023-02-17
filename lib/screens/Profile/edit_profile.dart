import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:news_time/widgets/LabeledTextFormField.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';
import '../../../Theme/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../../stores/user_store.dart';
import '../../widgets/profile_pic.dart';

class EditProfile extends StatefulWidget {
  static const String id = '/edit-profile';

  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  var imageUrl = "";

  File? profilePic;

  void onPickImageButtonClicked() async {
    final tempImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (tempImage == null) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('An error occurred. Failed to pick image!'),
      ));
      return;
    }

    setState(() {
      profilePic = File(tempImage.path);
    });
  }

  //Image Picker
  late PickedFile _imageFile;
  final ImagePicker _imagePicker = ImagePicker();
  Future<void> callApis() async {
    var dio = Dio();
    dio.options.baseUrl = 'https://jugaad-sahi-hai.mustansirg.in/auth';
    dio.options.headers
        .addAll({"Authorization": " Bearer ${UserStore().APIToken}"});
    print("${UserStore().APIToken}");

    final response = await dio.get('/user/');
    if (response.statusCode == 200) {
      _emailController.text = response.data["email"];
      _nameController.text = response.data["username"];
      imageUrl = response.data["profile_photo"];

      print(response.data);
    } else {
      // return [];
    }
  }

  @override
  void initState() {
    callApis();
    // TODO: implement initState
    super.initState();
  }

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
                  (profilePic != null)
                      ? Align(
                          alignment: Alignment.center,
                          child: Container(
                            child: Image.file(
                              profilePic!.absolute,
                              height: 200,
                              width: 280,
                              scale: 2,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      : Align(
                          alignment: Alignment.center,
                          child: Container(
                            child: MaterialButton(
                              onPressed: () async {
                                // if (kIsWeb) {
                                //   startweb();
                                // } else {
                                onPickImageButtonClicked();
                              },
                              child: ProfilePic(
                                picUrl: "https://jugaad-sahi-hai.mustansirg.in/static/" +
                                    UserStore().token['profile_photo'].toString(),
                                name: UserStore().token['username'].toString(),
                              ),
                            ),
                          ),
                        ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabeledTextFormField(
                            controller: _nameController,
                            title: 'Username',
                            hintTitle:
                                UserStore().token['username'].toString()),
                        SizedBox(height: 20),
                        LabeledTextFormField(
                            controller: _emailController,
                            title: 'Email',
                            hintTitle: UserStore().token['email'].toString()),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                  .headlineSmall
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
                    // PUT DATA
                    // var urii = Uri.parse(
                    //     "https://jugaad-sahi-hai.mustansirg.in/auth/user/");
                    // var request = http.MultipartRequest("GET", urii);
                    // var bytesprofile = await profilePic!.readAsBytes();
                    // request.headers.addAll({
                    //   "Authorization":
                    //       "Bearer ${UserStore().APIToken}"
                    // });
                    // request.fields['username'] = 'PrerakGada3';
                    // request.fields['email'] = 'prerak.yoyoyo@gmail.com';
                    // request.files.add(http.MultipartFile.fromBytes(
                    //     'profile_photo', bytesprofile,
                    //     contentType: MediaType('image', 'jpeg')));
                    // // request.files.add(new http.MultipartFile.fromBytes('file', await File.fromUri("<path/to/file>").readAsBytes(), contentType: new MediaType('image', 'jpeg')))

                    // var response = await request.send();

                    // GET DATA
                    var data = await callApis();
                    // var urii = Uri.parse(
                    //     "https://jugaad-sahi-hai.mustansirg.in/auth/user/");
                    // var request = http.MultipartRequest("GET", urii);
                    // request.headers.addAll({
                    //   "Authorization":
                    //       "Bearer ${UserStore().token["APIToken"]}"
                    // });
                    // var dio

                    // var response = await request.send();

                    // await http.Response.fromStream(response).then((response) {
                    //   var body = jsonDecode(response.body);
                    //   if (response.statusCode == 200) print("Uploaded!");
                    //   // else
                    //   //   print(await response.stream.bytesToString());
                    // });

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
