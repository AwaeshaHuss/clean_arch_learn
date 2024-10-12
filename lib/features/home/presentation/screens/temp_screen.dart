import 'package:clean_arch_learn/core/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// this [TempScreen] is used to as a temp area where I moclk new features before adding them to the app

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var purple = Colors.deepPurple.withOpacity(.25);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              clipBehavior: Clip.none,
              children: [
                Container(
              width: MediaQuery.sizeOf(context).width,
              height: 325,
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(22.0),
                  bottomLeft: Radius.circular(22.0)
                ),
              ),
              ),
                Positioned(
                  right: 12,
                  bottom: -32,
                  child: SizedBox(
                    width: 150,
                    height: 185,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(22.0)),
                      child: Image.network('https://images.pexels.com/photos/2102416/pexels-photo-2102416.jpeg', fit: BoxFit.fill))),
                )
              ],
            ),
            36.height,
            Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                          child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    12.height,
                    TextFieldWithDropdown(color: purple, title: 'Email'),
                    32.height,
                    TextFieldWithDropdown(color: purple, title: 'Name'),
                    32.height,
                    TextFieldWithDropdown(color: purple, title: 'Address'),
                   ],
                   ),
                  ),
                ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    12.height,
                    TextFieldWithDropdown(color: purple, title: 'Phone'),
                    32.height,
                    TextFieldWithDropdown(color: purple, title: 'Sir Name'),
                    32.height,
                    TextFieldWithDropdown(color: purple, title: 'Age'),
                  ],
                ),
              ),
            ),
              ],
            ),
            36.height,
            FloatingActionButton.extended(
                  elevation: 0,
                  extendedPadding: kTabLabelPadding,
                  onPressed: (){}, 
                  icon: const Icon(Icons.login_sharp), 
                  label: const Text('SIGNIN'),
                )
          ],
        ),
      ),
      
    );
  }
}

class TextFieldWithDropdown extends StatefulWidget {
  final Color color;
  final String title;
  const TextFieldWithDropdown({required this.color, required this.title, super.key});

  @override
  State<TextFieldWithDropdown> createState() => _TextFieldWithDropdownState();
}

class _TextFieldWithDropdownState extends State<TextFieldWithDropdown> {
  bool _isDropDownOpen = false;
  
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              decoration: InputDecoration(
              labelText: widget.title,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))
              ),
              ),
              onTap: () {
                setState(() {
                  _isDropDownOpen = !_isDropDownOpen;
                });
              },
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 425),
            transitionBuilder: (child, animation) {
              return SizeTransition(sizeFactor: animation, child: child);
            },
            child: _isDropDownOpen ? Container(
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(12.0),
                      bottomLeft: Radius.circular(12.0),
                    )
                  ),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Option 1'),
                        onTap: () {
                          if (kDebugMode) {
                            print('Option 1 selected');
                          }
                          setState(() {
                            _isDropDownOpen = false;
                          });
                        },
                      ),
                      ListTile(
                        title: const Text('Option 2'),
                        onTap: () {
                          if (kDebugMode) {
                            print('Option 2 selected');
                          }
                          setState(() {
                            _isDropDownOpen = false;
                          });
                        },
                      ),
                      ListTile(
                        title: const Text('Option 3'),
                        onTap: () {
                          if (kDebugMode) {
                            print('Option 3 selected');
                          }
                          setState(() {
                            _isDropDownOpen = false;
                          });
                        },
                      ),
                    ],
                  ),
                ) : null,
          ),
        ]
    );
  }
  Container _dropDownList() {
    return Container(
                  decoration: const BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12.0),
                      bottomLeft: Radius.circular(12.0),
                    )
                  ),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Option 1'),
                        onTap: () {
                          if (kDebugMode) {
                            print('Option 1 selected');
                          }
                          setState(() {
                            _isDropDownOpen = false;
                          });
                        },
                      ),
                      ListTile(
                        title: const Text('Option 2'),
                        onTap: () {
                          if (kDebugMode) {
                            print('Option 2 selected');
                          }
                          setState(() {
                            _isDropDownOpen = false;
                          });
                        },
                      ),
                      ListTile(
                        title: const Text('Option 3'),
                        onTap: () {
                          if (kDebugMode) {
                            print('Option 3 selected');
                          }
                          setState(() {
                            _isDropDownOpen = false;
                          });
                        },
                      ),
                    ],
                  ),
                );
  }
}

