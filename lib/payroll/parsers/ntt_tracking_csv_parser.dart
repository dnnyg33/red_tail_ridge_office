import 'dart:typed_data';

import 'package:red_tail_ridge_office/payroll/models/worker_ntt.dart';

class NttTrackingCsvParser {
  const NttTrackingCsvParser();

  List<WorkerNtt> parse({
    required Uint8List nttBytes,
    required Uint8List timeTrackingBytes,
  }) {
//iterate through workers in timeTrackingBytes
  //iterate through dates
    //for each date, store column I as shiftTotalTime
    //find rows in nttBytes with matching dates + worker
    //pull out and sum the time (column l) and store as tasksTotalTime
    //also identify unique property names (column c) and store as properties
    //finally, subtract the tasksTotalTime from shiftTotalTime to get proposedNTT
    //create a ProposedNttRow for each date/worker combination and store as nttRows
    //create a WorkerNtt for each worker and store as workers
    //return workers
  }
}
