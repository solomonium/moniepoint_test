import 'package:monie_point/export.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
          height: 15,
          width: 15,
          decoration: BoxDecoration(
              color: MoniePointTestColors.background,
              borderRadius: BorderRadius.circular(50)),
          child: const Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.place),
                SecondaryText(text: 'Your location'),
              ],
            ),
            Row(
              children: [
                PrimaryText(
                  text: 'Wertheimer, Illinois',
                  color: MoniePointTestColors.border,
                  fontSize: 14,
                ),
                Icon(Icons.arrow_drop_down_sharp)
              ],
            )
          ],
        ),
        actions: [
          Container(
              margin:
                  const EdgeInsets.only(left: 16, top: 8, bottom: 4, right: 16),
              height: 20,
              width: 45,
              decoration: BoxDecoration(
                  color: MoniePointTestColors.background,
                  borderRadius: BorderRadius.circular(50)),
              child: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ))
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Container(
                color: MoniePointTestColors.primary,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomTextField(
                      borderRadius: 50,
                      suffixIcon: Padding(
                        padding:
                            const EdgeInsets.only(top: 3, bottom: 3, right: 8),
                        child: Container(
                            height: 30,
                            width: 35,
                            decoration: BoxDecoration(
                                color: MoniePointTestColors.clickableText,
                                borderRadius: BorderRadius.circular(50)),
                            child: const Icon(
                              Icons.qr_code_scanner_rounded,
                              color: MoniePointTestColors.background,
                            )),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: MoniePointTestColors.primary,
                      ),
                      hint: 'Enter the receipt number ...',
                      controller: searchController,
                      textInputAction: TextInputAction.done,
                      keyBoardType: TextInputType.text),
                ),
              ),
              20.verticalSpace
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              30.verticalSpace,
              const PrimaryText(text: 'Tracking'),
              20.verticalSpace,
              CustomContainer(
                  addShadow: false,
                  color: MoniePointTestColors.background,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SecondaryText(text: 'Shipment Number'),
                                10.verticalSpace,
                                const PrimaryText(
                                    text: 'NEJ200899341234', fontSize: 20),
                              ],
                            ),
                            const Icon(Icons.car_crash)
                          ],
                        ),
                        10.verticalSpace,
                        const Divider(
                            color: MoniePointTestColors.border, thickness: 1),
                        10.verticalSpace,
                        Row(
                          children: [
                            Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: MoniePointTestColors.clickableText
                                        .withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(50)),
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
                            50.horizontalSpace,
                            buildDetails(
                                'Time',
                                Row(
                                  children: [
                                    Container(
                                      height: 7,
                                      width: 7,
                                      decoration: BoxDecoration(
                                          color: MoniePointTestColors.greenDot,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                    ),
                                    5.horizontalSpace,
                                    const PrimaryText(
                                      text: '2 day - 3 days',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ))
                          ],
                        ),
                        10.verticalSpace,
                        Row(
                          children: [
                            Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: MoniePointTestColors.greenDot
                                        .withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(50)),
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
                            40.horizontalSpace,
                            buildDetails(
                              'Status',
                              const PrimaryText(
                                text: 'Waiting to collect',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        20.verticalSpace,
                        const Divider(
                            color: MoniePointTestColors.border, thickness: 1),
                        10.verticalSpace,
                        const Align(
                          alignment: Alignment.center,
                          child: PrimaryText(
                            text: '+ Add stop',
                            fontSize: 18,
                            color: MoniePointTestColors.clickableText,
                          ),
                        ).clickable(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddStopScreen()));
                        }),
                      ],
                    ),
                  )),
              30.verticalSpace,
              const PrimaryText(
                text: 'Available vehicles',
                fontSize: 20,
              ),
              20.verticalSpace,
              SizedBox(
                // color: Colors.amber,
                height: 200,
                child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: availableVehicles.length,
                    itemBuilder: ((context, index) => CustomContainer(
                        addShadow: false,
                        color: MoniePointTestColors.background,
                        width: 170,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PrimaryText(
                                text: availableVehicles[index]['title'],
                                fontSize: 18,
                              ),
                              SecondaryText(
                                  text: availableVehicles[index]['sub']),
                              SizedBox(
                                height: 140,
                                child: Image.asset(
                                    availableVehicles[index]['image']),
                              )
                            ],
                          ),
                        )))),
              ),
              20.verticalSpace
            ],
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> availableVehicles = [
    {
      'title': 'Ocean freight',
      'sub': 'International',
      'image': 'assets/images/oceanic.png'
    },
    {
      'title': 'Cargo freight',
      'sub': 'Reliable',
      'image': 'assets/images/cargo.png'
    },
    {
      'title': 'Air freight',
      'sub': 'International',
      'image': 'assets/images/oceanic.png'
    },
    {
      'title': 'Train freight',
      'sub': 'MultiService',
      'image': 'assets/images/cargo.png'
    },
    {
      'title': 'Drone freight',
      'sub': 'Live',
      'image': 'assets/images/oceanic.png'
    },
    {
      'title': 'Instant freight',
      'sub': 'Local',
      'image': 'assets/images/cargo.png'
    },
    {
      'title': 'Road freight',
      'sub': 'Local',
      'image': 'assets/images/oceanic.png'
    },
  ];

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
