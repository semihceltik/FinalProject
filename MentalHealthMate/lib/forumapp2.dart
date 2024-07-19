import 'package:flutter/material.dart';

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  final List<Map<String, dynamic>> _posts = [];
  final TextEditingController _postController = TextEditingController();
  final Map<int, TextEditingController> _commentControllers = {};

  void _addPost(String post) {
    setState(() {
      _posts.add({'post': post, 'comments': []});
      _postController.clear();
    });
  }

  void _addComment(int index, String comment) {
    setState(() {
      _posts[index]['comments'].add(comment);
      _commentControllers[index]?.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forum Sayfası'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _postController,
                decoration: InputDecoration(
                  labelText: 'Bir gönderi oluşturun',
                  prefixIcon: Icon(Icons.edit),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      if (_postController.text.isNotEmpty) {
                        _addPost(_postController.text);
                      }
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  final post = _posts[index];
                  _commentControllers[index] = TextEditingController();

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.deepPurple,
                                child: Icon(Icons.person, color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Adem Semih ÇELTİK',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                  Text(
                                    post['post'],
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          ...post['comments'].map<Widget>((comment) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.deepPurple,
                                    child: Icon(Icons.person, color: Colors.white),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Adem Semih ÇELTİK',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurple,
                                        ),
                                      ),
                                      Text(comment),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          TextField(
                            cursorColor: Colors.deepPurple.shade100,
                            controller: _commentControllers[index],
                            decoration: InputDecoration(
                              labelText: 'Bir yorum ekle',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.send),
                                onPressed: () {
                                  if (_commentControllers[index]?.text?.isNotEmpty ?? false) {
                                    _addComment(index, _commentControllers[index]!.text);
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
