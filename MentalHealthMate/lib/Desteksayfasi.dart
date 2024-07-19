import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PsikolojikDestekSayfasi extends StatefulWidget {
  @override
  _PsikolojikDestekSayfasiState createState() => _PsikolojikDestekSayfasiState();
}

class _PsikolojikDestekSayfasiState extends State<PsikolojikDestekSayfasi> {
  final TextEditingController _controller = TextEditingController();
  String? _response;
  bool _isLoading = false;

  Future<void> getAISolution(String issue) async {
    setState(() {
      _isLoading = true;
    });

    final apiKey = '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';
    final url = 'https://api.groq.com/openai/v1/chat/completions';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: json.encode({"messages": [{"role": "user", "content": "Give me some alternative solutions for the following psychological issue$issue"}], "model": "llama3-8b-8192"
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        setState(() {
          _response = responseData['choices']?[0]?['message']?['content'] ?? "";
        });
      } else {
        setState(() {
          _response = 'Failed to get response from AI: ${response.statusCode} ${response.body}';
        });
      }
    } catch (e) {
      setState(() {
        _response = 'An error occurred: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Psikolojik Destek Sayfası'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Psikolojik sıkıntınızı tanımlayın',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : () {
                if (_controller.text.isNotEmpty) {
                  getAISolution(_controller.text);
                }
              },
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Text('Alternatif Çözümleri Al'),
            ),
            SizedBox(height: 20),
            if (_response != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    _response!,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
