import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';

class ProfileAvatarRowWidget extends StatefulWidget {
  const ProfileAvatarRowWidget({
    super.key,
    required this.profileUrl,
  });

  final String profileUrl;

  @override
  State<ProfileAvatarRowWidget> createState() => _ProfileAvatarRowWidgetState();
}

class _ProfileAvatarRowWidgetState extends State<ProfileAvatarRowWidget> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            _pickImageFromGallery();
          },
          child: CircleAvatar(
            radius: 40,
            backgroundImage: _selectedImage != null
                ? FileImage(
                    _selectedImage!) // Use FileImage when there's a selected image
                : NetworkImage(widget.profileUrl)
                    as ImageProvider, // Use NetworkImage otherwise
          ),
        ),
        const SizedBox(width: 16),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Oleg Belotserkovsky",
              style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 0.15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white),
            ),
            Text(
              "Rick",
              style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 0.25,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey),
            ),
          ],
        )
      ],
    );
  }

  Future<void> _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage != null) {
      // Ensure that the user didn't cancel the selection
      setState(() {
        _selectedImage = File(returnedImage.path);
      });
    }
  }
}
