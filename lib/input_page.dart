import 'package:flutter/material.dart';
import 'package:flutter_dan_bmi_calculator/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';



class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {male, female}

class _InputPageState extends State<InputPage> {

  Gender activeGender = Gender.male;
  int height = 180;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: ReusableCard(
                    color: Gender.male == activeGender ? kActiveCardColor : kInactiveCardColor,
                    cardChild: IconContent(iconData: FontAwesomeIcons.mars, label: 'MALE'),
                    onPress: () { setState(() {activeGender = Gender.male;});}),),
                Expanded(child: ReusableCard(
                  color: Gender.female == activeGender ? kActiveCardColor : kInactiveCardColor,
                  cardChild: IconContent(iconData: FontAwesomeIcons.venus, label: 'FEMALE'),
                  onPress: () { setState(() {activeGender = Gender.female;});}),),
              ],
            ),
          ),
          Expanded(child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kLabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle,),
                      Text('cm', style: kLabelTextStyle,),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                        min: 120, max: 250, value: height.toDouble(),
                        onChanged: (double newHeight) {
                          setState((){
                            height = newHeight.round();
                          });
                        },
                    ),
                  ),
                ],
              ),
              onPress: (){})
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: ReusableCard(color: kActiveCardColor, cardChild: Container(), onPress: (){})),
                Expanded(child: ReusableCard(color: kActiveCardColor, cardChild: Container(), onPress: (){}))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
