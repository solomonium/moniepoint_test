import 'package:monie_point/export.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  TextEditingController officeSupply = TextEditingController();
  TextEditingController approxWeight = TextEditingController();
  bool expressDeliverySelect = false;
  bool normalDeliverySelect = false;
  bool selectedCondition1 = false;
  bool selectedCondition2 = false;
  int selectedBoxIndex = -1;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MoniePointTestColors.background,
        appBar: AppBar(
          leading: const Icon(
            Icons.chevron_left_outlined,
            size: 40,
          ),
          centerTitle: true,
          title: const PrimaryText(
            text: 'Delivery Details',
            color: MoniePointTestColors.background,
            fontSize: 20,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.verticalSpace,
                const PrimaryText(
                  text: 'Delivery Option',
                  fontSize: 20,
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            expressDeliverySelect = true;
                            normalDeliverySelect = false;
                          });
                        },
                        child: CustomContainer(
                          color: expressDeliverySelect
                              ? MoniePointTestColors.primaryText
                              : MoniePointTestColors.background,
                          width: 170,
                          child: SizedBox(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.delivery_dining,
                                  color: expressDeliverySelect
                                      ? MoniePointTestColors.background
                                      : MoniePointTestColors.primaryText,
                                ),
                                PrimaryText(
                                  text: 'Express delivery',
                                  fontSize: 16,
                                  color: expressDeliverySelect
                                      ? MoniePointTestColors.background
                                      : MoniePointTestColors.primaryText,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            normalDeliverySelect = true;
                            expressDeliverySelect = false;
                          });
                        },
                        child: CustomContainer(
                          color: normalDeliverySelect
                              ? MoniePointTestColors.primaryText
                              : MoniePointTestColors.background,
                          width: 170,
                          child: SizedBox(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.delivery_dining,
                                  color: normalDeliverySelect
                                      ? MoniePointTestColors.background
                                      : MoniePointTestColors.primaryText,
                                ),
                                PrimaryText(
                                  text: 'Normal delivery',
                                  fontSize: 16,
                                  color: normalDeliverySelect
                                      ? MoniePointTestColors.background
                                      : MoniePointTestColors.primaryText,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                Row(
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      color: MoniePointTestColors.clickableText,
                    ),
                    5.horizontalSpace,
                    const SecondaryText(
                      text: 'Express delivery charge extra 10% cost',
                      color: MoniePointTestColors.clickableText,
                    )
                  ],
                ),
                20.verticalSpace,
                const PrimaryText(
                  text: 'Product Details',
                  fontSize: 20,
                ),
                CustomContainer(
                    color: MoniePointTestColors.background,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          CustomTextField(
                              fillColor: MoniePointTestColors.secondaryText
                                  .withOpacity(0.1),
                              prefixIcon: Icon(Icons.home_work_outlined,
                                  color: MoniePointTestColors.secondaryText),
                              hint: 'Office Supply',
                              controller: officeSupply,
                              textInputAction: TextInputAction.next,
                              keyBoardType: TextInputType.text),
                          10.verticalSpace,
                          CustomTextField(
                              fillColor: MoniePointTestColors.secondaryText
                                  .withOpacity(0.1),
                              prefixIcon: Icon(Icons.more_time_sharp,
                                  color: MoniePointTestColors.secondaryText),
                              hint: 'Approx weight',
                              controller: approxWeight,
                              textInputAction: TextInputAction.next,
                              keyBoardType: TextInputType.number),
                        ],
                      ),
                    )),
                20.verticalSpace,
                const PrimaryText(
                  text: 'Available boxes',
                  fontSize: 20,
                ),
                10.verticalSpace,
                SizedBox(
                    // color: Colors.amber,
                    height: 230,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => 10.verticalSpace,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: availableBoxes.length,
                      itemBuilder: (context, index) {
                        bool isSelected =
                            selectedBoxIndex == index; // Use a selected index

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedBoxIndex = index;
                            });
                          },
                          child: CustomContainer(
                            color: isSelected
                                ? MoniePointTestColors.primary
                                : MoniePointTestColors.background,
                            width: 170,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PrimaryText(
                                    text: availableBoxes[index]['title'],
                                    fontSize: 18,
                                    color: isSelected
                                        ? MoniePointTestColors.background
                                        : MoniePointTestColors.primaryText,
                                  ),
                                  SecondaryText(
                                    text: availableBoxes[index]['sub'],
                                    color: isSelected
                                        ? MoniePointTestColors.background
                                        : MoniePointTestColors.secondaryText,
                                  ),
                                  SecondaryText(
                                    text: availableBoxes[index]['amount'],
                                    color: isSelected
                                        ? MoniePointTestColors.background
                                        : MoniePointTestColors.primary,
                                  ),
                                  SizedBox(
                                    height: 140,
                                    child: Image.asset(
                                        availableBoxes[index]['image']),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )),
                20.verticalSpace,
                const PrimaryText(
                  text: 'Categories',
                  fontSize: 20,
                ),
                10.verticalSpace,
                const SecondaryText(text: "What are you sending?"),
                10.verticalSpace,
                SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 5,
                      runSpacing: 10,
                      children: List.generate(categories.length, (index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 5),
                          height: 35,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black87,
                                backgroundColor: (selectedIndex == index)
                                    ? MoniePointTestColors.primary
                                    : Colors.white,
                                side: const BorderSide(
                                    color: MoniePointTestColors.border),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  // if (selectedIndex <= 2) {
                                  selectedIndex = index;
                                  // }
                                });
                              },
                              child: SecondaryText(
                                text: categories[index],
                                color: (selectedIndex == index)
                                    ? MoniePointTestColors.background
                                    : MoniePointTestColors.primaryText,
                              )),
                        );
                      }),
                    ),
                  ),
                ),
                20.verticalSpace,
                const PrimaryText(
                  text: 'Conditions',
                  fontSize: 20,
                ),
                10.verticalSpace,
                CustomContainer(
                  color: MoniePointTestColors.background,
                  width: double.infinity,
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black87,
                                backgroundColor: selectedCondition1
                                    ? MoniePointTestColors.primary
                                    : Colors.white,
                                side: const BorderSide(
                                  color: MoniePointTestColors.primaryText,
                                  width: 2,
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedCondition1 = !selectedCondition1;
                                  selectedCondition2 =
                                      false; // Deselect other condition
                                });
                              },
                              child: const SizedBox(),
                            ),
                          ),
                          10.horizontalSpace,
                          const Icon(Icons.coffee_rounded),
                          10.horizontalSpace,
                          const PrimaryText(
                            text: 'Breakable items',
                            fontSize: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                10.verticalSpace,
                CustomContainer(
                  color: MoniePointTestColors.background,
                  width: double.infinity,
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black87,
                                backgroundColor: selectedCondition2
                                    ? MoniePointTestColors.primary
                                    : Colors.white,
                                side: const BorderSide(
                                  color: MoniePointTestColors.primaryText,
                                  width: 2,
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
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
                          10.horizontalSpace,
                          const Icon(Icons.car_crash),
                          10.horizontalSpace,
                          const PrimaryText(
                            text: 'No prohibited items',
                            fontSize: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                20.verticalSpace,
                PrimaryButton(
                    height: 52,
                    buttonText: 'Next',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PricingDetailsScreen()));
                    }),
                20.verticalSpace
              ],
            ),
          ),
        ));
  }

  List<Map<String, dynamic>> availableBoxes = [
    {
      'title': 'Large box',
      'sub': '50" x 60"',
      'amount': '${200}',
      'image': 'assets/images/oceanic.png'
    },
    {
      'title': 'Truck Container',
      'sub': '50" x 60"',
      'amount': '${200}',
      'image': 'assets/images/cargo.png'
    },
    {
      'title': 'Container Truck',
      'sub': '50" x 60"',
      'amount': '${200}',
      'image': 'assets/images/oceanic.png'
    },
    {
      'title': 'Large box',
      'sub': '50" x 60"',
      'amount': '${200}',
      'image': 'assets/images/cargo.png'
    },
    {
      'title': 'Truck Container',
      'sub': '50" x 60"',
      'amount': '${200}',
      'image': 'assets/images/oceanic.png'
    },
    {
      'title': 'Container box',
      'sub': '50" x 60"',
      'amount': '${200}',
      'image': 'assets/images/cargo.png'
    },
    {
      'title': 'Large box',
      'sub': '50" x 60"',
      'amount': '${200}',
      'image': 'assets/images/oceanic.png'
    },
  ];
  List<String> categories = [
    'Documents',
    'Glass',
    'Liquid',
    'Food',
    'Electronic',
    'Product',
    'Others',
  ];
}
