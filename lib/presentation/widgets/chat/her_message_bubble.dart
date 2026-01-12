import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_02_chat/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context)
        .colorScheme; //busca el tema dentro del contexto general

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),

        _ImageBubble(message.imageUrl!),//NO ES OPCIONAL

        const SizedBox(height: 10)

        // Todo: imagen
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //MediaQuery nos da información del dispositivo que lo hace funcionar
    // context, da información del arbol de widgets
    //si imprimo 'size' me diria por consola la dimensión

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 350,
        fit: BoxFit.cover, // basado en las dimensiones que le doy, hazme un box
        //LOADING BUILDER 
        loadingBuilder: (context, child, loadingProgress) {// en tiempo de contruccion
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 350,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Center(
              child: Text('Enviando una imagen.'),
            ),
          );
        },
      ),
    );
  }
}
