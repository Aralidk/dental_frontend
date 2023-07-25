import 'package:dental_workflow/providers/work_provider.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../styles/text_styles.dart';

class Protez extends StatefulWidget {
  Protez({Key? key, required this.provider}) : super(key: key);
  WorkProvider provider;

  @override
  State<Protez> createState() => _ProtezState();
}

class _ProtezState extends State<Protez> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Checkbox(
        value: widget.provider.isProtez,
        checkColor: dentalBlue,
        fillColor: MaterialStateProperty.all(dentalBlue),
        onChanged: (val) {
          widget.provider.changeProtez(val!);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Protez"),
      children: [
        CheckboxListTile(
          value: widget.provider.protezDetails.values.elementAt(2),
          activeColor: dentalBlue,
          onChanged: (val) {
            print(val);
            widget.provider.selectedWorkModelProtezUpdate("isRepair", val);
          },
          checkColor: dentalBlue,
          checkboxShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Text("Tamir"),
        ),
        widget.provider.protezDetails.values.elementAt(2)
            ? SizedBox(
                child: Column(
                  //TODO kroşe ilave ve diş ilave backende eklenmemis ekle ve burayı güncelle
                  children: [
                    CheckboxListTile(
                      value: false,
                      onChanged: (val) {},
                      title: const Text("Kroşe İlave"),
                      activeColor: dentalBlue,
                      checkColor: dentalBlue,
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    CheckboxListTile(
                      value: false,
                      onChanged: (val) {},
                      title: const Text("Diş İlave"),
                      activeColor: dentalBlue,
                      checkColor: dentalBlue,
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
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
                              borderSide:
                                  BorderSide(color: dentalBlue, width: 1))),
                      onChanged: (val) {
                        widget.provider
                            .selectedWorkModelProtezUpdate("slideAmount", val);
                      },
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        widget.provider
                            .selectedWorkModelProtezUpdate("kronAmount", val);
                      },
                      decoration: InputDecoration(
                        labelStyle: labelStyle,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        label: const Text("Kron"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(color: dentalBlue, width: 1)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text("Takım Dişi", style: labelStyle),
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(color: dentalBlue, width: 1)),
                      child: Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              activeColor: dentalBlue,
                              checkColor: dentalBlue,
                              checkboxShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              value: false,
                              onChanged: (val) {
                                if (val!) {
                                  widget.provider.selectedWorkModelProtezUpdate(
                                      "isSetBottom", true);
                                }
                              },
                              title: const Text("Alt"),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              value: false,
                              activeColor: dentalBlue,
                              checkColor: dentalBlue,
                              checkboxShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              onChanged: (val) {
                                if (val!) {
                                  widget.provider.selectedWorkModelProtezUpdate(
                                      "isSetBottom", false);
                                }
                              },
                              title: const Text("Üst"),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text("Kafes", style: labelStyle),
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(color: dentalBlue, width: 1)),
                      child: Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              activeColor: dentalBlue,
                              checkColor: dentalBlue,
                              checkboxShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              value: false,
                              onChanged: (val) {
                                if (val!) {
                                  widget.provider.selectedWorkModelProtezUpdate(
                                      "isCageBottom", true);
                                }
                              },
                              title: const Text("Alt"),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              value: false,
                              activeColor: dentalBlue,
                              checkColor: dentalBlue,
                              checkboxShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              onChanged: (val) {
                                widget.provider.selectedWorkModelProtezUpdate(
                                    "isCageBottom", false);
                              },
                              title: const Text("Üst"),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      //keyboardType: TextInputType.number,
                      onChanged: (val) {
                        widget.provider
                            .selectedWorkModelProtezUpdate("doldarBar", val);
                      },
                      decoration: InputDecoration(
                          labelStyle: labelStyle,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          label: const Text("Doldar Bar"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(color: dentalBlue, width: 1))),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      // keyboardType: TextInputType.number,
                      onChanged: (val) {
                        widget.provider
                            .selectedWorkModelProtezUpdate("doldarFoot", val);
                      },
                      decoration: InputDecoration(
                          labelStyle: labelStyle,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          label: const Text("Doldar Ayak"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(color: dentalBlue, width: 1))),
                    ),
                  ],
                ),
              )
      ],
    );
  }
}
