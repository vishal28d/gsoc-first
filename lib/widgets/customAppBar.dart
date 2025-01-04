import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  // ignore: non_constant_identifier_names
  final String AppBarTitle;

  const CustomAppBar( this.AppBarTitle , {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(AppBarTitle),
      centerTitle: true,
      backgroundColor: const Color(0xff324860) ,
      leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios_new_rounded , color: Colors.white,)),
      titleTextStyle: GoogleFonts.raleway(color: Colors.white , fontSize: 30),
      
    );
  }
}
