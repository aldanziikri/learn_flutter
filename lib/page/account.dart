import 'package:flutter/material.dart';

void main() => runApp(const Profil());

class Profil extends StatefulWidget {
  const Profil({super.key});
  

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final _formKey = GlobalKey<FormState>();
  String nama = "";
  String email = "";
  int? kelas;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nama",
                    labelStyle: TextStyle(color: Colors.indigo),
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    border: OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return "Nama tidak boleh kosong!";
                    }
                    return null;
                  },
                  onSaved: (value) => nama = value!,
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.indigo),
                    labelText: "Email",
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    border: OutlineInputBorder()
      
            
                  ),
            
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return "Email tidak boleh kosong!";
                    }
                    else if (!value.contains("@")){
                      return "Email tidak valid!";
                    }
                    return null;
                  },
                  onSaved: (value) => email = value!,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Kelas :", style: TextStyle(fontSize: 18, color: Colors.indigo),),
                      RadioListTile(
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
                    visualDensity: VisualDensity.compact,
                    title: Text("10"),
                    value: 10, 
                    groupValue: kelas,
                    onChanged: (value) {
                      setState(() {
                        kelas = value;
                      });
                    },
                    ),
                  RadioListTile(
                    dense: true,
                  
                    contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
                    visualDensity: VisualDensity.compact,
                    title: Text("11"),
                    value: 11, 
                    groupValue: kelas,
                    onChanged: (value) {
                      setState(() {
                        kelas = value;
                      });
                    },
                    ),
                  RadioListTile(
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
                    visualDensity: VisualDensity.compact,
                    title: Text("12"),
                    value: 12, 
                    groupValue: kelas,
                    onChanged: (value) {
                      setState(() {
                        kelas = value;
                      });
                    },
                    ),
                    ],
                  ),
                ),
                
      
      
                SizedBox(height: 30),
      
                DropdownButtonFormField(
                decoration: InputDecoration(
                labelText: "Jenis Kelamin",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        ),
                items: ["Laki-Laki", "Perempuan"].map((value){
                  return DropdownMenuItem (
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return "Pilih gender anda";
                  }
                  return null;
                } ,
                onChanged: (value) => setState(() {
                  gender = value;
                }),
                 onSaved: (value) => gender = value,
                ),
      
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save(); // menyimpan value
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Data berhasil disimpan:\nNama: $nama\nEmail: $email \nKelas: $kelas\nGender: $gender')),
                        );
                      }
                    },
                    child: Text('Submit'),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}