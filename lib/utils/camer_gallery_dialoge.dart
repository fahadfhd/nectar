import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/provider/addscreen_provider.dart';
import 'package:nectar/utils/extension.dart';
import 'package:provider/provider.dart';

class CameraGalleryDialoge extends StatelessWidget {
  final BuildContext ctx;
  const CameraGalleryDialoge({
    Key? key,
    required this.ctx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.read<AddscreenProvider>();
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 57, 20, 57),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            GestureDetector(
              child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 140,
                  width: 155,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffEFF6F6)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.withOpacity(0.2),
                        ),
                        child: Image.asset(
                          "camera_two".asIconPng(),
                          scale: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Capture from camera",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff161616)),
                      ),
                    ],
                  )),
              onTap: () async {
                await provider.openCamera(
                  context,
                );
              },
            ),
            GestureDetector(
              child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 140,
                  width: 155,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffEFF6F6)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.withOpacity(0.2),
                        ),
                        child: Image.asset(
                          "gallery_two".asIconPng(),
                          scale: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Upload from gallery",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff161616)),
                      ),
                    ],
                  )),
              onTap: () async {
                Navigator.pop(context);
                await provider.openGallery(
                  context: context,
                );
              },
            ),
            GestureDetector(
              child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 140,
                  width: 155,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffEFF6F6)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.withOpacity(0.2),
                        ),
                        child: Image.asset(
                          "gallery_two".asIconPng(),
                          scale: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Video record",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff161616)),
                      ),
                    ],
                  )),
              onTap: () async {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, VideoRecordCamera.route);
              },
            ),
          ],
        ));
  }
}
