import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practica_1/untils/global_theme.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';

class ThemeApp extends StatelessWidget {
  const ThemeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
      home: PizzaScreen(),
    );
  }
}

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({Key? key}) : super(key: key);

  @override
  _PizzaScreenState createState() => _PizzaScreenState();
}

enum Sauce {hot, sweet, cheese}

class _PizzaScreenState extends State<PizzaScreen> {
  bool _isSlimDough = false;
  double _pizzaSize = 15;
  int _cost = 100;
  Sauce? _sauce = Sauce.hot;
  bool _addCheese = false;

  int _calcCost () {
    _cost = _pizzaSize.round() + 100;

    if (_isSlimDough == true) _cost += 30;
    if (_addCheese == true) _cost += 39;

    switch (_sauce){
      case Sauce.hot:
        _cost += 10;
        break;
      case Sauce.sweet:
        _cost += 20;
        break;
      case Sauce.cheese:
        _cost +=30;
        break;
      case null:
        _sauce = Sauce.hot;
        break;
    }
    return _cost;
  }

  void _onSauceChanged (Sauce? value){
    setState(() {
      _sauce = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
            child: Column (children: [
              SizedBox(height: 2,),
              Padding(
                padding: EdgeInsets.only(left: 88),
                child: SizedBox(width: 200, height: 100,child: Image(image: AssetImage('assets/12.png')),),
              ),
              const SizedBox(height: 5,),
              Text('Калькулятор пиццы', style: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.bodyText2)),
              SizedBox(height: 9,),
              Text('Выберите параметры:', style: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.bodyText1)),
              SizedBox(height: 8,),
              SizedBox(width: 300,
                child: SlidingSwitch(
                  value: false,
                  width: 300,
                  onChanged: (bool value) {
                    _isSlimDough = value;
                    setState(() {
                      _calcCost();
                    });
                  },
                  height: 30,
                  animationDuration: const Duration(milliseconds: 100),
                  onTap: () {},
                  onDoubleTap: () {},
                  onSwipe: () {},
                  textOff: "Обычное тесто",
                  textOn: "Тонкое тесто",
                  colorOff: Theme.of(context).colorScheme.primaryVariant,
                  colorOn: Theme.of(context).colorScheme.primaryVariant,
                  background: Theme.of(context).colorScheme.secondary,
                  buttonColor: const Color (0xff0079D0),
                  inactiveColor: const Color (0xff636f7b),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top:20, left: 20),
                child: Text("Размер:",
                    style: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.bodyText1)),
              ),
              SizedBox(
                  width: 300,
                  child: SfSlider(
                    min: 15,
                    max: 45,
                    value: _pizzaSize,
                    interval: 15,
                    showTicks: true,
                    showLabels: true,
                    numberFormat: NumberFormat ("## см"),
                    enableTooltip: false,
                    minorTicksPerInterval: 0,
                    stepSize: 15,
                    onChanged: (dynamic value) {
                      setState(() {
                        _pizzaSize = value;
                        _calcCost ();
                      });
                    },
                  )),
              const SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top:10, left: 20),
                child: Text("Соус:",
                    style: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.bodyText1)),
              ),

              RadioListTile<Sauce>(
                title: Text('Острый', style: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.headline4)),
                value: Sauce.hot,
                groupValue: _sauce,
                onChanged: _onSauceChanged,
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
              ),

              RadioListTile<Sauce>(
                title: Text('Кисло-сладкий', style: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.headline4)),
                value: Sauce.sweet,
                groupValue: _sauce,
                onChanged: _onSauceChanged,
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
              ),

              RadioListTile<Sauce>(
                title: Text('Сырный', style: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.headline4)),
                value: Sauce.cheese,
                groupValue: _sauce,
                onChanged: _onSauceChanged,
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
              ),
              SizedBox(
                width: 300,
                child: Card(
                  elevation: 0,
                  color: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20
                        ),
                        child: SizedBox (
                          width: 38,
                          height: 35,
                          child: Image.asset('assets/13.png'),
                        ) ,
                      ),
                      Text ('Дополнительный сыр',
                          style: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.bodyText1)),
                      Switch(
                        value: _addCheese,
                        onChanged: (bool value) {
                          setState(() {
                            _addCheese = value;
                            _calcCost();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top:10, left: 20),
                child: Text("Стоимость:",
                    style: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.bodyText1)),
              ),
              SizedBox(
                width: 300,
                height: 35,

                child: Card (
                  elevation: 0,
                  color: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text ("${_calcCost()} руб. ",
                    style: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.bodyText1),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(width: 154, height: 25,
                child:
                ElevatedButton(onPressed: () {},
                  child: Text('Заказать'),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                  ),
                ),
              ),
            ],)
        ),
      ),
    );
  }
}
