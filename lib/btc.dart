import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Btc extends StatefulWidget {
  const Btc({super.key});

  @override
  State<Btc> createState() => _BtcState();
}

class _BtcState extends State<Btc> {
  String _preco = "0.00";
  void _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = jsonDecode(response.body);
    setState(() {
      _preco = retorno["BRL"]["buy"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/btc_icon.png"),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  "R\$ $_preco",
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              ElevatedButton(
                  onPressed: _recuperarPreco,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xfff79319)),
                  child: const Text(
                    "Atualizar",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
