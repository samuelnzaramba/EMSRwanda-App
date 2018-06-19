import 'package:flutter/material.dart';
import 'supplemental/cut_corners_border.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'constants.dart';
import 'user_history_page.dart';

import 'user_rating_page.dart';

class ViewUsersPage extends StatefulWidget {
  final int colorIndex;

  const ViewUsersPage({
    @required this.colorIndex,
  }) : assert(colorIndex != null);

  @override
  ViewUsersPageState createState() => ViewUsersPageState();
}

class ViewUsersPageState extends State<ViewUsersPage> {

  @override
  Widget build(BuildContext context) {
    final _bkey = GlobalKey(debugLabel: 'Back Key');
    final _userNameController = TextEditingController();
    final _userName = GlobalKey(debugLabel: 'User Name');
    final _userRoleController = TextEditingController();
    final _userRole = GlobalKey(debugLabel: 'User Role');
    final _userStatusController = TextEditingController();
    final _userStatus = GlobalKey(debugLabel: 'User Status');
    final _userLocationsController = TextEditingController();
    final _tagsController = TextEditingController();
    final _userLocations = GlobalKey(debugLabel: 'Users Locations');
    final _tags = GlobalKey(debugLabel: 'Project or User Related Tags');

    return Scaffold
      (
        appBar: AppBar
          (
          leading: new BackButton(key: _bkey, color: Colors.black,),
          elevation: 2.0,
          backgroundColor: Colors.white,
          title: Text('Search Results', style: TodoColors.textStyle6),
          actions: <Widget>
          [
            Container
              (
              margin: EdgeInsets.only(right: 8.0),
              child: Row
                (
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [

                  new FloatingActionButton(
                    elevation: 200.0,
                    child: new Icon(Icons.search),
                    backgroundColor: TodoColors.baseColors[widget.colorIndex],
                    onPressed: () {
                      new Container(
                        width: 450.0,
                      );

                      showDialog<Null>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return new AlertDialog(
                            title: new Text(
                              'Search  Users To Update', style: TodoColors.textStyle.apply(color: TodoColors.baseColors[widget.colorIndex]),),
                            content: new SingleChildScrollView(
                              child: new ListBody(
                                children: <Widget>[
                                  SizedBox(height: 12.0),
                              PrimaryColorOverride(
                                color: TodoColors.baseColors[widget.colorIndex],
                                child: TextField(
                                    key: _userName,
                                    controller: _userNameController,
                                    decoration: InputDecoration(
                                      labelText: 'User Name',
                                      labelStyle: TodoColors.textStyle2,
                                      border: CutCornersBorder(),
                                    ),
                                  ),
                              ),
                                  SizedBox(height: 12.0),
                              PrimaryColorOverride(
                                color: TodoColors.baseColors[widget.colorIndex],
                                child: TextField(
                                    key: _userRole,
                                    controller: _userRoleController,
                                    decoration: InputDecoration(
                                      labelText: 'User Role',
                                      labelStyle: TodoColors.textStyle2,
                                      border: CutCornersBorder(),
                                    ),
                                  ),
                              ),
                                  SizedBox(height: 12.0),
                              PrimaryColorOverride(
                                color: TodoColors.baseColors[widget.colorIndex],
                                child: TextField(
                                    key: _userStatus,
                                    controller: _userStatusController,
                                    decoration: InputDecoration(
                                      labelText: 'User Status',
                                      labelStyle: TodoColors.textStyle2,
                                      border: CutCornersBorder(),
                                    ),
                                  ),
                              ),
                                  SizedBox(height: 12.0),
                              PrimaryColorOverride(
                                color: TodoColors.baseColors[widget.colorIndex],
                                child: TextField(
                                    key: _userLocations,
                                    controller: _userLocationsController,
                                    decoration: InputDecoration(
                                      labelText: 'User Location',
                                      labelStyle: TodoColors.textStyle2,
                                      border: CutCornersBorder(),
                                    ),
                                  ),
                              ),
                                  RaisedButton(
                                    child: Text('ADD LOCATION'),
                                    textColor: TodoColors.baseColors[widget.colorIndex],
                                    elevation: 8.0,
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(7.0)),
                                    ),
                                    onPressed: () {},
                                  ),
                                  SizedBox(height: 12.0),
                              PrimaryColorOverride(
                                color: TodoColors.baseColors[widget.colorIndex],
                                child: TextField(
                                    key: _tags,
                                    controller: _tagsController,
                                    decoration: InputDecoration(
                                      labelText: 'Project or User Related Tags',
                                      labelStyle: TodoColors.textStyle2,
                                      border: CutCornersBorder(),
                                    ),
                                  ),
                              ),
                                  RaisedButton(
                                    child: Text('ADD TAG'),
                                    textColor: TodoColors.baseColors[widget.colorIndex],
                                    elevation: 8.0,
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(7.0)),
                                    ),
                                    onPressed: () {},
                                  ),
                                  SizedBox(height: 12.0,),
                                ],
                              ),

                            ),

                            actions: <Widget>[
                              FlatButton(
                                child: Text('CANCEL'),
                                textColor: TodoColors.baseColors[widget.colorIndex],
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(7.0)),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),

                              RaisedButton(
                                child: Text('SEARCH'),
                                elevation: 8.0,
                                textColor: TodoColors.baseColors[widget.colorIndex],
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(7.0)),
                                ),
                                onPressed: () {},
                              ),

                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: <Widget>[
            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(24.0),
                child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('Kigali',
                              style: TextStyle(color: TodoColors.baseColors[widget.colorIndex])),
                          Text('Erin Niamkey', style: TodoColors.textStyle6)
                        ],
                      ),
                      Material
                        (
                          color: TodoColors.baseColors[widget.colorIndex],
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center
                            (
                              child: Padding
                                (
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.timeline, color: Colors.white,
                                    size: 30.0),
                              )
                          )
                      )
                    ]
                ),
              ),
            ),
            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(24.0),
                child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('Remera',
                              style: TextStyle(color: TodoColors.baseColors[widget.colorIndex])),
                          Text('Bernard Nshima', style: TodoColors.textStyle6)
                        ],
                      ),
                      Material
                        (
                          color: TodoColors.baseColors[widget.colorIndex],
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center
                            (
                              child: Padding
                                (
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.timeline, color: Colors.white,
                                    size: 30.0),
                              )
                          )
                      )
                    ]
                ),
              ),
            ),
            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(24.0),
                child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('Kacyiru',
                              style: TextStyle(color: TodoColors.baseColors[widget.colorIndex])),
                          Text('Celine Dion', style: TodoColors.textStyle6)
                        ],
                      ),
                      Material
                        (
                          color: TodoColors.baseColors[widget.colorIndex],
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center
                            (
                              child: Padding
                                (
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.timeline, color: Colors.white,
                                    size: 30.0),
                              )
                          )
                      )
                    ]
                ),
              ),
            ),
            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(24.0),
                child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('Kiyovu',
                              style: TextStyle(color: TodoColors.baseColors[widget.colorIndex])),
                          Text('Eric Niamkey', style: TodoColors.textStyle6)
                        ],
                      ),
                      Material
                        (
                          color: TodoColors.baseColors[widget.colorIndex],
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center
                            (
                              child: Padding
                                (
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.timeline, color: Colors.white,
                                    size: 30.0),
                              )
                          )
                      )
                    ]
                ),
              ),
            ),
            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(24.0),
                child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('Gaculiro',
                              style: TextStyle(color: TodoColors.baseColors[widget.colorIndex])),
                          Text('Kossi Koffi', style: TodoColors.textStyle6)
                        ],
                      ),
                      Material
                        (
                          color: TodoColors.baseColors[widget.colorIndex],
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center
                            (
                              child: Padding
                                (
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.timeline, color: Colors.white,
                                    size: 30.0),
                              )
                          )
                      )
                    ]
                ),
              ),
            ),
            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(24.0),
                child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('Kimironko',
                              style: TextStyle(color: TodoColors.baseColors[widget.colorIndex])),
                          Text('Anne Judith', style: TodoColors.textStyle6)
                        ],
                      ),
                      Material
                        (
                          color: TodoColors.baseColors[widget.colorIndex],
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center
                            (
                              child: Padding
                                (
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.timeline, color: Colors.white,
                                    size: 30.0),
                              )
                          )
                      )
                    ]
                ),
              ),
            ),
            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(24.0),
                child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('Kiyovu',
                              style: TextStyle(color: TodoColors.baseColors[widget.colorIndex])),
                          Text('Mariam Adah', style: TodoColors.textStyle6)
                        ],
                      ),
                      Material
                        (
                          color: TodoColors.baseColors[widget.colorIndex],
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center
                            (
                              child: Padding
                                (
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.timeline, color: Colors.white,
                                    size: 30.0),
                              )
                          )
                      )
                    ]
                ),
              ),
            ),
            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(24.0),
                child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('Gisenyi',
                              style: TextStyle(color: TodoColors.baseColors[widget.colorIndex])),
                          Text('Ali Jean', style: TodoColors.textStyle6)
                        ],
                      ),
                      Material
                        (
                          color: TodoColors.baseColors[widget.colorIndex],
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center
                            (
                              child: Padding
                                (
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.timeline, color: Colors.white,
                                    size: 30.0),
                              )
                          )
                      )
                    ]
                ),
              ),
            ),
            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(24.0),
                child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('Gaculiro',
                              style: TextStyle(color: TodoColors.baseColors[widget.colorIndex])),
                          Text('Micheal Jackson', style: TodoColors.textStyle6)
                        ],
                      ),
                      Material
                        (
                          color: TodoColors.baseColors[widget.colorIndex],
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center
                            (
                              child: Padding
                                (
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.timeline, color: Colors.white,
                                    size: 30.0),
                              )
                          )
                      )
                    ]
                ),
              ),
            ),
            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(24.0),
                child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('Remera',
                              style: TextStyle(color: TodoColors.baseColors[widget.colorIndex])),
                          Text('Ninegan Tchakpa', style: TodoColors.textStyle6)
                        ],
                      ),
                      Material
                        (
                          color: TodoColors.baseColors[widget.colorIndex],
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center
                            (
                              child: Padding
                                (
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.timeline, color: Colors.white,
                                    size: 30.0),
                              )
                          )
                      )
                    ]
                ),
              ),
            ),


          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 110.0),
          ],
        )
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell
          (
          // Do onTap() if it isn't null, otherwise do print()
            onTap: () =>
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => UserHistoryPage(colorIndex: widget.colorIndex,))),
            child: child
        )
    );
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