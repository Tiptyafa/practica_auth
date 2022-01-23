import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';

class ScrPizza extends StatefulWidget {
  const ScrPizza({Key? key}) : super(key: key);

  @override
  _ScrPizzaState createState() => _ScrPizzaState();

}

enum Sauce {hot, sweet, cheese}

class _ScrPizzaState extends State<ScrPizza> {
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
    return MaterialApp(
      home: Scaffold(
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
             SizedBox(height: 5,),
             Text('Калькулятор пиццы',
             style: TextStyle(fontSize: 25, color: Color.fromRGBO(0, 0, 0, 1),
               ),),
             SizedBox(height: 9,),
             Text('Выберите параметры:',
             style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 1),
                ),),
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
                   colorOff: const Color(0xffFFFFFF),
                   colorOn: const Color(0xf0FFFFFF),
                   background: const Color (0xffECEFF1),
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
               child: const Text("Размер:",
               style: TextStyle(fontSize:16, color: Color.fromRGBO(0, 0, 0, 1))),
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
               child: const Text("Соус:",
                   style: TextStyle(fontSize:16, color: Color.fromRGBO(0, 0, 0, 1))),
             ),

             RadioListTile<Sauce>(
               title: const Text('Острый'),
               value: Sauce.hot,
               groupValue: _sauce,
               onChanged: _onSauceChanged,
               visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
             ),

             RadioListTile<Sauce>(
               title: const Text('Кисло-сладкий'),
               value: Sauce.sweet,
               groupValue: _sauce,
               onChanged: _onSauceChanged,
               visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
             ),

             RadioListTile<Sauce>(
               title: const Text('Сырный'),
               value: Sauce.cheese,
               groupValue: _sauce,
               onChanged: _onSauceChanged,
               visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
             ),
             SizedBox(
               width: 300,
               child: Card(
                 elevation: 0,
                 color: Color (0xFFF0F0F0),
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
                     const Text ('Дополнительный сыр',
                     style: TextStyle(fontSize:16, color: Color.fromRGBO(0, 0, 0, 1))),
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
               child: const Text("Стоимость:",
                   style: TextStyle(fontSize:16, color: Color.fromRGBO(0, 0, 0, 1))),
             ),
             SizedBox(
               width: 300,
               height: 35,

               child: Card (
                elevation: 0,
                color: const Color (0xFFF0F0F0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
                child: Text ("${_calcCost()} руб. ",
                  style: const TextStyle (fontSize: 20, color: Color(0xff0000000)),
                  textAlign: TextAlign.center,
                ),
               ),
             ),
             SizedBox(height: 10,),
             SizedBox(width: 154, height: 40,
               child:
               ElevatedButton(onPressed: () {},
                child: Text('Заказать'),
                style: ElevatedButton.styleFrom(
                 primary: Color(0xff0079D0),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(22.0),
                 ),
               ),
             ),
             ),
           ],)
          ),
        ),
      ),
    );
  }
}




