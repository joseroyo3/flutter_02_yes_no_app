import 'package:dio/dio.dart';
import 'package:flutter_02_chat/domain/entities/message.dart';
import 'package:flutter_02_chat/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get("https://yesno.wtf/api");

    // Con el yesnomodel tengo el modelo de respuestas del la web
    //en caso de que cambiara, solo deberia cambiarlo ahí, en el modelado
    final YesNoModel yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEmptity();
  }
}
