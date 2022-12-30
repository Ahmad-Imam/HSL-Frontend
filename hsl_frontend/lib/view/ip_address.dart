import 'package:flutter/material.dart';
import 'package:hsl_frontend/view/loading_screen.dart';

String ipAddress = "";

class IpAddress extends StatefulWidget {
  const IpAddress({Key? key}) : super(key: key);

  @override
  State<IpAddress> createState() => _IpAddressState();
}

class _IpAddressState extends State<IpAddress> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Please Enter Your IP Address"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 224, 242, 255),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextField(
                            controller: textEditingController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: "Enter the ip address",
                              border: InputBorder.none,
                              labelText: 'IP',
                            ))))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.green)),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (!mounted) return;
                      setState(() {
                        ipAddress = textEditingController.text;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoadingScreen()),
                      );
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
