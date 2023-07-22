import 'package:dental_workflow/providers/app_state_provider.dart';
import 'package:dental_workflow/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';

class CreateWorkHeader extends StatelessWidget {
  const CreateWorkHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: dentalBlue,
                  width: 1,
                )),
            child: Text(
              "${Provider.of<AppStateProvider>(context, listen: false).user?.firstName} ${Provider.of<AppStateProvider>(context, listen: false).user?.lastName} - ${Provider.of<AppStateProvider>(context, listen: false).user?.department ?? ""}",
              style: generalText,
            )),
        // Container(
        //     padding: const EdgeInsets.all(10.0),
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(12),
        //         border: Border.all(
        //           color: darkBlue,
        //           width: 1,
        //         )),
        //     child: Text(Provider.of<AppStateProvider>(context, listen: false).user?.department ?? "", style: generalText,)),
      ],
    );
  }
}
