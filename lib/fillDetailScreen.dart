import 'package:flutter/material.dart';

import 'orderReview.dart';

class FillDetailsScreen extends StatefulWidget {
  @override
  _FillDetailsScreenState createState() => _FillDetailsScreenState();
}

class _FillDetailsScreenState extends State<FillDetailsScreen> {
  int totalGuests = 120;
  double pricePerPlate = 240;
  double originalPrice = 299;
  int minGuests = 10;
  int maxGuests = 1500;

  // Date and Time Variables
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 14, minute: 0);

  // Function to pick a date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  // Function to pick a time
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5F6FB),
      appBar: AppBar(
        backgroundColor: Color(0XFFFFFFFF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Fill Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.cable_outlined, color: Colors.purple),
              title: Text(
                "South Indian Breakfast",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              trailing: Icon(Icons.edit, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Occasion",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 16), // Reduce spacing here
                          Expanded(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              // Ensures proper alignment
                              value: "Birthday",
                              underline: SizedBox(),
                              // Removes default underline for cleaner look
                              items: ["Birthday", "Wedding", "Corporate"]
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                // Add functionality if needed
                              },
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Color(0XFFF0F0F0),
                        height: 1,
                        thickness: 2,
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                  Text("Date and Time"),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.calendar_today,
                            color: Color(0XFF6318AF),
                          ),
                          label:
                              Text("${selectedDate.toLocal()}".split(' ')[0]),
                          onPressed: () => _selectDate(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // Reduced curve
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 16), // Increased height
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.access_time,
                            color: Color(0XFF6318AF),
                          ),
                          label: Text("${selectedTime.format(context)}"),
                          onPressed: () => _selectTime(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // Reduced curve
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 16), // Increased height
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Price Per Plate:",
                        style: TextStyle(fontSize: 16),
                      ),
                      Spacer(),
                      Text(
                        "20% ↓ ₹${pricePerPlate.toStringAsFixed(0)}",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        " ₹${originalPrice.toStringAsFixed(0)}",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Divider(
                    color: Color(0XFFF0F0F0),
                    height: 1,
                    thickness: 2,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Total Guests",
                        style: TextStyle(fontSize: 16),
                      ),
                      Spacer(),
                      // Move the total guests number between the remove and add buttons
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0XFFF6F6F6)),
                        child: IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: Color(0XFF6318AF),
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              if (totalGuests > minGuests) totalGuests--;
                            });
                          },
                        ),
                      ),
                      Text(
                        "$totalGuests",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0XFFFBDAEA)),
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Color(0XFF6318AF),
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              if (totalGuests < maxGuests) totalGuests++;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: totalGuests.toDouble(),
                    min: minGuests.toDouble(),
                    max: maxGuests.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        totalGuests = value.toInt();
                      });
                    },
                  ),
                  Text(
                    "✨ DYNAMIC PRICING: more guests, more savings.",
                    style: TextStyle(color: Colors.purple),
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFF6318AF), // Button color
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderReviewScreen()),
                  );
                },
                child: Text(
                  "Order Review",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
