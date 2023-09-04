import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LivePage extends StatefulWidget {
  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  String stockData = '';
  final String apiKey = 'LRFBK35739K89LIR'; // Replace with your Alpha Vantage API key
  final String stockSymbol = 'AAPL'; // Replace with the stock symbol you want to fetch data for

  @override
  void initState() {
    super.initState();
    fetchStockData();
  }

  Future<void> fetchStockData() async {
    final response = await http.get(
      Uri.parse('https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=$stockSymbol&interval=5min&apikey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

      setState(() {
        // Extract the relevant financial data from the API response
        final metaData = responseData['Meta Data'];
        final lastRefreshed = metaData['3. Last Refreshed'];
        final stockInfo = responseData['Time Series (5min)'][lastRefreshed];
        final openPrice = stockInfo['1. open'];
        final highPrice = stockInfo['2. high'];
        final lowPrice = stockInfo['3. low'];
        final closePrice = stockInfo['4. close'];

        stockData = 'Stock Symbol: $stockSymbol\nLast Refreshed: $lastRefreshed\nOpen Price: $openPrice\nHigh Price: $highPrice\nLow Price: $lowPrice\nClose Price: $closePrice';
      });
    } else {
      throw Exception('Failed to load stock data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Financial Data'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Real-Time Stock Data:\n$stockData',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25, // Increase the font size as needed
              ),
            ),
          ),
          SizedBox(height: 20), // Add spacing between the data and disclaimer
          Text(
            'Data provided by Alpha Vantage',
            style: TextStyle(
              fontSize: 12, // Adjust the font size as needed
              fontStyle: FontStyle.italic,
              color: Colors.grey, // You can customize the text color
            ),
          ),
        ],
      ),
    );
  }
}
