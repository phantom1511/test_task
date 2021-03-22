import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/constants.dart';
import 'package:test_task/view/add_new_card_page.dart';
import 'package:test_task/widget/gradient_button.dart';

void main() {
  runApp(PaymentMethodPage());
}

class PaymentMethodPage extends StatefulWidget {
  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  double _headerHeight = 60.0;
  double _bodyHeight = 520.0;
  BottomDrawerController _controller = BottomDrawerController();
  int _value = 1;
  int currentColor = 0;
  bool hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            _buildBottomDrawer(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomDrawer(BuildContext context) {
    return BottomDrawer(
      header: _buildBottomDrawerHead(context),
      body: _buildBottomDrawerBody(context),
      headerHeight: _headerHeight,
      drawerHeight: _bodyHeight,
      color: Colors.white,
      controller: _controller,
    );
  }

  Widget _buildBottomDrawerHead(BuildContext context) {
    return Container(
      height: _headerHeight,
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Payment methods',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            trailing: SvgPicture.asset(
              Assets.close,
            ),
          ),
          Spacer(),
          Divider(
            height: 1.0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomDrawerBody(BuildContext context) {
    return Container(
      width: double.infinity,
      height: _bodyHeight,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Text(
                'Instant consultation',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Palette.eastBay.withOpacity(.8)),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(18),
                    color: Palette.athensGray),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                if (!hasBeenPressed) {
                                  hasBeenPressed = !hasBeenPressed;
                                }
                              });
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  !hasBeenPressed
                                      ? Palette.athensGray
                                      : Colors.white,
                                )),
                            child: Text(
                              'Apple Pay',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                            )),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                if (hasBeenPressed) {
                                  hasBeenPressed = !hasBeenPressed;
                                }
                              });
                            },

                            style: ButtonStyle(

                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        !hasBeenPressed
                                            ? Colors.white
                                            : Palette.athensGray)),
                            child: Text(
                              'Card',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              ListTile(
                  title: Text(
                    '**** 8947',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Palette.eastBay.withOpacity(.8),
                        fontWeight: FontWeight.w400),
                  ),
                  leading: Image.asset(Assets.card1),
                  trailing: Radio(
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    groupValue: _value,
                    value: 1,
                    activeColor: Palette.eastBay,
                  )),
              Divider(),
              ListTile(
                  title: Text(
                    '**** 7464',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Palette.eastBay.withOpacity(.8),
                        fontWeight: FontWeight.w400),
                  ),
                  leading: Image.asset(Assets.card2),
                  trailing: Radio(
                    onChanged: (value) {
                      setState(() {
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
                      MaterialPageRoute(builder: (_) => AddNewCardPage()));
                },
                title: Text(
                  'Add new card',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Palette.eastBay.withOpacity(.8),
                      fontWeight: FontWeight.w400),
                ),
                leading: Icon(Icons.credit_card),
                trailing: Icon(
                  Icons.add,
                  color: Palette.eastBay,
                ),
              ),
              SizedBox(height: 40),
              RaisedGradientButton(
                label: '£160 • Pay',
                onPressed: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
