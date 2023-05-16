import 'dart:io';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enim_press/src/features/newsfeed/Pages/general_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Profil_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  get imageFile => null;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
// ignore: unused_element
late File? _imageFile;


void setState(Null Function() param0) {
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  get picker => null;
  
  get imageFile => null;
  


  @override
  Widget build(BuildContext context) {
// instanciation de ArticlesViewModel
        
    return DefaultTabController(
  length: 4,
  child: Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        "ENIM PRESS",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottom: TabBar(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: const Color.fromARGB(255, 226, 223, 223),
        ),
        isScrollable: true,
        tabs: const [
          Tab(
            child: Text(
              "General",
              style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          Tab(
            child: Text(
              "Scolaire",
              style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
          ),
          Tab(
            child: Text(
              "Parascolaire",
              style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          Tab(
            child: Text(
              "Profil",
              style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ],
      ),
    ),





       body: TabBarView(
          children: [
            GeneralScreen(),          
            const Text("Scolaire Screen"),
            const Text("Parascolaire Screen"),
             ProfileScreen(),
          ],
        ),





        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Ajouter un Article'),
                  content: Column(
                    children: [
                      TextField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          hintText: 'Titre',
                        ),
                      ),
                      TextField(
                        controller: _authorController,
                        decoration: const InputDecoration(
                          hintText: 'Auteur',
                        ),
                      ),
                      TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          hintText: 'Description',
                        ),
                      ),
                        
                      DropdownButtonFormField<String>(
                        value: _contentController.text.isNotEmpty ? _contentController.text : 'Scolaire',
                        items: const [
                          // ignore: sort_child_properties_last
                          DropdownMenuItem(child: Text('Scolaire'), value: 'Scolaire'),
                          // ignore: sort_child_properties_last
                          DropdownMenuItem(child: Text('Parascolaire'), value: 'Parascolaire'),
                        ],
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        onChanged: (value) {
                          setState(() {
                            _contentController.text = value!;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Genre Article',
                        ),
                      ),

const SizedBox(height: 16), //pour laisser l'espace entre les deux input

                       GestureDetector(
                          onTap: () async {
                            final pickedFile = await picker.getImage(source: ImageSource.gallery);
                            setState(() {
                              _imageFile = (pickedFile != null ? File(pickedFile.path as String) : null)!;

                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade400,
                                width: 1.0,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.image,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  imageFile == null ? 'Choose image' : 'Image selected',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Annuler'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //addArticleToFirebase(article);
                        Navigator.pop(context);
                      },
                      child: const Text('Ajouter'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }}
