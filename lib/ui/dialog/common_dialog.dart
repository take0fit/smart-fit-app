import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smart_fit/constant/app_strings.dart';
import 'package:smart_fit/ui/common/ui_helper.dart';
import 'package:smart_fit/ui/widget/button.dart';

class DefaultDialog extends StatelessWidget {
  const DefaultDialog({
    super.key,
    this.title,
    this.description,
    this.positiveLabel = Strings.ok,
    this.onPositive,
  });

  final String? title;
  final String? description;
  final String positiveLabel;
  final VoidCallback? onPositive;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              verticalSpaceSmall,
              if (title != null)
                Text(
                  title!,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              if (description != null) Text(description!),
              verticalSpaceLarge,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Column(
                  children: [
                    if (positiveLabel.isNotEmpty)
                      _DialogButton(
                        label: positiveLabel,
                        onPressed: () {
                          Get.back();
                          onPositive?.call();
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class _DialogButton extends StatelessWidget {
  const _DialogButton({
    required this.label,
    required this.onPressed,
  });

  final String label;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Get.theme.primaryColor,
        foregroundColor: Colors.white,
        shape: const StadiumBorder(),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}

/// デザイン的にこちらよりも[DefaultDialog]を使った方が良さそうです。
class DefaultAlertDialog extends StatelessWidget {
  const DefaultAlertDialog({
    super.key,
    this.title,
    this.description,
    this.isConfirmationDialog = false,
    this.positiveLabel = Strings.ok,
    this.negativeLabel = Strings.cancel,
    this.onNegative,
    this.onPositive,
  });

  final String? title;
  final String? description;
  final String positiveLabel;
  final String negativeLabel;
  final bool isConfirmationDialog;
  final VoidCallback? onNegative;
  final VoidCallback? onPositive;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title == null ? null : Text(title!),
      content: description == null ? null : Text(description!),
      actions: <Widget>[
        if (isConfirmationDialog)
          TextButton(
            onPressed: () {
              Get.back();
              onNegative?.call();
            },
            child: Text(negativeLabel),
          ),
        TextButton(
          onPressed: () {
            Get.back();
            onPositive?.call();
          },
          child: Text(positiveLabel),
        ),
      ],
    );
  }
}

class DefaultRichDialog extends StatelessWidget {
  const DefaultRichDialog({
    super.key,
    this.title,
    this.contents,
    this.positiveLabel = Strings.ok,
    this.negativeLabel = Strings.cancel,
    this.onPositive,
    this.onNegative,
    this.insetPadding,
    this.buttonSpace = verticalSpaceLarge,
  });

  final String? title;
  final Widget? contents;
  final String positiveLabel;
  final String negativeLabel;
  final VoidCallback? onPositive;
  final VoidCallback? onNegative;
  final EdgeInsets? insetPadding;
  final Widget buttonSpace;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: insetPadding != null
          ? insetPadding!
          : const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            verticalSpaceSmall,
            if (title != null)
              Text(
                title!,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            if (contents != null) Container(child: contents),
            buttonSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  if (positiveLabel.isNotEmpty)
                    PrimaryButton(
                      label: positiveLabel,
                      onPressed: () {
                        Get.back();
                        onPositive?.call();
                      },
                    ),
                  if (positiveLabel.isNotEmpty && negativeLabel.isNotEmpty) verticalSpaceMedium,
                  if (negativeLabel.isNotEmpty)
                    SubButton(
                      label: negativeLabel,
                      onPressed: () {
                        Get.back();
                        onNegative?.call();
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
