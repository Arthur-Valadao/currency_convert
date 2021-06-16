import 'package:conversor_project/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<CurrencyModel> currencies;

  final TextEditingController toText;
  final TextEditingController fromText;

  CurrencyModel toCurrency;
  CurrencyModel fromCurrency;

  HomeController({this.toText, this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text) ?? 1.0;
    double valueTotal = 0;

    if (fromCurrency.name == 'Real') {
      valueTotal = value * toCurrency.real;
    } else if (fromCurrency.name == 'Dolar') {
      valueTotal = value * toCurrency.dolar;
    } else if (fromCurrency.name == 'Euro') {
      valueTotal = value * toCurrency.euro;
    } else if (fromCurrency.name == 'Bitcoin') {
      valueTotal = value * toCurrency.bitcoin;
    }

    fromText.text = valueTotal.toStringAsFixed(2);
  }
}
