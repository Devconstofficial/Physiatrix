import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final TextEditingController promptController;
  String responseTxt = '';
  late ResponseModel _responseModel;

  @override
  void initState() {
    promptController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text(
          'ChatBot',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PromptBldr(responseTxt: responseTxt),
          TextFormFieldBldr(
              promptController: promptController, btnFun: completionFun),
        ],
      ),
    );
  }

  completionFun() async {
    setState(() => responseTxt = 'Loading...');

    final response = await http.post(Uri.parse('https://api.openai.com/v1/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${dotenv.env['token']}'
        },
        body: jsonEncode({
          "model": "text-davinci-003",
          "prompt": promptController.text,
          "max_tokens": 250,
          "temperature": 0,
          "top_p": 1,
        }));
    setState(() {
      _responseModel = ResponseModel.fromJson(jsonDecode(response.body));
      responseTxt = _responseModel.choices[0]['text'];
      debugPrint(responseTxt);
    });
  }
}

class PromptBldr extends StatelessWidget {
  const PromptBldr({super.key, required this.responseTxt});
  final String responseTxt;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Text(
              responseTxt,
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ),
    );
  }
}

class TextFormFieldBldr extends StatelessWidget {
  const TextFormFieldBldr(
      {super.key, required this.promptController, required this.btnFun});

  final TextEditingController promptController;
  final Function btnFun;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Flexible(
              child: TextFormField(
            controller: promptController,
            cursorColor: Colors.white,
            autofocus: true,
            style: const TextStyle(color: Colors.white, fontSize: 20),
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                filled: true,
                fillColor: Colors.amberAccent,
                hintText: 'Ask me anything'),
          )),
          Container(
            color: Colors.lightGreen,
            child: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => btnFun,
            ),
          )
        ],
      ),
    );
  }
}




class ResponseModel {
  final List<Map<String, dynamic>> choices;

  ResponseModel({required this.choices});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> choiceList = json['choices'];
    final choices = choiceList.map((choice) {
      return Map<String, dynamic>.from(choice);
    }).toList();

    return ResponseModel(choices: choices);
  }
}
