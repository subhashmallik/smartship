import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/widgets/independent/clipped_card.dart';

class ShipmentDetails extends StatefulWidget{
  final int initNumber;
  final Function(int) counterCallback;
  final Function increaseCallback;
  final Function decreaseCallback;

  ShipmentDetails(
      {this.initNumber,
        this.counterCallback,
        this.increaseCallback,
        this.decreaseCallback});

  @override
  _ShipmentDetailsState createState() => _ShipmentDetailsState();
}

class _ShipmentDetailsState extends State<ShipmentDetails> {
  int _currentCount;
  Function _counterCallback;
  Function _increaseCallback;
  Function _decreaseCallback;

  @override
  void initState() {
    _currentCount = widget.initNumber ?? 1;
    _counterCallback = widget.counterCallback ?? (int number) {};
    _increaseCallback = widget.increaseCallback ?? () {};
    _decreaseCallback = widget.decreaseCallback ?? () {};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    child: Text(
                      'How much does your package weight ? ',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: AppColors.appOrangeLight),
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/images/info.svg",
                    color: AppColors.appLightGrey,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    width: 120,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.appBlue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _createIncrementDicrementButton(
                            Icons.remove, () => _dicrement()),
                        Text(_currentCount.toString()),
                        _createIncrementDicrementButton(
                            Icons.add, () => _increment()),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    width: 120,
                    padding: EdgeInsets.zero,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            flatTextButton("100 g", () => clickButton()),
                            flatTextButton("200 g", () => clickButton()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            flatTextButton("1.5 kg", () => clickButton()),
                            flatTextButton("2 kg", () => clickButton()),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Recommended Bundle',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: AppColors.appOrangeLight),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          flex: 1,
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: ClippedCard(
                              margin: EdgeInsets.all(5),
                              bgColor: AppColors.appRecBundle,
                              child: Container(
                                height: 100,
                                width: 100,
                                margin: EdgeInsets.only(top: 9),
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Row(
                                          children: [
                                            Text(
                                              '5',
                                              style: TextStyle(fontSize: 61),
                                            ),Text(
                                              'KG',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 22),
                                            ),
                                          ],
                                        )
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '5 kg',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _increment() {
    setState(() {
      _currentCount++;
      _counterCallback(_currentCount);
      _increaseCallback();
    });
  }

  void _dicrement() {
    setState(() {
      if (_currentCount > 1) {
        _currentCount--;
        _counterCallback(_currentCount);
        _decreaseCallback();
      }
    });
  }

  Widget _createIncrementDicrementButton(IconData icon, Function onPressed) {
    return Align(
      alignment: Alignment.topLeft,
      child: RawMaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        constraints: BoxConstraints(minWidth: 42.0, minHeight: 42.0),
        onPressed: onPressed,
        elevation: 2.0,
        fillColor: AppColors.appLightGrey,
        child: Icon(
          icon,
          color: AppColors.black,
          size: 12.0,
        ),
        shape: CircleBorder(),
      ),
    );
  }

  Widget flatTextButton(String text, Function onPress) {
    return FlatButton(
      onPressed: onPress,
      minWidth: 55,
      padding: EdgeInsets.all(3),
      color: AppColors.appBlueLight,
      child: Text(text),
    );
  }

  clickButton() {
    print('data');
  }
}