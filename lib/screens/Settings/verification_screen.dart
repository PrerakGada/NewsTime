import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Theme/app_colors.dart';

class VerifyJournalist extends StatelessWidget {

  VerifyJournalist({Key? key}) : super(key: key);

  void _pickFile() async {
    // opens storage to pick files and the picked file or files
    // are assigned into result and if no file is chosen result is null.
    // you can also toggle "allowMultiple" true or false depending on your need
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    // if no file is picked
    if (result == null) return;

    // we get the file from result object

    // _openFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Verification for Journalist",
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.merge(const TextStyle(color: AppColors.black))),
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_outlined,
            color: AppColors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: 16.0,
              right: 16,
              top: MediaQuery.of(context).size.height * 0.05),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name ',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.merge(const TextStyle(color: AppColors.grey)),
                          ),
                          TextField(
                            keyboardType: TextInputType.name,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter
                            ],
                            decoration: const InputDecoration(
                              hintText: 'Shubham',
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About me ',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.merge(const TextStyle(color: AppColors.grey)),
                          ),
                          TextField(
                            keyboardType: TextInputType.name,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter
                            ],
                            decoration: const InputDecoration(
                              hintText: 'mumbai under water',
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add Social Media Link ',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.merge(const TextStyle(color: AppColors.grey)),
                          ),
                          TextField(
                            keyboardType: TextInputType.name,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter
                            ],
                            decoration: const InputDecoration(
                              hintText: 'mumbai under water',
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Government document ',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.merge(const TextStyle(color: AppColors.grey)),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MaterialButton(
                                  height: 42,
                                  minWidth:
                                      MediaQuery.of(context).size.width * 0.2,
                                  color: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  onPressed: () {
                                    _pickFile();
                                  },
                                  child: Text(
                                    'Upload',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.merge(
                                          const TextStyle(
                                              color: AppColors.white),
                                        ),
                                  ),
                                ),
                              ),
                              Text(
                                '(eg.Aadhaar card,pan card) ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.merge(
                                        const TextStyle(color: AppColors.grey)),
                              ),
                            ],
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Press Id ',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.merge(const TextStyle(color: AppColors.grey)),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MaterialButton(
                                  height: 42,
                                  minWidth:
                                      MediaQuery.of(context).size.width * 0.2,
                                  color: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  onPressed: () {
                                    _pickFile();
                                  },
                                  child: Text(
                                    'Upload',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.merge(
                                          const TextStyle(
                                              color: AppColors.white),
                                        ),
                                  ),
                                ),
                              ),
                              Text(
                                'Document upload ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.merge(
                                        const TextStyle(color: AppColors.grey)),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    height: 42,
                    minWidth: MediaQuery.of(context).size.width * 0.9,
                    color: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onPressed: () {
                      // _navigationService.navigateTo(RoutePath.Profile);
                    },
                    child: Text(
                      'Apply for verification',
                      style: Theme.of(context).textTheme.headlineLarge?.merge(
                            const TextStyle(color: AppColors.white),
                          ),
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
}
