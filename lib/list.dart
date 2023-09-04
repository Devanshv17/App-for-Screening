import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<String> companyList = [];

  @override
  void initState() {
    super.initState();
    fetchCompanies();
  }

  Future<void> fetchCompanies() async {
    final response = await http.get(
        Uri.parse('https://fakerapi.it/api/v1/companies?_seed=12456'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> companies = data['data'] as List<dynamic>;

      final List<String> companyNames = [];
      for (final company in companies) {
        companyNames.add(company['name']);
      }

      setState(() {
        companyList = companyNames;
      });
    } else {
      throw Exception('Failed to load companies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company List'),
      ),
      body: ListView.builder(
        itemCount: companyList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(companyList[index]),
          );
        },
      ),
    );
  }
}
