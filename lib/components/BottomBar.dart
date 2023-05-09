import 'package:flutter/material.dart';

class BottomBarItem {
	String icon;
	String label = '';
	bool? hasNotification = false;

	BottomBarItem({required this.icon, required this.label, this.hasNotification});
}

class BottomBar extends StatefulWidget {
	final ValueChanged<int>? onTabSelected;
	final List<BottomBarItem>? items;

	BottomBar({this.onTabSelected, this.items}) {
		assert(this.items!.length == 2 || this.items!.length == 4);
	}

	@override
	_BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
	int _selectedIndex = 0;

	void _updateIndex(int index) {
		widget.onTabSelected!(index);
		setState(() {
			_selectedIndex = index;
		});
	}

	Widget _buildTab({required int index, required BottomBarItem item, required ValueChanged<int> onPressed}) {
		return Expanded(
			child: SizedBox(
				height: 60.0,
				child: Material(
					type: MaterialType.transparency,
					child: InkWell(
						onTap: () => onPressed(index),
						child: item.hasNotification!
						? Stack(
							alignment: AlignmentDirectional.center,
							children: <Widget>[
								Column(
									mainAxisAlignment: MainAxisAlignment.center,
									children: [
										Image.asset(
											item.icon,
											color: _selectedIndex == index ? Color.fromRGBO(54, 161, 234, 1) : Color.fromRGBO(141, 156, 165, 1),
										),
										Text(
											item.label,
											style: TextStyle(
												color: _selectedIndex == index ? Color.fromRGBO(54, 161, 234, 1) : Color.fromRGBO(141, 156, 165, 1),
											),
										)
									],
								),
								const Positioned(
									top: 7.0,
									right: 33.0,
									child: Icon(
										Icons.brightness_1,
										color: Color.fromRGBO(255, 51, 71, 1),
										size: 8.0,
									),
								)
							],
						)
						: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								Image.asset(
									item.icon,
									color: _selectedIndex == index ? Color.fromRGBO(54, 161, 234, 1) : Color.fromRGBO(141, 156, 165, 1),
								),
								Text(
									item.label,
									style: TextStyle(
										color: _selectedIndex == index ? Color.fromRGBO(54, 161, 234, 1) : Color.fromRGBO(141, 156, 165, 1),
									),
								)
							],
						),
					),
				),
			),
		);
	}

	Widget _buildMiddleSeparator() {
		return Expanded(
			child: SizedBox(
				height: 60.0,
				child: Container(
					margin: const EdgeInsets.only(bottom: 4),
					decoration: const BoxDecoration(
						border: Border(
							bottom: BorderSide(width: 2.5, color: const Color.fromRGBO(47, 50, 52, 1))
						)
					),
				),
			),
		);
	}

	@override
	Widget build(BuildContext context) {
		List<Widget> items = List.generate(widget.items!.length, (int index) {
			return _buildTab(index: index, item: widget.items![index], onPressed: _updateIndex);
		});
		items.insert(items.length >> 1, _buildMiddleSeparator());

		return BottomAppBar(
			color: Colors.white,
			notchMargin: 5,
			elevation: 5,
			child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceAround,
				mainAxisSize: MainAxisSize.max,
				children: items,
			),
		);
	}
}