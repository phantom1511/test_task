import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/widget/gradient_button.dart';

import '../constants.dart';
import 'add_new_card_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hasBeenPressed = false;
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: StatefulBuilder(
        builder: (context, StateSetter setter) => Center(
          child: ElevatedButton(
            child: const Text(
              'Payment method',
              style: TextStyle(fontFamily: 'LibreFranklin'),
            ),
            onPressed: () {
              Scaffold.of(context).showBottomSheet(
                (context) => StatefulBuilder(
                  builder: (context, StateSetter setter) => Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(24),
                            topLeft: Radius.circular(24))),
                    height: 500,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 60,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    'Payment methods',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'LibreFranklin'),
                                  ),
                                  trailing: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: SvgPicture.asset(
                                      Assets.close,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Divider(
                                  height: 1.0,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 440,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 25),
                                    Text(
                                      'Instant consultation',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: Palette.eastBay
                                                  .withOpacity(.8),
                                              fontFamily: 'LibreFranklin'),
                                    ),
                                    SizedBox(height: 16),
                                    Container(
                                      height: 38,
                                      decoration: BoxDecoration(
                                          // shape: BoxShape.circle,
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: Palette.athensGray),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Container(
                                                height: 38,
                                                decoration: BoxDecoration(
                                                    color: !hasBeenPressed
                                                        ? Palette.athensGray
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18)),
                                                child: TextButton(
                                                    onPressed: () {
                                                      setter(() {
                                                        if (!hasBeenPressed) {
                                                          hasBeenPressed =
                                                              !hasBeenPressed;
                                                        }
                                                      });
                                                    },
                                                    style: ButtonStyle(
                                                      overlayColor: MaterialStateProperty.all(Color(2)),
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        )),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                          Colors.transparent,
                                                        )),
                                                    child: Text(
                                                      'Apple Pay',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2
                                                          .copyWith(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  'LibreFranklin'),
                                                    )),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Container(
                                                height: 38,
                                                decoration: BoxDecoration(
                                                    color: hasBeenPressed
                                                        ? Palette.athensGray
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18)),
                                                child: TextButton(
                                                    onPressed: () {
                                                      setter(() {
                                                        if (hasBeenPressed) {
                                                          hasBeenPressed =
                                                              !hasBeenPressed;
                                                        }
                                                      });
                                                    },
                                                    style: ButtonStyle(
                                                        overlayColor: MaterialStateProperty.all(Color(2)),
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        )),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                          Colors.transparent,
                                                        )),
                                                    child: Text(
                                                      'Card',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2
                                                          .copyWith(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  'LibreFranklin'),
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 40),
                                    ListTile(
                                        onTap: () {},
                                        title: Text(
                                          '**** 8947',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              .copyWith(
                                                  color: Palette.eastBay
                                                      .withOpacity(.8),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'LibreFranklin'),
                                        ),
                                        leading: Image.asset(Assets.card1),
                                        trailing: Radio(
                                          onChanged: (value) {
                                            setter(() {
                                              _value = value;
                                            });
                                          },
                                          groupValue: _value,
                                          value: 1,
                                          activeColor: Palette.eastBay,
                                        )),
                                    Divider(),
                                    ListTile(
                                        onTap: () {},
                                        title: Text(
                                          '**** 7464',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              .copyWith(
                                                  color: Palette.eastBay
                                                      .withOpacity(.8),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'LibreFranklin'),
                                        ),
                                        leading: Image.asset(Assets.card2),
                                        trailing: Radio(
                                          onChanged: (value) {
                                            setter(() {
                                              _value = value;
                                            });
                                          },
                                          groupValue: _value,
                                          value: 2,
                                          activeColor: Palette.eastBay,
                                        )),
                                    Divider(),
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    AddNewCardPage()));
                                      },
                                      title: Text(
                                        'Add new card',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(
                                                color: Palette.eastBay
                                                    .withOpacity(.8),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'LibreFranklin'),
                                      ),
                                      leading: Icon(Icons.credit_card),
                                      trailing: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Icon(
                                          Icons.add,
                                          color: Palette.eastBay,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 40),
                                    RaisedGradientButton(
                                      label: '£160 • Pay',
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
                    borderSide: BorderSide.none),
              );
            },
          ),
        ),
      ),
    );
  }
}
