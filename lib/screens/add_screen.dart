import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String? selectedItem;
  final TextEditingController expalinC = TextEditingController();
  final TextEditingController amountC = TextEditingController();
  FocusNode ex = FocusNode();
  FocusNode amountFoc = FocusNode();
  final List<String> item = ['Food', 'Transfer', 'Transportation', 'Education'];

  @override
  void initState() {
    super.initState();
    ex.addListener(() {
      setState(() {});
    });
    amountFoc.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double topMargin =
        MediaQuery.of(context).orientation == Orientation.portrait ? 10 : 110;
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
            child: Stack(
          alignment: Alignment.center,
          children: [
            backgroundContainer(context),
            mainContainer(topMargin, context),
          ],
        )));
  }

  Container mainContainer(double topMargin, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin, left: 40, right: 40),
      width: MediaQuery.of(context).size.width - 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      height: 550,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            name(context),
            const SizedBox(height: 30),
            explain(),
            const SizedBox(
              height: 30,
            ),
            amount(),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff368983)),
                width: 120,
                height: 50,
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontFamily: 'f',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Padding amount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: amountFoc,
        controller: amountC,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          labelText: 'amount',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2,
                color: Color(0xffC5C5C5),
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xff368983),
            ),
          ),
        ),
      ),
    );
  }

  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        focusNode: ex,
        controller: expalinC,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          labelText: 'explain',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2,
                color: Color(0xffC5C5C5),
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xff368983),
            ),
          ),
        ),
      ),
    );
  }

  Padding name(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: const Color(0xffc5c5c5),
          ),
        ),
        child: DropdownButton<String>(
          value: selectedItem,
          items: item
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 42,
                          child: Image.asset('images/$e.png'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          e,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ))
              .toList(),
          hint: const Text(
            'Name',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          onChanged: (String? value) {
            //if (value != null) {
            setState(() {
              selectedItem = value;
            });
            //}
          },
        ),
      ),
    );
  }

  Column backgroundContainer(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: const BoxDecoration(
            color: Color(0xff368983),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    const Text(
                      'Adding',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.attach_file_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
