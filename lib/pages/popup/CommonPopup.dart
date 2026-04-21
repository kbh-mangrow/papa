import 'package:flutter/material.dart';

import 'AppOverlayState.dart';

class CommonPopup extends StatefulWidget {
  final String title;
  final String? message;
  final Widget? widget;
  final String? cancel;
  final String ok;
  final VoidCallback? onCancel;
  final VoidCallback onOk;

  const CommonPopup({
    super.key,
    required this.title,
    this.message,
    this.widget,
    this.cancel,
    required this.ok,
    this.onCancel,
    required this.onOk,
  });

  @override
  State<CommonPopup> createState() => CommonPopupState();

  static Future<bool?> show(
      BuildContext context, {
        required String title,
        String? message,
        Widget? widget,
        String? cancel,
        VoidCallback? onCancel,
        required String ok,
        required VoidCallback onOk,
      }) {
    AppOverlayState.isDialogOpen = true;

    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return CommonPopup(
          title: title,
          message: message,
          widget: widget,
          cancel: cancel,
          ok: ok,
          onCancel: onCancel,
          onOk: onOk,
        );
      },
    ).whenComplete(() {
      AppOverlayState.isDialogOpen = false;
    });
  }
}

class CommonPopupState extends State<CommonPopup> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (widget.message != null) const SizedBox(height: 20),
                    if (widget.message != null)
                      Center(
                        child: Text(
                          widget.message!,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    if (widget.widget != null) widget.widget!,
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.grey,
                height: 0.3,
                thickness: 0.3,
              ),
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    if (widget.cancel != null)
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop(false);
                              widget.onCancel?.call();
                            },
                            child: Center(
                              child: Text(
                                widget.cancel!,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (widget.cancel != null)
                      Container(
                        width: 0.3,
                        color: Colors.grey,
                      ),
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop(true);
                            widget.onOk();
                          },
                          child: Center(
                            child: Text(
                              widget.ok,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}