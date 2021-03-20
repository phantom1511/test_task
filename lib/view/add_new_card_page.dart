import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/constants.dart';
import 'package:test_task/widget/gradient_button.dart';

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
  Color btnColor = Palette.charlotte;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.aliceBlue,
      appBar: AppBar(
        title: Text(
          'Add new card',
          style: TextStyle(color: Colors.black),
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
                                      fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 24),
                            TextFormField(
                              controller: cardNumberTEC,
                              onChanged: (text) {
                                setState(() {
                                  if (text.length > 0) {
                                    _enabled = true;
                                    btnColor = Palette.athensGray;
                                  } else {
                                    _enabled = false;
                                    btnColor = Palette.charlotte;
                                  }
                                });
                              },
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
                                          color:
                                              Palette.lynch.withOpacity(.6))),
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
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
                                                    .withOpacity(.6))),
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
                                                    .withOpacity(.6))),
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
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Palette.eastBay.withOpacity(.5)),
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
                          fontWeight: FontWeight.w400, color: Colors.grey),
                    ),
                    Text(
                      'Terms & Conditions',
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Palette.pictonBlueL,
                            decoration: TextDecoration.underline,
                          ),
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
                child: RaisedGradientButton(
                  label: '£160 • Pay',
                  onPressed: _enabled ? () {} : null,
                  color: btnColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
