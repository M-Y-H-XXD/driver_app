import 'package:driver/apis/new_request.dart';
import 'package:driver/apis/set_status_my_transfer.dart';
import 'package:driver/generated/l10n.dart';
import 'package:driver/modles/constant_colors.dart';
import 'package:driver/mywigets/slide_of_mission_details.dart';
import 'package:driver/static_classes/new_request_data.dart';
import 'package:driver/static_classes/set_status_my_transfer_data.dart';
import 'package:flutter/material.dart';

NewRequest newRequest = NewRequest();
SetStatusMyTransfer setStatusMyTransfer = SetStatusMyTransfer();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isload = false;
  int slideDeleter = 0;
  Future<void> fetchData() async {
    await newRequest.Requestes();
  }

  void check() async {
    isload = true;
    setState(() {});
    await fetchData();
    NewRequestData();

    isload = false;
    setState(() {});
  }

  @override
  void initState() {
    check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sizeOfContainerContent = size.width / 25;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 60 * size.height / 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(80),
                    ),

                    color: ConstantColors.backgroundOfRequestsBlock,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        (slideDeleter == 0 || slideDeleter == 1)
                            ? SlideOfMissionDetails(
                              size: size,
                              sizeOfContainerContent: sizeOfContainerContent,
                              label: S.of(context).current_mission,
                              color: Colors.brown,
                              item:
                                  (slideDeleter == 0)
                                      ? NewRequestData.itemActualTransfer
                                      : NewRequestData.itemNextTransfer,
                            )
                            : Container(),
                        (slideDeleter == 0 &&
                                NewRequestData.itemNextTransfer != null)
                            ? SlideOfMissionDetails(
                              size: size,
                              sizeOfContainerContent: sizeOfContainerContent,
                              label: S.of(context).next_mission,
                              color: Colors.blueGrey,
                              item: NewRequestData.itemNextTransfer,
                            )
                            : Container(),
                        (slideDeleter > 1)
                            ? Container(
                              margin: EdgeInsets.all(size.width / 20),
                              height: size.height / 3,
                              width: 80 * size.width / 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                color: const Color.fromARGB(255, 198, 152, 15),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${SetStatusMyTransferData.msg}',
                                        textAlign: TextAlign.center,
                                      ),
                                      (SetStatusMyTransferData.yourStatus !=
                                              null)
                                          ? Text(
                                            ' ${S.of(context).your_status_is} ${SetStatusMyTransferData.yourStatus}',
                                          )
                                          : Text(''),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            : Container(),
                        // Container(
                        //   margin: EdgeInsets.all(size.width / 20),
                        //   height: size.height / 3,
                        //   width: 80 * size.width / 100,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.all(Radius.circular(50)),
                        //     color: Colors.blueGrey,
                        //   ),
                        //   child: Center(
                        //     child: Padding(
                        //       padding: EdgeInsets.all(size.height / 40),
                        //       child: Column(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Padding(
                        //             padding: const EdgeInsets.only(bottom: 5),
                        //             child: Center(
                        //               child: Text(
                        //                 S.of(context).next_mission,
                        //                 style: TextStyle(
                        //                   fontSize: size.width / 20,
                        //                   fontWeight: FontWeight.bold,
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //           Text(
                        //             '${S.of(context).from}:${NewRequestData.from}',
                        //             style: TextStyle(
                        //               fontSize: sizeOfContainerContent,
                        //             ),
                        //           ),
                        //           Text(
                        //             '${S.of(context).to}:${NewRequestData.to}',
                        //             style: TextStyle(
                        //               fontSize: sizeOfContainerContent,
                        //             ),
                        //           ),
                        //           Text(
                        //             '${S.of(context).source_details}:${NewRequestData.sourceDetails}',
                        //             style: TextStyle(
                        //               fontSize: sizeOfContainerContent,
                        //             ),
                        //           ),
                        //           Text(
                        //             '${S.of(context).destination_details}:${NewRequestData.destinationDetails}',
                        //             style: TextStyle(
                        //               fontSize: sizeOfContainerContent,
                        //             ),
                        //           ),
                        //           Text(
                        //             '${S.of(context).date_of_receiving}:${NewRequestData.dateOfReceiving}',
                        //             style: TextStyle(
                        //               fontSize: sizeOfContainerContent,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            (isload)
                ? Padding(
                  padding: const EdgeInsets.all(15),
                  child: CircularProgressIndicator(color: Colors.blue),
                )
                : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        padding: EdgeInsets.all(10),
                        onPressed: () async {
                          isload = true;
                          setState(() {});
                          await newRequest.Requestes();
                          NewRequestData();

                          isload = false;
                          setState(() {});
                        },
                        color: ConstantColors.backgroundOfRequestsBlock,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Text(
                          S.of(context).new_mission,
                          style: TextStyle(fontSize: size.width / 20),
                        ),
                      ),
                      MaterialButton(
                        padding: EdgeInsets.all(10),
                        onPressed: () async {
                          isload = true;
                          setState(() {});
                          await setStatusMyTransfer.refreshTheStatus();
                          SetStatusMyTransferData();
                          slideDeleter++;
                          isload = false;
                          setState(() {});
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Column(
                                children: [
                                  Text('${SetStatusMyTransferData.msg}'),
                                  (SetStatusMyTransferData.yourStatus != null)
                                      ? Text(
                                        ' ${S.of(context).your_status_is} ${SetStatusMyTransferData.yourStatus}',
                                      )
                                      : Text(''),
                                ],
                              ),
                            ),
                          );
                        },
                        color: ConstantColors.backgroundOfRequestsBlock,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Text(
                          S.of(context).finish_mission,
                          style: TextStyle(fontSize: size.width / 20),
                        ),
                      ),
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
