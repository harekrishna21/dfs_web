import 'package:driver_fatigue_system/reuseable/data/dummyData.dart';
import 'package:driver_fatigue_system/utils/appAssets.dart';
import 'package:flutter/material.dart';

import '../../utils/appColors.dart';

class DashboardTable extends StatefulWidget {
  @override
  State<DashboardTable> createState() => _DashboardTableState();
}

class _DashboardTableState extends State<DashboardTable> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        // Display the most recent 10 entries
        var recentBookings = DummyData.bookingData.length > 10
            ? DummyData.bookingData.reversed.toList().sublist(0, 10)
            : DummyData.bookingData.reversed.toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.headerColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(AppAssets.truckImage, height: 20, width: 20),
                  SizedBox(width: 10),
                  Text(
                    'Recent Customer',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              thickness: 10,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 15),
                controller: _scrollController,
                scrollDirection: Axis.horizontal, // Horizontal scrolling
                child: Container(
                  color: Colors.white,
                  child: ConstrainedBox(
                    constraints:
                    BoxConstraints(minWidth: screenWidth), // Full-width table
                    child: DataTable(
                      border: TableBorder.all(
                          width: 0.5,
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )),
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'S No',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Booking ID',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Name',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Mobile Number',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Date & Time',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Action',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                      rows: List.generate(recentBookings.length, (index) {
                        var booking = recentBookings[index];
                        return DataRow(
                          cells: <DataCell>[
                            DataCell(Text(booking['sNo']!)),
                            DataCell(Text(booking['bookingId']!)),
                            DataCell(Text(booking['name']!)),
                            DataCell(Text(booking['mobileNumber']!)),
                            DataCell(Text(booking['dateTime']!)),
                            DataCell(Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.green,
                                      ),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Icon(Icons.remove_red_eye,
                                      color: Colors.green, size: 15),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.editColor),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Icon(Icons.edit,
                                      color: AppColors.editColor, size: 15),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Icon(Icons.delete_forever,
                                      color: Colors.red, size: 15),
                                ),
                              ],
                            )),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

