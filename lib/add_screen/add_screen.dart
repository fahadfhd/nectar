import 'package:flutter/material.dart';
import 'package:nectar/utils/camer_gallery_dialoge.dart';
import 'package:nectar/utils/common_textfieldwidget.dart';
import 'package:nectar/utils/widgets_of_share_screen.dart';

class AddScreen extends StatefulWidget {
  static const route = "AddScreen";
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text("Title"),
            ),
            const SizedBox(
              height: 4,
            ),
            CommonTextFieldWidget(
              controller: titleTextEditingController,
            ),
            const SizedBox(
              height: 4,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text("Description"),
            ),
            const SizedBox(
              height: 4,
            ),
            CommonTextFieldWidget(
              controller: descriptionTextEditingController,
            ),
            const SizedBox(
              height: 4,
            ),
            GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (builder) {
                      return CameraGalleryDialoge(
                        ctx: context,
                      );
                    },
                  );
                },
                child: const DottedUploadDocumentWidget()),
          ],
        ),
      ),
    );
  }
}
