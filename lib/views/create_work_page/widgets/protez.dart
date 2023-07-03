import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../styles/text_styles.dart';

class Protez extends StatefulWidget {
  const Protez({Key? key}) : super(key: key);

  @override
  State<Protez> createState() => _ProtezState();
}

class _ProtezState extends State<Protez> {
  bool isRepair = false;
  String slideAmount = "1";
  List<String> slideOptions = ["1", "2", "3"];
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Checkbox(
        value: false,
        checkColor: dentalBlue,
        fillColor: MaterialStateProperty.all(dentalBlue),
        onChanged: (val) {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Protez"),
      children: [
        CheckboxListTile(
          value: isRepair,
          activeColor: dentalBlue,
          onChanged: (val) {
            setState(() {
              isRepair = val!;
            });
          },
          checkColor: dentalBlue,
          checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Text("Tamir"),
        ),
        isRepair
            ?  SizedBox(
          child: Column(
            children: [
              CheckboxListTile(value: false, onChanged: (val){
              },
                title: const Text("Kroşe İlave"),
                activeColor: dentalBlue,
                checkColor: dentalBlue,
                checkboxShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              CheckboxListTile(value: false, onChanged: (val){
              },
                title: const Text("Diş İlave"),
                activeColor: dentalBlue,
                checkColor: dentalBlue,
                checkboxShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              )
            ],
          ),
        )
            : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelStyle: labelStyle,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    label: const Text("Sürgü"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: dentalBlue,
                            width: 1
                        )
                    )
                ),
              ),
              // DropdownButtonFormField<String>(
              //     value: slideAmount,
              //     isExpanded: true,
              //     alignment: Alignment.centerRight,
              //     decoration: InputDecoration(
              //       labelStyle: TextStyle(
              //         color: skyBlue,
              //         fontSize: 22,
              //         fontWeight: FontWeight.w500,
              //         fontFamily: "Poppins"
              //       ),
              //        focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(12),
              //             borderSide:
              //                 BorderSide(color: salmonPink, width: 1)),
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(12),
              //             borderSide:
              //                 BorderSide(color: salmonPink, width: 1)),
              //         floatingLabelBehavior: FloatingLabelBehavior.auto,
              //         label: Text("Sürgü")),
              //     items: slideOptions.map((String e) {
              //       return DropdownMenuItem<String>(
              //           value: e, child: Text(e));
              //     }).toList(),
              //     onChanged: (String? value) {
              //       setState(() {
              //         slideAmount = value!;
              //       });
              //     }),
              const SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelStyle: labelStyle,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    label: const Text("Kron"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: dentalBlue,
                            width: 1
                        )
                    )
                ),
              ),
              const SizedBox(height: 15), Text("Takım Dişi", style: labelStyle),
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                        color: dentalBlue,
                        width: 1
                    )
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        activeColor: dentalBlue,
                        checkColor: dentalBlue,
                        checkboxShape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        value: false, onChanged: (val){
                      },
                        title: const Text("Alt"),
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(value: false,
                        activeColor: dentalBlue,
                        checkColor: dentalBlue,
                        checkboxShape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        onChanged: (val){
                        },
                        title: const Text("Üst"),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15), Text("Kafes", style: labelStyle),
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                        color: dentalBlue,
                        width: 1
                    )
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        activeColor: dentalBlue,
                        checkColor: dentalBlue,
                        checkboxShape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        value: false, onChanged: (val){
                      },
                        title: const Text("Alt"),
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(value: false,
                        activeColor: dentalBlue,
                        checkColor: dentalBlue,
                        checkboxShape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        onChanged: (val){
                        },
                        title: const Text("Üst"),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelStyle: labelStyle,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    label: const Text("Doldar Bar"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: dentalBlue,
                            width: 1
                        )
                    )
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelStyle: labelStyle,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    label: const Text("Doldar Ayak"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: dentalBlue,
                            width: 1
                        )
                    )
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}