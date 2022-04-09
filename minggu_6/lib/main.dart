import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> gambar = [
    'chimmy.gif',
    'cooky.gif',
    'koya.gif',
    'mang.gif',
    'rj.gif',
    'shooky.gif',
    'tata.gif',
    'van.gif'
  ];

  static const Map<String, Color> colors = {
    'chimmy.gif': Colors.red,
    'cooky.gif': Colors.green,
    'koya.gif': Colors.blue,
    'mang.gif': Colors.yellow,
    'rj.gif': Colors.orange,
    'shooky.gif': Colors.purple,
    'tata.gif': Colors.pink,
    'van.gif': Colors.brown
  };
  @override
  Widget build(BuildContext context) {
    //-----GRADIENT-----
    // return new Scaffold(
    //   body: Container(
    //     decoration: new BoxDecoration(
    //         gradient: new LinearGradient(
    //             begin: FractionalOffset.topCenter,
    //             end: FractionalOffset.bottomCenter,
    //             colors: [
    //           Colors.white,
    //           Colors.purpleAccent,
    //           Colors.deepPurple
    //         ])),
    //   ),
    // );

    //-----PAGEVIEW-----
    timeDilation = 5.0;
    return new Scaffold(
      body: Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                Colors.white,
                Colors.purpleAccent,
                Colors.deepPurple
              ])),
          child: new PageView.builder(
            controller: new PageController(viewportFraction: 0.8),
            itemCount: gambar.length,
            itemBuilder: (BuildContext context, int index) {
              return new Padding(
                padding:
                    new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: new Material(
                  elevation: 8.0,
                  child: new Stack(
                    fit: StackFit.expand,
                    children: [
                      new Hero(
                          tag: gambar[index],
                          child: new Material(
                            child: new InkWell(
                              child: new Flexible(
                                  flex: 1,
                                  child: Container(
                                    color: colors.values.elementAt(index),
                                    child: new Image.asset(
                                      'assets/images/${gambar[index]}',
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              onTap: () => Navigator.of(context)
                                  .push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new HalamanDua(
                                  gambar: gambar[index],
                                  colors: colors.values.elementAt(index),
                                ),
                              )),
                            ),
                          ))
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}

class HalamanDua extends StatefulWidget {
  HalamanDua({required this.gambar, required this.colors});
  final String gambar;
  final Color colors;

  @override
  State<HalamanDua> createState() => _HalamanDuaState();
}

class _HalamanDuaState extends State<HalamanDua> {
  Color warna = Colors.grey;

  void _pilihannya(Pilihan pilihan) {
    setState(() {
      warna = pilihan.warna;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BT21'),
        backgroundColor: Colors.purpleAccent,
        actions: <Widget>[
          new PopupMenuButton<Pilihan>(
            onSelected: _pilihannya,
            itemBuilder: (BuildContext context) {
              return listPilihan.map((Pilihan pilihan) {
                return new PopupMenuItem<Pilihan>(
                  child: new Text(pilihan.teks),
                  value: pilihan,
                );
              }).toList();
            },
          )
        ],
      ),
      body: new Stack(
        children: [
          new Container(
              decoration: new BoxDecoration(
                  gradient: new RadialGradient(
            center: Alignment.center,
            colors: [Colors.purple, Colors.white, Colors.deepPurple],
          ))),
          new Center(
            child: new Hero(
              tag: widget.gambar,
              child: new ClipOval(
                child: new SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: new Material(
                    child: new InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: new Flexible(
                        flex: 1,
                        child: Container(
                          child: new Image.asset(
                            'assets/images/${widget.gambar}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Pilihan {
  const Pilihan({required this.teks, required this.warna});
  final String teks;
  final Color warna;
}

List<Pilihan> listPilihan = const <Pilihan>[
  const Pilihan(teks: "Red", warna: Colors.red),
  const Pilihan(teks: "Green", warna: Colors.green),
  const Pilihan(teks: "Blue", warna: Colors.blue),
];
