import 'package:dental_workflow/constants/colors.dart';
import 'package:dental_workflow/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CreateWorkPage extends StatefulWidget {
  const CreateWorkPage({Key? key}) : super(key: key);

  @override
  State<CreateWorkPage> createState() => _CreateWorkPageState();
}

class _CreateWorkPageState extends State<CreateWorkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            CreateWorkHeader(),
            Divider(),
            MetalTile(),
            Zirkon(),
            EMax(),
            Protez(),
            NightPlaque(),
            Temprory()
          ],
        ),
      ),
    );
  }
}

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
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: salmonPink,
                  width: 1,
                )),
            child: const Text("Müşteri Adı")),
        Container(
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: darkBlue,
                  width: 1,
                )),
            child: const Text("Müşteri Numarası")),
      ],
    );
  }
}

class MetalTile extends StatefulWidget {
  const MetalTile({Key? key}) : super(key: key);

  @override
  State<MetalTile> createState() => _MetalTileState();
}

class _MetalTileState extends State<MetalTile> {
  bool implantAbove = false;
  bool metalProofing = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Checkbox(
        value: implantAbove,
        checkColor: salmonPink,
        fillColor: MaterialStateProperty.all(salmonPink),
        onChanged: (val) {
          setState(() {
            implantAbove = val!;
          });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Metal"),
      children: [
        CheckboxListTile(
          value: implantAbove,
          activeColor: salmonPink,
          onChanged: (val) {
            setState(() {
              implantAbove = val!;
            });
          },
          checkColor: salmonPink,
          checkboxShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Text("İmplant Üstü"),
        ),
        CheckboxListTile(
          value: metalProofing,
          activeColor: salmonPink,
          onChanged: (val) {
            setState(() {
              metalProofing = val!;
            });
          },
          checkColor: salmonPink,
          checkboxShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Text("Metal Prova Gelsin"),
        ),
      ],
    );
  }
}

class Zirkon extends StatefulWidget {
  const Zirkon({Key? key}) : super(key: key);

  @override
  State<Zirkon> createState() => _ZirkonState();
}

class _ZirkonState extends State<Zirkon> {
  bool implantAbove = false;
  bool metalProofing = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Checkbox(
        value: false,
        checkColor: salmonPink,
        fillColor: MaterialStateProperty.all(salmonPink),
        onChanged: (val) {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Zirkon"),
      children: [
        CheckboxListTile(
          value: implantAbove,
          activeColor: salmonPink,
          onChanged: (val) {
            setState(() {
              implantAbove = val!;
            });
          },
          checkColor: salmonPink,
          checkboxShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Text("İmplant Üstü"),
        ),
        CheckboxListTile(
          value: metalProofing,
          activeColor: salmonPink,
          onChanged: (val) {
            setState(() {
              metalProofing = val!;
            });
          },
          checkColor: salmonPink,
          checkboxShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Text("Metal Prova Gelsin"),
        ),
      ],
    );
  }
}

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
        checkColor: salmonPink,
        fillColor: MaterialStateProperty.all(salmonPink),
        onChanged: (val) {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Protez"),
      children: [
        CheckboxListTile(
          value: isRepair,
          activeColor: salmonPink,
          onChanged: (val) {
            setState(() {
              isRepair = val!;
            });
          },
          checkColor: salmonPink,
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
                activeColor: salmonPink,
                checkColor: salmonPink,
                checkboxShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              CheckboxListTile(value: false, onChanged: (val){
              },
                title: const Text("Diş İlave"),
                activeColor: salmonPink,
                checkColor: salmonPink,
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
                                  color: salmonPink,
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
                            color: salmonPink,
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
                              color: salmonPink,
                              width: 1
                          )
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              activeColor: salmonPink,
                              checkColor: salmonPink,
                              checkboxShape:
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              value: false, onChanged: (val){
                            },
                              title: const Text("Alt"),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(value: false,
                              activeColor: salmonPink,
                              checkColor: salmonPink,
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
                          color: salmonPink,
                          width: 1
                        )
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              activeColor: salmonPink,
                              checkColor: salmonPink,
                              checkboxShape:
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              value: false, onChanged: (val){
                            },
                              title: const Text("Alt"),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(value: false,
                              activeColor: salmonPink,
                              checkColor: salmonPink,
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
                                  color: salmonPink,
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
                                  color: salmonPink,
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

class EMax extends StatelessWidget {
  const EMax({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Checkbox(
        value: false,
        checkColor: salmonPink,
        fillColor: MaterialStateProperty.all(salmonPink),
        onChanged: (val) {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("E-max"),
      //children: [
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: TextField(
        //     keyboardType: TextInputType.number,
        //     decoration: InputDecoration(
        //         labelStyle: labelStyle,
        //         floatingLabelBehavior: FloatingLabelBehavior.auto,
        //         label: const Text("Özel Lab Notu"),
        //         border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(12),
        //             borderSide: BorderSide(
        //                 color: salmonPink,
        //                 width: 1
        //             )
        //         )
        //     ),
        //   ),
        // ),
    //  ],
    );
  }
}

class NightPlaque extends StatelessWidget {
  const NightPlaque({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ExpansionTile(
      leading: Checkbox(
        value: false,
        checkColor: salmonPink,
        fillColor: MaterialStateProperty.all(salmonPink),
        onChanged: (val) {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Gece Plağı"),
      children: [
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                  color: salmonPink,
                  width: 1
              )
          ),
          child: Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  activeColor: salmonPink,
                  checkColor: salmonPink,
                  checkboxShape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  value: false, onChanged: (val){
                },
                  title: const Text("Sert"),
                ),
              ),
              Expanded(
                child: CheckboxListTile(value: false,
                  activeColor: salmonPink,
                  checkColor: salmonPink,
                  checkboxShape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  onChanged: (val){
                  },
                  title: const Text("Yumuşak"),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Temprory extends StatelessWidget {
  const Temprory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Checkbox(
        value: false,
        checkColor: salmonPink,
        fillColor: MaterialStateProperty.all(salmonPink),
        onChanged: (val) {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      title: const Text("Geçici"),
      //children: [
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: TextField(
        //     keyboardType: TextInputType.number,
        //     decoration: InputDecoration(
        //         labelStyle: labelStyle,
        //         floatingLabelBehavior: FloatingLabelBehavior.auto,
        //         label: const Text("Özel Lab Notu"),
        //         border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(12),
        //             borderSide: BorderSide(
        //                 color: salmonPink,
        //                 width: 1
        //             )
        //         )
        //     ),
        //   ),
        // ),
     // ],
    );
  }
}


