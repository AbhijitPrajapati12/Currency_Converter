import 'package:flutter/cupertino.dart';

//stfl-boiler plate for statefulwidget
class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  // List<String> items = ['Convert to ₹', 'Convert to \$'];
  // String? selectedItem = 'Convert to ₹';
  double result = 0;
  double value = 0;
  // TextEditingController- gives to access to text in the entire widget wherever we want
  TextEditingController textEditingController = TextEditingController();
//initState() can be used to call the future value
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.activeGreen,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.activeGreen,
        //middle-Title
        middle: Text(
          "Currency Converter",
          style: TextStyle(color: CupertinoColors.black, fontSize: 30),
        ),
      ), //header
      child: Padding(
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
              CupertinoTextField(
                controller: textEditingController,
                // controller: textediting,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                  color: CupertinoColors.white,
                ),
                placeholder: ("Enter the amount to convert in USD"),
                prefix: const Icon(
                  CupertinoIcons.money_dollar,
                  color: CupertinoColors.black,
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
              CupertinoButton(
                onPressed: () {
                  //SetState- tells the widget tree that this element needs a rebuild
                  setState(() {
                    result = double.parse(textEditingController.text) * 81;
                    value = double.parse(result.toStringAsFixed(2));
                  });
                },
                color: CupertinoColors.black,
                child: const Text(
                  'Convert to ₹',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),

              // ElevatedButton(
              //   onPressed: () {
              //     //SetState- tells the widget tree that this element needs a rebuild
              //     setState(() {
              //       result = double.parse(textEditingController.text) * 81;
              //       value = double.parse(result.toStringAsFixed(2));
              //     });

              //     //OR
              //     // value = double.parse(result.toStringAsFixed(2));
              //     // result = double.parse(textEditingController.text) * 81;
              //     // setState(() {});
              //   },
              //   //style: Elevated.styleFrom(),//here we don't have to add 'MaterialStateProperty' everytime
              //   style: ElevatedButton.styleFrom(
              //     elevation: 20,
              //     backgroundColor: const Color.fromARGB(255, 89, 239, 14),
              //     foregroundColor: Colors.black,
              //     // minimumSize: const Size(double.infinity, 50),
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),

              //     //OR
              //     // style:const ButtonStyle(
              //     //     elevation: MaterialStatePropertyAll(20),
              //     // ),
              //   ),
              //   child: const Text(
              //     'Convert to ₹',
              //     style: TextStyle(fontSize: 20.0),
              //   ),
              // ),
              // const SizedBox(height: 30),
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
