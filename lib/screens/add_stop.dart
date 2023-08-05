import 'package:monie_point/export.dart';

class AddStopScreen extends StatefulWidget {
  const AddStopScreen({super.key});

  @override
  State<AddStopScreen> createState() => _AddStopScreenState();
}

class _AddStopScreenState extends State<AddStopScreen> {
  TextEditingController floorController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool isChecked = true;
  @override
  void initState() {
    super.initState();

    // Show the bottom sheet immediately when the screen is opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomSheet();
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
            return SingleChildScrollView(
              clipBehavior: Clip.antiAlias,
              child: Container(
                height: 450 + keyboardHeight,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PrimaryText(text: 'Address details'),
                      10.verticalSpace,
                      10.verticalSpace,
                      CustomTextField(
                          fillColor: MoniePointTestColors.secondaryText
                              .withOpacity(0.5),
                          prefixIcon: Icon(Icons.home_work_outlined,
                              color: MoniePointTestColors.secondaryText),
                          hint: 'Floor or Unit ',
                          controller: floorController,
                          textInputAction: TextInputAction.next,
                          keyBoardType: TextInputType.text),
                      10.verticalSpace,
                      CustomTextField(
                          fillColor: MoniePointTestColors.secondaryText
                              .withOpacity(0.5),
                          prefixIcon: Icon(Icons.photo_camera_rounded,
                              color: MoniePointTestColors.secondaryText),
                          hint: 'Phone Number',
                          controller: phoneNumberController,
                          textInputAction: TextInputAction.next,
                          keyBoardType: TextInputType.number),
                      10.verticalSpace,
                      CustomTextField(
                          fillColor: MoniePointTestColors.secondaryText
                              .withOpacity(0.5),
                          prefixIcon: Icon(
                            Icons.edit_document,
                            color: MoniePointTestColors.secondaryText,
                          ),
                          hint: 'Name',
                          controller: nameController,
                          textInputAction: TextInputAction.done,
                          keyBoardType: TextInputType.text),
                      10.verticalSpace,
                      10.verticalSpace,
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          const SecondaryText(text: 'Save this address'),
                        ],
                      ),
                      10.verticalSpace,
                      PrimaryButton(
                          height: 52,
                          buttonText: 'Confirm',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DeliveryScreen()));
                          })
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'assets/images/map2.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
