import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masked_text/masked_text.dart';
import 'package:test_task/constants.dart';

import 'mask_input.dart';

class AddNewCardPage extends StatefulWidget {
  @override
  _AddNewCardPageState createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  final cardNumberTEC = TextEditingController();
  final monthTEC = TextEditingController();
  final codeTEC = TextEditingController();
  bool checkedValue = false;
  final _formKey = GlobalKey<FormState>();
  bool _enabled = false;

  // Color btnColor =;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.aliceBlue,
      appBar: AppBar(
        title: Text(
          'Add new card',
          style: TextStyle(color: Colors.black, fontFamily: 'LibreFranklin'),
        ),
        centerTitle: true,
        backgroundColor: Palette.aliceBlue.withOpacity(.35),
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            Assets.back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Palette.mischka,
                      ),
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 34),
                            Text(
                              'Bank card',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                      color: Palette.eastBay,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'LibreFranklin'),
                            ),
                            SizedBox(height: 24),
                            TextFormField(
                              inputFormatters: [
                                MaskedTextInputFormatter(mask: 'xxxx xxxx xxxx xxxx', separator: ' ')
                              ],
                              controller: cardNumberTEC,
                              onChanged: (text) {
                                setState(() {
                                  if (text.length > 0) {
                                    _enabled = true;
                                  } else {
                                    _enabled = false;
                                  }
                                });
                              },
                              style: TextStyle(fontFamily: 'LibreFranklin'),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  fillColor: Palette.athensGray,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none),
                                  hintText: 'Card number',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                          color: Palette.lynch.withOpacity(.6),
                                          fontFamily: 'LibreFranklin')),
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    inputFormatters: [
                                      MaskedTextInputFormatter(mask: 'xx/xx', separator: '/')
                                    ],
                                    controller: monthTEC,
                                    onChanged: (text) {
                                      setState(() {
                                        if (text.length > 0) {
                                          _enabled = true;
                                        } else {
                                          _enabled = false;
                                        }
                                      });
                                    },
                                    style: TextStyle(fontFamily: 'LibreFranklin'),
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                        fillColor: Palette.athensGray,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide.none),
                                        hintText: 'MM / YY',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(
                                                color: Palette.lynch
                                                    .withOpacity(.6),
                                                fontFamily: 'LibreFranklin')),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: TextFormField(
                                    obscureText: true,
                                    onChanged: (text) {
                                      setState(() {
                                        if (text.length > 0) {
                                          _enabled = true;
                                        } else {
                                          _enabled = false;
                                        }
                                      });
                                    },
                                    style: TextStyle(fontFamily: 'LibreFranklin'),
                                    inputFormatters: [
                                      MaskedTextInputFormatter(mask: 'xxx', separator: '')
                                    ],
                                    controller: codeTEC,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        fillColor: Palette.athensGray,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide.none),
                                        hintText: 'CVV',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(
                                                color: Palette.lynch
                                                    .withOpacity(.6),
                                                fontFamily: 'LibreFranklin')),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              CheckboxListTile(
                title: Text(
                  'Remember the card for the next sessions',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Palette.eastBay.withOpacity(.5),
                      fontFamily: 'LibreFranklin'),
                ),
                value: checkedValue,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue = newValue;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Palette.pictonBlueL,
                //  <-- leading Checkbox
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Column(
                  children: [
                    Text(
                      'By adding debit/credit card, you agree to the',
                      style: Theme.of(context).textTheme.caption.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontFamily: 'LibreFranklin'),
                    ),
                    Text(
                      'Terms & Conditions',
                      style: Theme.of(context).textTheme.caption.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Palette.pictonBlueL,
                          decoration: TextDecoration.underline,
                          fontFamily: 'LibreFranklin'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                // child: Container(
                //   width: double.maxFinite,
                //   height: 47,
                //   child: TextButton(
                //     onPressed: _enabled ? () {} : null,
                //     child: Text('£160 • Pay', style: Theme.of(context)
                //         .textTheme
                //         .subtitle1
                //         .copyWith(color: Colors.white, fontWeight: FontWeight.w700),),
                //     style: ButtonStyle(
                //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //             RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(20),
                //         )),
                //         backgroundColor:
                //             MaterialStateProperty.all<Color>(Colors.red)),
                //   ),
                // ),
                child: Container(
                  height: 50.0,
                  width: double.maxFinite,
                  child: RawMaterialButton(
                    onPressed: _enabled ? () {} : null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: _enabled
                              ? LinearGradient(
                                  colors: [
                                    Palette.pictonBlueL,
                                    Palette.pictonBlue
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                )
                              : LinearGradient(
                                  colors: [
                                    Palette.charlotte,
                                    Palette.charlotte
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                          borderRadius: BorderRadius.circular(22)),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          '£160 • Pay',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'LibreFranklin'),
                        ),
                      ),
                    ),
                  ),
                ),
                // child: RaisedGradientButton(
                //   label: '£160 • Pay',
                //   onPressed: _enabled ? () {} : null,
                //   color: btnColor,
                // ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
