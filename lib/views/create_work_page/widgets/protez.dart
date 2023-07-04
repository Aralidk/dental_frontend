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
        value: widget.provider.selectedEntities[0].isProtez ?? false,
        checkColor: dentalBlue,
        fillColor: MaterialStateProperty.all(dentalBlue),
        onChanged: (val) {
          widget.provider.selectedWorkModelProtezUpdate(teethNumbers: widget.provider.selectedTeethNumbers, isProtez: val);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Protez"),
      children: [
        CheckboxListTile(
          value: widget.provider.selectedEntities[0].isRepair ?? false,
          activeColor: dentalBlue,
          onChanged: (val) {
            widget.provider.selectedWorkModelProtezUpdate(teethNumbers: widget.provider.selectedTeethNumbers,
                isProtez: widget.provider.selectedEntities[0].isProtez, isRepair:  val);
          },
          checkColor: dentalBlue,
          checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Text("Tamir"),
        ),
        widget.provider.selectedEntities[0].isRepair ?? false
            ?  SizedBox(
          child: Column(
            //TODO kroşe ilave ve diş ilave backende eklenmemis ekle ve burayı güncelle
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
                onChanged: (val){
                  widget.provider.selectedWorkModelProtezUpdate(teethNumbers: widget.provider.selectedTeethNumbers,
                  isRepair: false,
                    isProtez: true,
                    slideAmount: int.parse(val)
                  );
                },
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
                onChanged: (val){
                  widget.provider.selectedWorkModelProtezUpdate(teethNumbers: widget.provider.selectedTeethNumbers,
                      isRepair: false,
                      isProtez: true,
                      slideAmount: widget.provider.selectedEntities[0].kronAmount ?? 0,
                    kronAmount: int.parse(val)
                  );
                },
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
                    ),

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
                        value: widget.provider.selectedEntities[0].isSetBottom ?? false, onChanged: (val){
                        widget.provider.selectedWorkModelProtezUpdate(teethNumbers:
                        widget.provider.selectedTeethNumbers,
                          isProtez: true,
                          isRepair: false,
                          kronAmount: widget.provider.selectedEntities[0].kronAmount,
                          slideAmount: widget.provider.selectedEntities[0].slideAmount,
                          isSetBottom: true
                        );
                      },
                        title: const Text("Alt"),
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(value: widget.provider.selectedEntities[0].isSetBottom  != null ?
                      !widget.provider.selectedEntities[0].isSetBottom! : false,
                        activeColor: dentalBlue,
                        checkColor: dentalBlue,
                        checkboxShape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        onChanged: (val){
                          widget.provider.selectedWorkModelProtezUpdate(teethNumbers:
                          widget.provider.selectedTeethNumbers,
                              isProtez: true,
                              isRepair: false,
                              kronAmount: widget.provider.selectedEntities[0].kronAmount ?? 0,
                              slideAmount: widget.provider.selectedEntities[0].slideAmount ?? 0,
                              isSetBottom: false
                          );
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
                        value:widget.provider.selectedEntities[0].isCageBottom ?? false, onChanged: (val){
                        widget.provider.selectedWorkModelProtezUpdate(teethNumbers:
                        widget.provider.selectedTeethNumbers,
                            isProtez: true,
                            isRepair: false,
                            kronAmount: widget.provider.selectedEntities[0].kronAmount ?? 0,
                            slideAmount: widget.provider.selectedEntities[0].slideAmount ?? 0,
                            isSetBottom: false,
                          isCageBottom: true
                        );

                      },
                        title: const Text("Alt"),
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(value: widget.provider.selectedEntities[0].isCageBottom != null ?
                      !widget.provider.selectedEntities[0].isCageBottom!  : false,
                        activeColor: dentalBlue,
                        checkColor: dentalBlue,
                        checkboxShape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        onChanged: (val){
                          widget.provider.selectedWorkModelProtezUpdate(teethNumbers:
                          widget.provider.selectedTeethNumbers,
                              isProtez: true,
                              isRepair: false,
                              kronAmount: widget.provider.selectedEntities[0].kronAmount,
                              slideAmount: widget.provider.selectedEntities[0].slideAmount,
                              isSetBottom: false,
                            isCageBottom: false
                          );
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
                onChanged: (val){
                  widget.provider.selectedWorkModelProtezUpdate(teethNumbers:
                  widget.provider.selectedTeethNumbers,
                      isProtez: true,
                      isRepair: false,
                      kronAmount: widget.provider.selectedEntities[0].kronAmount ?? 0,
                      slideAmount: widget.provider.selectedEntities[0].slideAmount ?? 0,
                      isSetBottom: false,
                      isCageBottom: widget.provider.selectedEntities[0].isCageBottom ?? false,
                    doldarBar: val,
                  );
                },
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
               // keyboardType: TextInputType.number,
                onChanged: (val){
                  widget.provider.selectedWorkModelProtezUpdate(teethNumbers:
                  widget.provider.selectedTeethNumbers,
                    isProtez: true,
                    isRepair: false,
                    kronAmount: widget.provider.selectedEntities[0].kronAmount ?? 0,
                    slideAmount: widget.provider.selectedEntities[0].slideAmount ?? 0,
                    isSetBottom: false,
                    isCageBottom: widget.provider.selectedEntities[0].isCageBottom ?? false,
                    doldarBar: widget.provider.selectedEntities[0].doldarBar ?? "",
                    doldarFoot: val
                  );
                },
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