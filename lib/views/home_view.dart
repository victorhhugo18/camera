// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:io';
import 'package:camera/controller/home-controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  File? imagem;
  final HomeController _controller = HomeController();

  Future<void> tirarFoto() async {
    final imagemCapturada = await _controller.capturarFoto();
    setState(() {
      imagem = imagemCapturada;
    });
  }

  Future<void> salvarFoto() async {
    if (_controller.imagemCapturada != null) {
      final imagemSalva = await _controller.salvarFoto();
      if (imagemSalva != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Foto salva com sucesso!')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Câmera Flutter'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: imagem == null
                  ? Text('Nenhuma imagem capturada')
                  : Image.file(imagem!),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                tirarFoto();
              },
              child: Text('Abrir câmera',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  fixedSize: Size(200, 50)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                salvarFoto();
              },
              child: Text('Salvar foto',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  fixedSize: Size(200, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
