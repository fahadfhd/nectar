import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/utils/extension.dart';

class DottedUploadDocumentWidget extends StatelessWidget {
  const DottedUploadDocumentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(3),
      padding: const EdgeInsets.all(6),
      dashPattern: const [10, 4],
      color: Color(0xffD9D9D9),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        child: SizedBox(
          height: 106,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "upload_icon".asIconPng(),
                height: 30,
                width: 30,
              ),
              Text(
                "Click to upload Display images",
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffACACAC)),
              ),
              Text(
                "Supports : JPEG, PNG",
                style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffADADAD)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
