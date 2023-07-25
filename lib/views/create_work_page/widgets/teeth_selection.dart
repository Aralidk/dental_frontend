import 'package:dental_workflow/constants/colors.dart';
import 'package:dental_workflow/models/work_model.dart';
import 'package:dental_workflow/providers/work_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../styles/text_styles.dart';

class TeethSelection extends StatefulWidget {
  const TeethSelection({Key? key}) : super(key: key);

  @override
  State<TeethSelection> createState() => _TeethSelectionState();
}

class _TeethSelectionState extends State<TeethSelection> {
  int setTeethNumber(int index) {
    switch (index) {
      case 0:
        return 18;
      case 1:
        return 17;
      case 2:
        return 16;
      case 3:
        return 15;
      case 4:
        return 14;
      case 5:
        return 13;
      case 6:
        return 12;
      case 7:
        return 11;
      case 8:
        return 21;
      case 9:
        return 22;
      case 10:
        return 23;
      case 11:
        return 24;
      case 12:
        return 25;
      case 13:
        return 26;
      case 14:
        return 27;
      case 15:
        return 28;
      case 17:
        return 48;
      case 18:
        return 47;
      case 19:
        return 46;
      case 20:
        return 45;
      case 21:
        return 44;
      case 22:
        return 43;
      case 23:
        return 42;
      case 24:
        return 41;
      case 25:
        return 31;
      case 26:
        return 32;
      case 27:
        return 33;
      case 28:
        return 34;
      case 29:
        return 35;
      case 30:
        return 36;
      case 31:
        return 37;
      case 32:
        return 38;
    }
    return index;
  }

  Color setTeethColor(index) {
    Color returnColor = darkBlue;


    if(Provider.of<WorkProvider>(context, listen: true)
        .workModels
        .workEntities!.isNotEmpty && Provider
        .of<WorkProvider>(context, listen: true)
        .workModels
        .workEntities
        !.where((element) => element.teethNumber == index).isNotEmpty) {
        WorkEntities? entities = Provider
            .of<WorkProvider>(context, listen: true)
            .workModels
            .workEntities
            ?.where((element) => element.teethNumber == index)
            .first;
print(entities!.teethNumber!);
        if (entities != null) {
          if (entities.isMetal ?? false) {
            return Colors.yellow;
          } else if (entities.isZirkon ?? false) {
            return skyBlue;
          } else if (entities.isEMax ?? false) {
            return Colors.purple;
          } else if (entities.isTemp ?? false) {
            return Colors.orange;
          } else if (entities.isMetalAbove ?? false) {
            return Colors.yellowAccent;
          } else if (entities.isBridge ?? false) {
            return Colors.greenAccent;
          } else if (entities.isZirkonAbove ?? false) {
            return Colors.indigo;
          }
          else{
            return returnColor;
          }
        }

    }

      return returnColor;

  }

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
                            : const SizedBox(),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      onTap: () {
                        Provider.of<WorkProvider>(context, listen: false)
                            .addToEntityEnt(setTeethNumber(index));
                      },
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: setTeethColor(setTeethNumber(index)),
                                width: 3),
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
                        : const SizedBox(width: 3.0)
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
                            : const SizedBox(),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      onTap: () {
                        Provider.of<WorkProvider>(context, listen: false)
                            .addToEntityEnt(setTeethNumber(index + 17));
                      },
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: setTeethColor(setTeethNumber(index +17)),
                                width: 3),
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
                        : const SizedBox(width: 3.0)
                  ],
                );
              }),
        ),
        const Divider(),
      ],
    );
  }
}
