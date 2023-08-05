// ignore_for_file: must_be_immutable

import 'package:monie_point/export.dart';
import 'package:monie_point/screens/delivery_details.dart';

class PricingDetailsScreen extends StatefulWidget {
  const PricingDetailsScreen({super.key});

  @override
  State<PricingDetailsScreen> createState() => _PricingDetailsScreenState();
}

class _PricingDetailsScreenState extends State<PricingDetailsScreen> {
  bool selectedCondition1 = false;
  bool selectedCondition2 = false;

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
            text: 'Pricing',
            color: MoniePointTestColors.background,
            fontSize: 20,
          ),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PrimaryText(
                    text: 'Price details',
                    fontSize: 20,
                  ),
                  10.verticalSpace,
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          bool shouldColor = index == 3;
                          return PricingDetailsWidget(
                            name: pricingDetails[index]['name'],
                            amount: pricingDetails[index]['amount'],
                            shouldColor: shouldColor,
                          );
                        },
                        separatorBuilder: (context, index) => 10.verticalSpace,
                        itemCount: pricingDetails.length),
                  ),
                  const Divider(
                    color: MoniePointTestColors.border,
                    thickness: 2,
                  ),
                  10.verticalSpace,
                  PricingDetailsWidget(amount: '400', name: 'Total(USD)')
                ],
              ),
            ),
            // 10.verticalSpace,
            const Divider(
              color: MoniePointTestColors.border,
              thickness: 8,
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PrimaryText(
                    text: 'Payment Method',
                    fontSize: 20,
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      const Icon(Icons.sd_card_alert),
                      10.horizontalSpace,
                      const PrimaryText(
                        text: 'Online payment',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black87,
                            backgroundColor: selectedCondition2
                                ? MoniePointTestColors.greenDot
                                : Colors.white,
                            side: const BorderSide(
                              color: MoniePointTestColors.border,
                              width: 2,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedCondition2 = !selectedCondition2;
                              selectedCondition1 =
                                  false; // Deselect other condition
                            });
                          },
                          child: const SizedBox(),
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  Row(
                    children: [
                      const Icon(Icons.money_rounded),
                      10.horizontalSpace,
                      const PrimaryText(
                        text: 'Cash on delivery',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.chevron_right,
                        color: MoniePointTestColors.secondaryText,
                      )
                    ],
                  ),
                  20.verticalSpace,
                  PrimaryButton(
                      btnTextColor: MoniePointTestColors.primaryText,
                      height: 40,
                      color: MoniePointTestColors.border,
                      buttonText: '+ Add payment method',
                      onPressed: () {})
                ],
              ),
            ),
            const Divider(
              color: MoniePointTestColors.border,
              thickness: 8,
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PrimaryText(
                    text: 'Voucher',
                    fontSize: 20,
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      const Icon(Icons.night_shelter),
                      10.horizontalSpace,
                      const PrimaryText(
                        text: 'Vouchers',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const SecondaryText(text: '0'),
                          Icon(
                            Icons.chevron_right,
                            color: MoniePointTestColors.secondaryText,
                          ),
                        ],
                      )
                    ],
                  ),
                  10.verticalSpace,
                  PrimaryButton(
                      btnTextColor: MoniePointTestColors.primaryText,
                      height: 40,
                      color: MoniePointTestColors.border,
                      buttonText: '+ Add a voucher code',
                      onPressed: () {})
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: PrimaryButton(
                  height: 52,
                  buttonText: 'Next',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DeliveryDetailsScreen()));
                  }),
            ),
            20.verticalSpace
          ]),
        ));
  }

  List<Map<String, dynamic>> pricingDetails = [
    {
      'name': 'Container fee',
      'amount': '${300}',
    },
    {
      'name': 'Driving fee',
      'amount': '${400}',
    },
    {
      'name': 'Occupancy taxes',
      'amount': '${500}',
    },
    {
      'name': 'Express Delivery charge (10%)',
      'amount': '${100}',
    },
  ];
}

class PricingDetailsWidget extends StatelessWidget {
  PricingDetailsWidget({
    super.key,
    required this.amount,
    required this.name,
    this.shouldColor = false,
  });
  String name, amount;
  final bool shouldColor;

  @override
  Widget build(BuildContext context) {
    final textColor = shouldColor
        ? MoniePointTestColors.clickableText // Use the color you want to apply
        : null;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SecondaryText(
          text: name,
          color: textColor,
          fontWeight: FontWeight.w400,
        ),
        PrimaryText(
          text: amount,
          fontSize: 18,
          color: textColor,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}
