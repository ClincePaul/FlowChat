import 'package:flowchat/core/widgets/buttons/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ImagePreviewScreen extends StatelessWidget {
 
  const ImagePreviewScreen({
    super.key,
  
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: AppIconButton(
          icon: Icons.reply,
          onTap: () {
             context.pop();
          },
        ),
      ),
      // body: Center(
      //   child: InteractiveViewer(
      //     child: Image.file(
      //       File(imagePath),
      //       fit: BoxFit.contain,
      //     ),
      //   ),
      // ),
    );
  }
}