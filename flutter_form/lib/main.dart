import 'package:flutter/material.dart';

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
  

  List<String> agama = [
    "Islam",
    "Kristen Protenstan",
    "Kristen Katolik",
    "Hindu",
    "Buddha"
  ];
  String _agama = "Islam";
  String _jk = "";

  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  TextEditingController controllerMoto = new TextEditingController();

  void _pilihJk(String value) {
    setState(() {
      _jk = value;
    });
  }

  void pilihAgama(String value) {
    setState(() {
      _agama = value;
    });
  }

  void kirimdata() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Column(
          children: <Widget>[
            new Text("Nama Lengkap : ${controllerNama.text}"),
            new Text("Password : ${controllerPass.text}"),
            new Text("Moto Hidup : ${controllerMoto.text}"),
            new Text("Jenis Kelamin : ${_jk}"),
            new Text("Agama : ${_agama}"),
            new RaisedButton(
              child: new Text("OK"),
              onPressed: () => Navigator.pop(context),
              color: Color.fromARGB(255, 221, 49, 155),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

 @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.list),
        title: new Text("Data diri"),
        backgroundColor: Color.fromARGB(255, 146, 28, 93),
      ),
      body: new ListView(
        children: [
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                    hintText: "Nama Lengkap",
                    labelText: "Nama Lengkap",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    )
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextField(
                  controller: controllerPass,
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    )
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextField(
                  controller: controllerMoto,
                  maxLines: 3,
                  decoration: new InputDecoration(
                    hintText: "Moto Hidup",
                    labelText: "Moto Hidup",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    )
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new RadioListTile(value: "laki-laki", title: new Text("Laki-Laki"), groupValue: _jk, onChanged: (String? value) {
                  _pilihJk(value!);
                },
                activeColor: Color.fromARGB(255, 172, 23, 147),
                subtitle: new Text("Pilih ini jika anda laki-laki"),
                ),
                new RadioListTile(value: "perempuan",title: new Text("Perempuan"), groupValue: _jk, onChanged: (String? value) {
                  _pilihJk(value!);
                },
                activeColor: Color.fromARGB(255, 194, 54, 152),
                subtitle: new Text("Pilih ini jika anda perempuan"),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    new Text("Agama",
                    style: new TextStyle(fontSize: 18.0, color: Color.fromARGB(255, 238, 70, 168)),
                    ),
                    new Padding(padding: new EdgeInsets.only(left: 15.0),
                    ),
                    DropdownButton(onChanged: (String? value) {
                      pilihAgama(value!);
                    },
                    value: _agama,
                    items: agama.map((String value) {
                      return new DropdownMenuItem(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(), 
                    )
                  ],
                ),
                new RaisedButton(
                  child: new Text("OK"),
                  color: Color.fromARGB(255, 241, 69, 175),
                  onPressed: () {
                    kirimdata();
                  })
              ],
            ),
          )
        ],
      ),
    );
  }
}