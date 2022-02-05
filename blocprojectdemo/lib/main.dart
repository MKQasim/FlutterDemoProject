// Stream<int> boatStream() async* {
//   for (int i = 1; i <= 10; i++) {
//     print("SENT boat no. " + i.toString());
//     await Future.delayed(Duration(seconds: 2));
//     yield i;
//   }
// }

// void main(List<String> args) async {
//   Stream<int> stream = boatStream();

//   stream.listen((receivedData) {
//     print("RECEIVED boat no. " + receivedData.toString());
//   });
// }

Stream<int> boatStream() async* {
  for (int i = 1; i <= 10; i++) {
    print("Sent Packet no. " + i.toString());
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}

void main(List<String> args) async {
  Stream<int> stream = boatStream();
  stream.listen((receivedData) {
    print("Received Packet no ," + receivedData.toString());
  });
}
