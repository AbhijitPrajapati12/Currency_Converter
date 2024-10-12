import 'package:flutter/material.dart';

// 1.Create a variable that stores the converted currency rate
// 2. Create a function that multiplies the value given by the textfield
// 3. Store the value int the variable that we created
// 4. Display th variable

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() {
    return _CurrencyConverterMaterialPageState();
  }
}

// state is mutable
class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  // List<String> items = ['Convert to ₹', 'Convert to \$'];
  // String? selectedItem = 'Convert to ₹';
  double result = 0;
  double value = 0;
  // TextEditingController- gives to access to text in the entire widget wherever we want
  TextEditingController textEditingController = TextEditingController();
//initState() can be used to call the future value

// @override
//   void initState() //this is called before the build function
//{
//result = double.parse(textEditingController.text) * 81;
//     super.initState();
//   }

// @override(rarely used)
//   void didChangeDependencies() {

//     super.didChangeDependencies();
//   }

// @override(rarely used)
//   void didUpdateWidget(covariant CurrencyConverterMaterialPage oldWidget) {
//
//     super.didUpdateWidget(oldWidget);
//   }

//helps to not get our data leak
  @override
  void dispose() //right after the entire the entire widget gets discarded
  {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 12, 12, 12),
        width: 3,
        //enum-is a fixed set of constant values.
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
      // gapPadding: 500.0,
    );

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text(
          "Currency Converter",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        centerTitle: true,
      ), //header
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // int --> string intergervalue.toString()
                // String--> int  int.parse(StringVAlue)

                '₹ $value',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(9, 9, 9, 1),
                ),
              ),
              TextField(
                controller: textEditingController,
                // controller: textediting,
                decoration: const InputDecoration(
                  hintText: (" Enter the amount to convert in USD"),
                  hintStyle: TextStyle(
                    color: Color.fromARGB(
                      255,
                      7,
                      7,
                      7,
                    ),
                  ),
                  prefixIcon: Icon(Icons.monetization_on_rounded),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              //Two buttons:
              //Elevated button
              //Text button
              ElevatedButton(
                onPressed: () {
                  //SetState- tells the widget tree that this element needs a rebuild
                  setState(() {
                    result = double.parse(textEditingController.text) * 81;
                    value = double.parse(result.toStringAsFixed(2));
                  });

                  //OR
                  // value = double.parse(result.toStringAsFixed(2));
                  // result = double.parse(textEditingController.text) * 81;
                  // setState(() {});
                },
                //style: Elevated.styleFrom(),//here we don't have to add 'MaterialStateProperty' everytime
                style: ElevatedButton.styleFrom(
                  elevation: 20,
                  backgroundColor: const Color.fromARGB(255, 89, 239, 14),
                  foregroundColor: Colors.black,
                  // minimumSize: const Size(double.infinity, 50),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  //OR
                  // style:const ButtonStyle(
                  //     elevation: MaterialStatePropertyAll(20),
                  // ),
                ),
                child: const Text(
                  'Convert to ₹',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              const SizedBox(height: 30),
              // DropdownButtonFormField<String>(
              //   iconEnabledColor: const Color.fromARGB(255, 89, 239, 14),
              //   decoration: const InputDecoration(
              //     enabledBorder: border,
              //   ),
              //   value: selectedItem,
              //   items: items
              //       .map((item) => DropdownMenuItem<String>(
              //             value: item,
              //             child: Text(
              //               item,
              //               style: const TextStyle(fontSize: 20),
              //             ),
              //           ))
              //       .toList(), // Closing the map function properly
              //   onChanged: (item) => setState(() {
              //     selectedItem = item;
              //   }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
