// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;
  final double size,padding;
  final double strokeWidth;

  const LoadingWidget({Key? key, this.color, this.size = 32,this.padding = 3, this.strokeWidth = 2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(padding),
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.brown),
      ),
    );
  }
}

class DialogUtil {

  static Future<void> showSimpleDialog(BuildContext context, String message) async {
    return await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static showLoading({Widget? load}) {
    // Future.delayed(Duration.zero, () async {
    //   Get.dialog(
    //     WillPopScope(
    //       onWillPop: () => Future.value(false),
    //       child: Container(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Container(
    //               width: 25,
    //               height: 25,
    //               child: CircularProgressIndicator(
    //                 valueColor: AlwaysStoppedAnimation<Color>(Constant.kColorOrangePrimary),
    //                 strokeWidth: 2,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     barrierDismissible: false,
    //
    //   );
    // });
    EasyLoading.show(maskType: EasyLoadingMaskType.black, indicator: load ?? const LoadingWidget());
  }

  static hideLoading() {
    EasyLoading.dismiss();
  }

  static Future<T?> buildBaseDialog<T>(
    BuildContext context, {
    Widget? header,
    Widget? body,
    List<Widget>? actions,
    bool? barrierDismissible,
    Color barrierColor = Colors.black54,
    double width = double.infinity,
    EdgeInsets insetPadding = const EdgeInsets.symmetric(horizontal: 16),
  }) async {
    Dialog buildDialog() {
      return Dialog(
        insetPadding: insetPadding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 10),
                    child: header ?? const SizedBox(),
                  ),
                  body ?? const SizedBox(),
                  actions == null ? const SizedBox() : Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: actions,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    T? result = await showDialog(
      barrierDismissible: barrierDismissible ?? true,
      barrierColor: barrierColor,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return barrierDismissible ?? true;
          },
          child: buildDialog(),
        );
      },
    );

    return result;
  }

  static void showExitDialog(BuildContext context) {
    showDialog(
      barrierColor: const Color(0x01000000),
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.of(context).pop(true);
        });
        return Dialog(
          child: Container(
            width: 200,
            height: 30,
            decoration: const BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(10))),
            child: const Center(
              child: Text(
                'Title',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        );
      }
    );
  }

  static showConfirmDialog(BuildContext context, {String? content,
    String title = "Bạn có chắc không?",
    String titleCancel = "Đóng",
    String titleAction = "OK",
    Color? colorTitle,
    Color? colorContent,
    Function? onButtonCancel,
    Function? onButtonAction}) {
    showDialog(context: context, builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.all(0),
          width: 270,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    color: colorTitle ?? Colors.black,
                  ),
                ),
              ),
              if (content != null && content.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: Text(
                    content.toString(),
                    style: TextStyle(
                      fontSize: 13,
                      color: colorContent ?? Colors.black,
                    ),
                  ),
                )
              else
                const SizedBox(height: 24),
              const Divider(height: 1),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  onButtonCancel?.call();
                },
                child: SizedBox(
                  height: 43,
                  child: Center(
                    child: Text(
                      titleCancel,
                      style: const TextStyle(color: Color(0xff007AFF), fontSize: 17),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 1,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  onButtonAction?.call();
                },
                child: SizedBox(
                  height: 43,
                  child: Center(child: Text(titleAction, style: const TextStyle(color: Color(0xff007AFF), fontSize: 17))),
                ),
              ),
            ],
          ),
        ),
      );
    },);
  }
}
