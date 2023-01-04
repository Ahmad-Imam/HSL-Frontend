import 'package:flutter/material.dart';
import 'package:hsl_frontend/view/loading_screen.dart';

String ipAddress = "";
String port = "";

class IpAddress extends StatefulWidget {
  const IpAddress({Key? key}) : super(key: key);

  @override
  State<IpAddress> createState() => _IpAddressState();
}

class _IpAddressState extends State<IpAddress> {
  TextEditingController ipTextEditingController = TextEditingController();
  TextEditingController portTextEditingController = TextEditingController();

  final formKeyIP = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HSL-City Bike',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Please Enter Your IP Address"),
          centerTitle: true,
        ),
        body: Form(
          key: formKeyIP,
          child: Column(
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
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          child: TextFormField(
                              controller: ipTextEditingController,
                              keyboardType: TextInputType.number,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Can\'t be empty';
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: "Enter the ip address",
                                border: InputBorder.none,
                                labelText: 'IP',
                              ))))),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 224, 242, 255),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          child: TextFormField(
                              controller: portTextEditingController,
                              keyboardType: TextInputType.number,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Can\'t be empty';
                                }
                                if (int.tryParse(val) == null) {
                                  return 'Only Number are allowed';
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: "Enter the port number of local host",
                                border: InputBorder.none,
                                labelText: 'PORT',
                              ))))),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "I do not store this IP Address anywhere in the application. Backend is run locally and the application needs the user's ip address to fetch data from there after running the server. \n \n PS: Note that both the application and the backend needs to be connected in the same wifi connection/ip address",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
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
                        if (formKeyIP.currentState!.validate()) {
                          if (!mounted) return;
                          setState(() {
                            ipAddress = ipTextEditingController.text;
                            port = portTextEditingController.text;
                          });
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoadingScreen()),
                            ModalRoute.withName("/Home"),
                          );
                        }
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
