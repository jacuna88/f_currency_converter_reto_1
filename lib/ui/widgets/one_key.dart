import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class OneKey extends StatelessWidget {
  const OneKey({Key? key, required this.number, required this.callback})
      : super(key: key);

  final int number;
  final Function(int) callback;

  @override
  Widget build(BuildContext context) {
    // TODO.
    // te le mides a mejorar este key??
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: MaterialButton(
            key: Key(number.toString()),
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            shape: StadiumBorder(),
            onPressed: () {
              _sonidoboton();
              callback(number);
            },
            child: Text(number.toString(),
                style: const TextStyle(
                  fontSize: 26.0,
                  color: Colors.white,
                ))),
      ),
    );
  }

  Future<void> _sonidoboton() async{
    Soundpool pool = Soundpool(streamType: StreamType.notification);
    int soundId = await rootBundle
        .load("lib/ui/widgets/boton.mp3")
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }
}
