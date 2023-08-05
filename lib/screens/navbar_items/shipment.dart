import 'package:monie_point/export.dart';

class Shipment extends StatefulWidget {
  const Shipment({super.key});

  @override
  State<Shipment> createState() => _ShipmentState();
}

class _ShipmentState extends State<Shipment> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [PrimaryText(text: 'Shipments')],
      ),
    );
  }
}
