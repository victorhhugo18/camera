import 'dart:io';
import 'package:camera/model/imagem_model.dart';
import 'package:image_picker/image_picker.dart';

class HomeController {
  final ImagePicker _picker = ImagePicker();
  final ImagemModel imagemModel = ImagemModel();
  File? imagemCapturada;

  Future<File?> capturarFoto() async {
    final XFile? imagem = await _picker.pickImage(source: ImageSource.camera);
    if (imagem == null) return null;

    imagemCapturada = File(imagem.path);
    return imagemCapturada;
  }

  Future<File?> salvarFoto() async {
    if (imagemCapturada == null) return null;

    final imagemSalva = await imagemModel.salvarImagem(imagemCapturada!);
    return imagemSalva;
  }

  // File? get imagemCapturada => _imagemCapturada;
}
