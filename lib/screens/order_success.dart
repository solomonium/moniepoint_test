// ignore_for_file: must_be_immutable

import 'package:monie_point/export.dart';

class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen({super.key});

  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  bool selectedCondition1 = false;
  bool selectedCondition2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MoniePointTestColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            20.verticalSpace,
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryText(
                  text: 'MoveMate',
                  color: MoniePointTestColors.primary,
                ),
                Icon(
                  Icons.delivery_dining,
                  color: MoniePointTestColors.clickableText,
                )
              ],
            ),
            30.verticalSpace,
            Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: MoniePointTestColors.border),
                child: const Center(child: PrimaryText(text: 'Success GIF'))
                // Image.asset('assets/images/success_gif.png')
                ),
            20.verticalSpace,
            const PrimaryText(text: 'ORDER HAS BEEN PLACED!', fontSize: 18),
            10.verticalSpace,
            const SizedBox(
              width: 300,
              child: Center(
                child: SecondaryText(
                    textAlign: TextAlign.center,
                    text:
                        'We will keep you posted about the status of the order. We will send you a alert when the order is ready for delivery'),
              ),
            ),
            20.verticalSpace,
            Container(
                height: 200,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Image.asset('assets/images/oceanic.png')),
            const Spacer(),
            PrimaryButton(
                color: MoniePointTestColors.primaryText,
                height: 50,
                buttonText: 'Track your order',
                onPressed: () {}),
            10.verticalSpace,
            PrimaryButton(
                color: MoniePointTestColors.border,
                height: 50,
                buttonText: 'Back to home',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()),
                      (route) => false);
                }),
          ],
        ),
      ),
    );
  }
}
