class NewRequestData {
  static Map? itemActualTransfer;
  static Map? itemNextTransfer;
  NewRequestData() {
    itemActualTransfer = requests['actual_transfer'];

    itemNextTransfer = requests['next_transfer'];
  }
  static Map requests = {};
}
