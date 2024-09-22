import 'package:driver_fatigue_system/view/main_screen/mainScreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/appAssets.dart';
import '../../utils/appColors.dart';
import '../data/dummyData.dart';

class DashBoardDataTable extends StatelessWidget {
  const DashBoardDataTable({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainScreenController());
    return GetBuilder(
      init: controller,
        builder: (controller){
     return LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;

          // Pagination logic: calculate total pages and get current page's data
          int totalRows = DummyData.bookingData.length;
          int totalPages =
          (totalRows / controller.rowsPerPage).ceil(); // Calculate total pages
          var currentData = DummyData.bookingData
              .skip(controller.currentPage * controller.rowsPerPage)
              .take(controller.rowsPerPage)
              .toList();

          return Card(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.centerLeft,
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.headerColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(AppAssets.truckImage, height: 20, width: 20),
                      SizedBox(width: 10),
                      const Text(
                        'All Customer',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Scrollbar(
                  controller: controller.scrollController,
                  thumbVisibility: true,
                  thickness: 10,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 15),
                    controller: controller.scrollController,
                    scrollDirection: Axis.horizontal, // Horizontal scrolling
                    child: Container(
                      color: Colors.white,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minWidth: screenWidth), // Full-width table
                        child: DataTable(
                          border: TableBorder.all(
                            width: 0.5,
                            color: Colors.grey,
                          ),
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
                          rows: List.generate(currentData.length, (index) {
                            var booking = currentData[index];
                            return DataRow(
                              cells: <DataCell>[
                                DataCell(Text(booking['sNo']!)),
                                DataCell(Text(booking['bookingId']!)),
                                DataCell(Text(booking['name']!)),
                                DataCell(Text(booking['mobileNumber']!)),
                                DataCell(Text(booking['dateTime']!)),
                                DataCell(Row(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                      /* controller.selectedIndex.value = 9;
                                        controller.update();*/
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.green,
                                            ),
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Icon(Icons.remove_red_eye,
                                            color: Colors.green, size: 15),
                                      ),
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

                /// -------- Pagination Controls --------------------------------------

                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Previous Button
                        InkWell(
                          onTap: controller.currentPage > 0
                              ? () {
                            controller.currentPage--;
                            controller.update();
                          } : null,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: Colors.transparent,
                            ),
                            child: Text('Previous'),
                          ),
                        ),
                        // First page and dots if current page is after page 1
                        if (controller.currentPage > 1) ...[
                          InkWell(
                            onTap: () {
                              controller. currentPage = 0;
                              controller.update();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.transparent,
                              ),
                              child: Text('1'),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: Colors.transparent,
                            ),
                            child: Text('...'),
                          ),
                        ],

                        // Previous page
                        if (controller.currentPage > 0)
                          InkWell(
                            onTap: () {
                              controller.currentPage = controller.currentPage - 1;
                              controller.update();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.transparent,
                              ),
                              child: Text((controller.currentPage).toString()),
                            ),
                          ),

                        // Current page (selected)
                        InkWell(
                          onTap: null, // Disable the tap
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: AppColors.green, // Selected page button color
                            ),
                            child: Text((controller.currentPage + 1).toString(),style: TextStyle(color: Colors.white,),),
                          ),
                        ),

                        // Next page if it exists
                        if (controller.currentPage < totalPages - 1)
                          InkWell(
                            onTap: () {
                              controller.currentPage++;
                              controller.update();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.transparent,
                              ),
                              child: Text((controller.currentPage + 2).toString()),
                            ),
                          ),

                        // Dots and last page if there are more pages after current
                        if (controller.currentPage < totalPages - 2) ...[
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: Colors.transparent,
                            ),
                            child: Text('...'),
                          ),
                          InkWell(
                            onTap: () {
                              controller.currentPage = totalPages - 1;
                              controller.update();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.transparent,
                              ),
                              child: Text(totalPages.toString()),
                            ),
                          ),
                        ],

                        // Next Button
                        InkWell(
                          onTap: controller.currentPage < totalPages - 1
                              ? () {
                            controller.currentPage++;
                            controller.update();
                          } : null,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),

                            ),
                            child: Text('Next'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          );
        },
      );
    });
  }
}


