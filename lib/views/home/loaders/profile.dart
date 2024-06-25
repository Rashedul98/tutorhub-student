import 'package:flutter/material.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:tutorhub/utilities/colors.dart';
import 'package:tutorhub/utilities/shared_preference.dart';
import 'package:tutorhub/utilities/singleton.dart';

class ProfileBottomSheet extends StatefulWidget {
  const ProfileBottomSheet({super.key});

  @override
  State<ProfileBottomSheet> createState() => _ProfileBottomSheetState();
}

class _ProfileBottomSheetState extends State<ProfileBottomSheet> {
  String? name;
  String? email;
  String? phone;

  getUserData() async {
    name = await locator<SharedPreferenceService>().getString(key: "userName");
    email =
        await locator<SharedPreferenceService>().getString(key: "userEmail");
    phone =
        await locator<SharedPreferenceService>().getString(key: "userPhone");
    setState(() {});
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProText(
            text: "Name: $name",
            fontSize: 16,
            color: ProjectColors.primary,
          ),
          const ProGap(y: 8),
          ProText(
            text: "Email: $email",
            fontSize: 16,
            color: ProjectColors.primary,
          ),
          const ProGap(y: 8),
          ProText(
            text: "Phone: $phone",
            fontSize: 16,
            color: ProjectColors.primary,
          ),
        ],
      ),
    );
  }
}
