import 'profile_icons.dart';
import 'package:flutter/material.dart';

import 'supplemental/cut_corners_border.dart';
import 'constants.dart';
import 'quick_tag_actions.dart';

class EditTagPage extends StatefulWidget {
  @override
  EditTagPageState createState() => EditTagPageState();
}

class EditTagPageState extends State<EditTagPage> {
  final _tagNameController = TextEditingController();
  final _tagTypeController = TextEditingController();
  final _tagDescriptionController = TextEditingController();
  final _tagName = GlobalKey(debugLabel: 'Tag Name');
  final _tagType = GlobalKey(debugLabel: 'Tag Type');
  final _tagDescription = GlobalKey(debugLabel: 'Tag Description');
  int _colorIndex = 0;
  List<String> tagTypes = ["Tag Type", "User Related", "Project Related"];
  List<String> ages = ["Age"] + new List<String>.generate(20, (int index) => (index * 5 + 5).toString());
  List<String> symbol = ["Symbol", "  =  ", "  >  ", "  >=  ", "  <=  ", "  <  "];
  List<String> symbol2 = ["Symbol", "  =  "];
  List<String> menu = ["Menu", "Age", "Sex"];
  List<String> sex = ["Sex", "Male", "Female"];
  List<DropdownMenuItem> _tagTypeMenuItems, _ageMenuItems, _symbolMenuItems, _symbol2MenuItems, _menuMenuItems, _sexMenuItems;
  String _tagTypeValue, _ageValue, _symbolValue, _symbol2Value, _menuValue, _sexValue;


  @override
  void initState() {
    super.initState();
    _createDropdownMenuItems(3, tagTypes);
    _createDropdownMenuItems(4, menu);
    _createDropdownMenuItems(5, ages);
    _createDropdownMenuItems(6, sex);
    _createDropdownMenuItems(7, symbol);
    _createDropdownMenuItems(8, symbol2);
    _setDefaults();
    _setUserTypeDefaults();
    _setMenuDefaults(5);
    _setMenuDefaults(6);
    _setMenuDefaults(7);
  }

  /// Creates fresh list of [DropdownMenuItem] widgets, given a list of [Unit]s.
  void _createDropdownMenuItems(int idx, List<String> list) {
    var newItems = <DropdownMenuItem>[];
    for (var unit in list) {
      newItems.add(DropdownMenuItem(
        value: unit,
        child: Container(
          child: Text(
            unit,
            softWrap: true,
          ),
        ),
      ));
    }
    setState(() {
      if(idx == 3) { //if location drop down
        _tagTypeMenuItems = newItems;
      } else if (idx == 4){
        _menuMenuItems = newItems;
      }else if (idx == 5){
        _ageMenuItems = newItems;
      }else if (idx == 6){
        _sexMenuItems = newItems;
      }else if (idx == 7) {
        _symbolMenuItems = newItems;
      }else if (idx == 8) {
        _symbol2MenuItems = newItems;
      }
    });
  }

  /// Sets the default values for the 'from' and 'to' [Dropdown]s, and the
  /// updated output value if a user had previously entered an input.
  void _setDefaults() {
    setState(() {
      _tagTypeValue = tagTypes[0];
    });
  }

  void _setUserTypeDefaults() {
    setState(() {
      _menuValue = menu[0];
    });
  }
  void _setMenuDefaults(int idx){
//    _setUserTypeDefaults();
    if (idx == 5){
      _ageValue = ages[0];
    }else if (idx == 6){
      _sexValue = sex[0];
    }
    _symbolValue = symbol[0];
    _symbol2Value = symbol2[0];
  }

  Widget _createDropdown(int idx, String currentValue, ValueChanged<dynamic>

  onChanged)

  {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        // This sets the color of the [DropdownButton] itself
        color: TodoColors.baseColors[_colorIndex],
        border: Border.all(
          color: TodoColors.baseColors[_colorIndex],
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Theme(
        // This sets the color of the [DropdownMenuItem]
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey[50],
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: currentValue,
            items: (idx == 3)?_tagTypeMenuItems: (idx == 4) ? _menuMenuItems : (idx == 5) ? _ageMenuItems : (idx == 6) ? _sexMenuItems : (idx == 7) ?_symbolMenuItems:_symbol2MenuItems,
            onChanged: onChanged,
            style: TodoColors.textStyle2,
          ),
        ),
      ),
    );
  }

  void _updateTagTypeValue(dynamic name) {
    setState(() {
      _tagTypeValue = name;
    });
  }

  void _updateMenuValue(dynamic name) {
    setState(() {
      _menuValue = name;
    });
  }

  void _updateAgeValue(dynamic name) {
    setState(() {
      _ageValue = name;
    });
  }

  void _updateSexValue(dynamic name) {
    setState(() {
      _sexValue = name;
    });
  }

  void _updateSymbolValue(dynamic name) {
    setState(() {
      _symbolValue = name;
    });
  }

  void _updateSymbol2Value(dynamic name) {
    setState(() {
      _symbol2Value = name;
    });
  }

   Widget _createMenuAndSymbol(){
    return new Container(
      child: Row(
     children: <Widget>[
       _createDropdown(4, _menuValue, _updateMenuValue),
       SizedBox(width: 10.0,),
       (_menuValue == "Age") ?
       _createDropdown(7, _symbolValue, _updateSymbolValue): _createDropdown(8, _symbol2Value, _updateSymbol2Value),
       SizedBox(width: 10.0,),
       (_menuValue == "Age" || _menuValue == "Menu" ) ?
       _createDropdown(5, _ageValue, _updateAgeValue):
       (_menuValue == "Sex") ?
       _createDropdown(6, _sexValue, _updateSexValue): new Container(),
      ],
      ),
     );
  }

  @override
  Widget build(BuildContext context) {
    final converter = ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        children: <Widget>[
          new QuickTagActions(),

          SizedBox(height: 20.0),
          Column(
            children: <Widget>[
              Image.asset('assets/diamond.png'),
              SizedBox(height: 16.0),
              Text(
                'Create A New Tag',
                style: TodoColors.textStyle.apply(color: TodoColors.baseColors[_colorIndex]),
              ),
            ],
          ),

          SizedBox(height: 12.0),
          PrimaryColorOverride(
            color: TodoColors.baseColors[_colorIndex],
            child: TextField(
              key: _tagName,
              controller: _tagNameController,
              decoration: InputDecoration(
                labelText: 'Tag Name',
                border: CutCornersBorder(),
              ),
            ),
          ),

          const SizedBox(height: 12.0),
          _createDropdown(3, _tagTypeValue, _updateTagTypeValue),

    (_tagTypeValue == "User Related") ?
    _createMenuAndSymbol():new Container(),

          const SizedBox(height: 12.0),
          PrimaryColorOverride(
            color: TodoColors.baseColors[_colorIndex],
            child: TextField(
              key: _tagDescription,
              controller: _tagDescriptionController,
              decoration: InputDecoration(
                labelText: 'Tag Description',
                border: CutCornersBorder(),
              ),
            ),
          ),

          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text('CANCEL'),
                textColor: TodoColors.baseColors[_colorIndex],
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                onPressed: () {
                  _tagNameController.clear();
                  _tagTypeController.clear();
                  _tagDescriptionController.clear();
                },
              ),
              RaisedButton(
                child: Text('CREATE'),
                textColor: TodoColors.baseColors[_colorIndex],
                elevation: 8.0,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                onPressed: () {
                  if (_tagNameController.value.text.trim() != "" &&
                      _tagTypeController.value.text.trim() != "" &&
                      _tagDescriptionController.value.text.trim() != "") {
                    showInSnackBar(
                        "Tag Created Successfully", TodoColors.accent);
                  } else {
                    showInSnackBar("Please Specify A Value For All Fields",
                        Colors.redAccent);
                  }
                },
              ),
            ],
          ),
        ]);

    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.portrait) {
          return converter;
        } else {
          return Center(
            child: Container(
              width: 450.0,
              child: converter,
            ),
          );
        }
      },
    );
  }

  void showInSnackBar(String value, Color c) {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text(value),
      backgroundColor: c,
    ));
  }
}

class PrimaryColorOverride extends StatelessWidget {
  const PrimaryColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(primaryColor: color),
    );
  }
}