import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riders/components/TBackButton.dart';
import 'package:riders/components/TButton.dart';
import 'package:riders/components/TPickerField.dart';
import 'package:riders/components/TTextField.dart';
import 'package:riders/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  final _formKey = GlobalKey<FormState>();
  final _complaintController = TextEditingController();
  final _reasonController = TextEditingController();
  List<Map<String, String>> _recentReviews = [];
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _loadRecentReviews();
  }

  Future<void> _loadRecentReviews() async {
    final prefs = await SharedPreferences.getInstance();
    final recentReviewsJson = prefs.getString('recentComplaints');
    if (recentReviewsJson != null) {
      setState(() {
        _recentReviews =
            List<Map<String, String>>.from(jsonDecode(recentReviewsJson));
      });
    }
  }

  Future<void> _saveComplaint(String reason, String complaint) async {
    final prefs = await SharedPreferences.getInstance();
    _recentReviews.insert(0, {'reason': reason, 'complaint': complaint});
    await prefs.setString('recentComplaints', jsonEncode(_recentReviews));
    setState(() {
      _clearForm();
    });
  }

  Future<void> _deleteReview(int index) async {
    final prefs = await SharedPreferences.getInstance();
    _recentReviews.removeAt(index);
    await prefs.setString('recentComplaints', jsonEncode(_recentReviews));
    setState(() {});
  }

  Future<void> _editReview(
      int index, String newReason, String newComplaint) async {
    final prefs = await SharedPreferences.getInstance();
    _recentReviews[index]['reason'] = newReason;
    _recentReviews[index]['complaint'] = newComplaint;
    await prefs.setString('recentComplaints', jsonEncode(_recentReviews));
    setState(() {
      _clearForm();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: const CustomBackButton(),
        leadingWidth: 100,
        title: const Text(
          'Complain',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                normalSpacing,
                TPickerField(
                  labelText: "Choose a reason",
                  options: const [
                    "Vehicle not clean",
                    "Vehicle arrived late",
                    "Vehicle has mechanical fault"
                  ],
                  onChanged: (value) {},
                  controller: _reasonController,
                ),
                normalSpacing,
                TTextField(
                  labelText: "Write your complain here (minimum 10 characters)",
                  controller: _complaintController,
                  maxLine: 5,
                  customErrorMessage:
                      _hasError ? "Minimum 10 characters" : null,
                ),
                bigSpacing,
                TButton(
                    label: "Submit",
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          _complaintController.text.length >= 10) {
                        _saveComplaint(
                            _reasonController.text, _complaintController.text);
                      } else {
                        setState(() {
                          _hasError = true;
                        });
                      }
                    }),
                bigSpacing,
                const Center(
                  child: Text('Recent Reviews',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _recentReviews.length,
                  itemBuilder: (context, index) {
                    final review = _recentReviews[index];
                    return ReviewItem(
                      reason: review['reason'] ?? "",
                      text: review['complaint'] ?? "",
                      onDelete: () => _deleteReview(index),
                      onEdit: () => _showEditDialog(index),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _clearForm() {
    _complaintController.text = "";
    _reasonController.text = "";
  }

  void _showEditDialog(int index) {
    final review = _recentReviews[index];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Review'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: review['reason'],
                decoration: const InputDecoration(labelText: 'Reason'),
                onChanged: (value) {
                  // Update the reason in the review
                },
              ),
              TextFormField(
                initialValue: review['complaint'],
                decoration: const InputDecoration(labelText: 'Complaint'),
                onChanged: (value) {
                  // Update the complaint in the review
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Save the edited review
                _editReview(
                    index, _reasonController.text, _complaintController.text);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class ReviewItem extends StatelessWidget {
  final String reason;
  final String text;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ReviewItem({
    super.key,
    required this.reason,
    required this.text,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryColor,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(reason),
                Text(
                  text,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(CupertinoIcons.pen),
            onPressed: onEdit,
            iconSize: 18,
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.trash,
              color: errorColor,
            ),
            onPressed: onDelete,
            iconSize: 18,
          ),
        ],
      ),
    );
  }
}
