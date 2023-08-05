// ignore_for_file: must_be_immutable

import 'package:monie_point/export.dart';
import 'package:monie_point/screens/order_success.dart';

class DeliveryDetailsScreen extends StatefulWidget {
  const DeliveryDetailsScreen({super.key});

  @override
  State<DeliveryDetailsScreen> createState() => _DeliveryDetailsScreenState();
}

class _DeliveryDetailsScreenState extends State<DeliveryDetailsScreen> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MoniePointTestColors.background,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.chevron_left_outlined,
              size: 40,
            ),
          ),
          centerTitle: true,
          title: const PrimaryText(
            text: 'Delivery Details',
            color: MoniePointTestColors.background,
            fontSize: 20,
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            20.verticalSpace,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryText(
                  text: 'Product details',
                  fontSize: 20,
                ),
                Icon(Icons.edit)
              ],
            ),
            20.verticalSpace,
            CustomContainer(
                color: MoniePointTestColors.background,
                width: double.infinity,
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: MoniePointTestColors
                                            .clickableText
                                            .withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: const Icon(
                                      Icons.qr_code_scanner_rounded,
                                      color: MoniePointTestColors.background,
                                    )),
                                10.horizontalSpace,
                                buildDetails(
                                  'Sender',
                                  const PrimaryText(
                                    text: 'Atlanta, 5243',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  // 'Atlanta, 5243'
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: MoniePointTestColors.greenDot
                                            .withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: const Icon(
                                      Icons.qr_code_scanner_rounded,
                                      color: MoniePointTestColors.background,
                                    )),
                                10.horizontalSpace,
                                buildDetails(
                                  'Receiver',
                                  const PrimaryText(
                                    text: 'Chicago, 6342',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        const Divider(
                          color: MoniePointTestColors.border,
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildDetails(
                                'Condition',
                                const PrimaryText(
                                  text: 'Breakable Items',
                                  fontSize: 14,
                                )),
                            buildDetails(
                                'Weight',
                                const PrimaryText(
                                  text: '324KG',
                                  fontSize: 14,
                                )),
                            buildDetails(
                                'Sending',
                                const PrimaryText(
                                  text: 'Office Stuffs',
                                  fontSize: 14,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            10.verticalSpace,
            const PrimaryText(
              text: 'Selected Method',
              fontSize: 20,
            ),
            10.verticalSpace,
            CustomContainer(
                color: MoniePointTestColors.background,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const PrimaryText(
                            text: 'Container ',
                            fontSize: 18,
                            color: MoniePointTestColors.primaryText,
                          ),
                          SecondaryText(
                            text: '2.3m x 7.5m',
                            color: MoniePointTestColors.secondaryText,
                          ),
                          const SecondaryText(
                            text: '200',
                            color: MoniePointTestColors.primary,
                          ),
                          40.verticalSpace,
                          const PrimaryText(
                            text: 'Change',
                            fontSize: 16,
                            color: MoniePointTestColors.clickableText,
                          )
                        ],
                      ),
                      SizedBox(
                          height: 150,
                          width: 200,
                          child: Image.asset('assets/images/cargo.png'))
                    ],
                  ),
                )),
            10.verticalSpace,
            const PrimaryText(
              text: 'Payment Method',
              fontSize: 20,
            ),
            10.verticalSpace,
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                    color: MoniePointTestColors.clickableText,
                    width: 2,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(Icons.sd_card_alert),
                    10.horizontalSpace,
                    const PrimaryText(
                      text: 'Online payment',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),
                    // Checkbox(
                    //   focusColor: MoniePointTestColors.greenDot,
                    //   value: isChecked,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       isChecked = true;
                    //     });
                    //   },
                    // )
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black87,
                          backgroundColor: MoniePointTestColors.greenDot,
                          side: const BorderSide(
                            color: MoniePointTestColors.border,
                            width: 2,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            isChecked = true; // Deselect other condition
                          });
                        },
                        child: const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            20.verticalSpace,
            CustomContainer(
              color: MoniePointTestColors.background,
              width: double.infinity,
              child: SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Icon(Icons.money_rounded),
                      10.horizontalSpace,
                      const PrimaryText(
                        text: 'Cash on delivery',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            10.verticalSpace,
            const PrimaryText(
              text: 'Online Payment ',
              fontSize: 20,
            ),
            10.verticalSpace,
            PrimaryButton(
                height: 52,
                buttonText: 'Place Order',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderSuccessScreen()));
                }),
            20.verticalSpace,
          ]),
        )));
  }

  SizedBox buildDetails(String topSec, Widget lowPri) {
    return SizedBox(
      height: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SecondaryText(text: topSec),
          Row(
            children: [
              lowPri,
            ],
          )
        ],
      ),
    );
  }
}
