import 'package:driver/generated/l10n.dart';
import 'package:flutter/material.dart';

class SlideOfMissionDetails extends StatefulWidget {
  const SlideOfMissionDetails({
    super.key,
    required this.size,
    required this.sizeOfContainerContent,
    required this.label,
    required this.color,
    required this.item,
  });

  final Size size;
  final double sizeOfContainerContent;
  final String label;
  final Color color;
  final item;

  @override
  State<SlideOfMissionDetails> createState() => _SlideOfMissionDetailsState();
}

class _SlideOfMissionDetailsState extends State<SlideOfMissionDetails> {
  String? dateOfReceiving;

  String? from;

  String? to;

  String? destinationDetails;

  String? sourceDetails;
  bool empty = false;
  void init() {
    if (widget.item != null) {
      dateOfReceiving = widget.item!['date_of_resiving'];
      from = widget.item!['from'];
      to = widget.item!['to'];
      destinationDetails = widget.item!['destinationable_type'];
      sourceDetails = widget.item!['sourceable_type'];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Container(
      margin: EdgeInsets.all(widget.size.width / 20),
      height: widget.size.height / 3,
      width: 80 * widget.size.width / 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: widget.color,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(widget.size.height / 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Center(
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: widget.size.width / 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                '${S.of(context).from}:$from',
                style: TextStyle(fontSize: widget.sizeOfContainerContent),
              ),
              Text(
                '${S.of(context).to}:$to',
                style: TextStyle(fontSize: widget.sizeOfContainerContent),
              ),
              Text(
                '${S.of(context).source_details}:$sourceDetails',
                style: TextStyle(fontSize: widget.sizeOfContainerContent),
              ),
              Text(
                '${S.of(context).destination_details}:$destinationDetails',
                style: TextStyle(fontSize: widget.sizeOfContainerContent),
              ),
              Text(
                '${S.of(context).date_of_receiving}:$dateOfReceiving',
                style: TextStyle(fontSize: widget.sizeOfContainerContent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
