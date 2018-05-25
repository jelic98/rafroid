import 'package:flutter/material.dart';
import 'package:rafpored/core/res.dart' as Res;
import 'package:rafpored/core/routes.dart';
import 'package:rafpored/controller/filter/filter.dart';
import 'package:rafpored/view/common/filter_widget.dart';

class ListBar extends StatefulWidget {

  final _ListBarState _state;

  ListBar(String title, Filter filter) : _state = _ListBarState(title, filter);

  @override
  _ListBarState createState() => _state;
}

class _ListBarState extends State<ListBar> {

  String _title;
  Filter _filter;
  Widget _filterButton;

  _ListBarState(this._title, this._filter);

  @override
  void initState() {
    super.initState();
    _updateButton(true);
  }

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return Material(
      elevation: Res.Dimens.barElevation,
      child: Container(
        padding: EdgeInsets.only(top: statusbarHeight),
        height: statusbarHeight + Res.Dimens.barHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () => Routes.navigate(context, "/calendar", true),
              icon: Icon(Icons.event),
              color: Res.Colors.barIcon,
            ),
            Text(
              _title,
              style: Res.TextStyles.barTitle,
            ),
            _filterButton
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Res.Colors.primaryDark, Res.Colors.primaryLight],
          ),
        ),
      )
    );
  }

  _setFilterVisible(bool visible) {
    setState(() {
      _updateButton(visible);
    });
  }

  _updateButton(bool visible) {
    _filterButton = Opacity(
      // I'm here only to center the title
      opacity: (visible) ? 1.0 : 0.0,
      child: IconButton(
        onPressed: (visible) ? () => _buildFilters(context) : () => null,
        icon: Icon(Icons.search),
        color: Res.Colors.barIcon,
      ),
    );
  }

  _buildFilters(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => FilterWidget(_filter, _setFilterVisible),
    );
  }
}