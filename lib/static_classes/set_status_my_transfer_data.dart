class SetStatusMyTransferData {
  static String? msg;
  static String? yourStatus;
  SetStatusMyTransferData() {
    msg = status['msg'];

    yourStatus = status['your_status'];
  }
  static Map status = {};
}
