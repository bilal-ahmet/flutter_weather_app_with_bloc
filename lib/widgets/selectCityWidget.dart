import 'package:flutter/material.dart';

class selectCityWidget extends StatefulWidget {
  const selectCityWidget({super.key});

  @override
  State<selectCityWidget> createState() => _selectCityWidgetState();
}

class _selectCityWidgetState extends State<selectCityWidget> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("şehir seç"),),
      body: Form(child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _textController,
                decoration: const InputDecoration(label: Text("şehir"), hintText: "şehir seç", border: OutlineInputBorder()),              
              ),
            ),
          ),

          IconButton(onPressed: () {

            // geri dönerken _textController'da tutulan text verisini geri döndür
            Navigator.pop(context, _textController.text);
          }, icon: const Icon(Icons.arrow_back_ios))
        ],
      )),
    );
  }
}