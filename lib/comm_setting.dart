import 'package:flutter/material.dart';

class CommSettingScreen extends StatefulWidget {
  const CommSettingScreen({super.key});

  @override
  State<CommSettingScreen> createState() => _CommSettingScreenState();
}

class _CommSettingScreenState extends State<CommSettingScreen> {
  var width;
  String? commTypeValue = 'TCP';
  String? buadRateValue = '9600';
  bool isEnableProxy = false;
  TextEditingController timeOutController = TextEditingController();
  TextEditingController serialPortController = TextEditingController();
  TextEditingController destIPController = TextEditingController();
  TextEditingController destPortController= TextEditingController();
  TextEditingController macAddressController = TextEditingController();
  TextEditingController deviceNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                dropDOwnWidget(<String>[
                  'UART',
                  'TCP',
                  'BLUETOOTH',
                  'SSL',
                  'HTTP',
                ], "Comm Type", hint: "Select Comm Type", isCommType: true),
                const SizedBox(
                  height: 20,
                ),
                textFieldWidget('TimeOut', postfixText: 'MS', controller: timeOutController),
                const SizedBox(
                  height: 20,
                ),
                textFieldWidget('Serial Port', controller: serialPortController),
                const SizedBox(
                  height: 20,
                ),
                dropDOwnWidget(
                  <String>[
                    '9600',
                  ],
                  "Baud Rate",
                  hint: "Select Buad Rate",
                  
                ),
                const SizedBox(
                  height: 20,
                ),
                textFieldWidget('Dest IP',controller: destIPController),
                const SizedBox(
                  height: 20,
                ),
                textFieldWidget('Dest Port', controller:destPortController),
                const SizedBox(
                  height: 20,
                ),
                textFieldWidget('Mac Addr', controller: macAddressController),
                const SizedBox(
                  height: 20,
                ),
                textFieldWidget('Device Name', controller:deviceNameController),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Enable Proxy'),
                    Switch(
                      value: isEnableProxy,
                      onChanged: (value) {
                        setState(
                          () {
                            isEnableProxy = value;
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    saveSettings();
                  },
                  child: const Text(
                    'Save',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

    void saveSettings() {
    String commType = commTypeValue ?? '';
    String baudRate = buadRateValue ?? '';
    String timeout = timeOutController.text;
    String serialPort = serialPortController.text;
    String destIP = destIPController.text;
    String destPort = destPortController.text;
    String macAddress = macAddressController.text;
    String deviceName = deviceNameController.text;

   
    print('Comm Type: $commType');
    print('Baud Rate: $baudRate');
    print('Timeout: $timeout');
    print('Serial Port: $serialPort');
    print('Dest IP: $destIP');
    print('Dest Port: $destPort');
    print('Mac Address: $macAddress');
    print('Device Name: $deviceName');
    print('Enable Proxy: $isEnableProxy');

   
  }

 


  Row textFieldWidget(String title, {hint, postfixText, controller}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        SizedBox(
            width: width * 0.7,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(

                  suffixIcon: postfixText != null
                      ? SizedBox(
                          width: 20, child: Center(child: Text(postfixText)))
                      : null,
                  hintText: hint,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3))),
            ))
      ],
    );
  }

  Widget dropDOwnWidget(List<String> list, String title,
      {hint, isCommType = false, isBaudRate = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        SizedBox(
          width: width * 0.7,
          child: DropdownButton<String>(
            isExpanded: true,
            value: isCommType ? commTypeValue : buadRateValue,
            items: list.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (v) {
              setState(() {
                if (isCommType) {
                  commTypeValue = v;
                } else {}
              });
            },
          ),
        )
      ],
    );
  }
}
