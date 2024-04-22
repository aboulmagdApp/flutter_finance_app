import 'model/mony.dart';

class Utils {
  static List<Mony> geter() {
    Mony upwork = Mony();
    upwork.name = 'upwork';
    upwork.fee = '650';
    upwork.time = 'today';
    upwork.image = 'crd.jpg';
    upwork.buy = false;

    Mony starbucks = Mony();
    starbucks.name = 'starbucks';
    starbucks.fee = '15';
    starbucks.time = 'today';
    starbucks.image = 'crd.jpg';
    starbucks.buy = true;

    Mony transfer = Mony();
    transfer.name = 'transfer';
    transfer.fee = '100';
    transfer.time = 'today';
    transfer.image = 'crd.jpg';
    transfer.buy = true;
    return [
      upwork,
      starbucks,
      transfer,
      upwork,
      starbucks,
      transfer,
      upwork,
      starbucks,
      transfer,
      upwork,
      starbucks,
      transfer
    ];
  }

  static List timeUnits = ['day', 'week', 'month', 'year'];
}
