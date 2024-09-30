import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ImagemModel {
  File? imagem;

  Future<File?> salvarImagem(File imagem) async {
    final diretorio = await getApplicationDocumentsDirectory();
    final imagemCaminho = '${diretorio.path}/${imagem.uri.pathSegments.last}';
    final imagemSalva = await imagem.copy(imagemCaminho);

    return imagemSalva;
  }
}