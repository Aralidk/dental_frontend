import 'package:dental_workflow/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../styles/text_styles.dart';

class TeethSelection extends StatefulWidget {
  const TeethSelection({Key? key}) : super(key: key);

  @override
  State<TeethSelection> createState() => _TeethSelectionState();
}

class _TeethSelectionState extends State<TeethSelection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
          child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              shrinkWrap: true,
              itemCount: 16,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                return Row(
                  children: [
                    index == 0
                        ? Text("Sağ Üst", style: labelStyle)
                        : index == 8
                            ? Text("Sol Üst", style: labelStyle)
                            : SizedBox(),
                    SizedBox(width: 10.0),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/teeths/${index + 1}.png"),
                            )),
                      ),
                    ),
                    index == 7
                        ? Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: VerticalDivider(
                              width: 3,
                              thickness: 3,
                              color: darkBlue,
                            ),
                          )
                        : SizedBox(width: 3.0)
                  ],
                );
              }),
        ),
        const Divider(),
        SizedBox(
          height: 120,
          child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              shrinkWrap: true,
              itemCount: 16,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                return Row(
                  children: [
                    index == 0
                        ? Text("Sol Alt", style: labelStyle)
                        : index == 8
                            ? Text("Sağ Alt", style: labelStyle)
                            : SizedBox(),
                    SizedBox(width: 10.0),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/teeths/${index + 17}.png"),
                            )),
                      ),
                    ),
                    index == 7
                        ? Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: VerticalDivider(
                              width: 3,
                              thickness: 3,
                              color: darkBlue,
                            ),
                          )
                        : SizedBox(width: 3.0)
                  ],
                );
              }),
        ),
        const Divider(),
      ],
    );
  }
}
