import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final TextEditingController _commentController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  CollectionReference get commentsCollection => FirebaseFirestore.instance
      .collection('comments');

  void _addComment() async {
    if (_commentController.text.trim().isEmpty) return;
    try {
      await commentsCollection.add({
        'comment': _commentController.text.trim(),
        'userId': user?.uid,
        'userEmail': user?.email,
        'productId': 'eclipse_v2',
        'timestamp': FieldValue.serverTimestamp(),
      });
      _commentController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add comment')),
      );
    }
  }

  void _deleteComment(String id) async {
    try {
      await commentsCollection.doc(id).delete();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete comment')),
      );
    }
  }

  void _updateComment(String id, String newComment) async {
    try {
      await commentsCollection.doc(id).update({'comment': newComment});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update comment')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var imageUrl =
        'https://skiexchange.co.uk/cdn/shop/products/leonardo-2000--1.jpg?v=1657985794&width=640';
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        title: Text(
          'Product Details',
          style: TextStyle(
            color: Theme.of(context).appBarTheme.foregroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).appBarTheme.foregroundColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Product Image Card
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(imageUrl, fit: BoxFit.contain),
              ),
            ),

            SizedBox(height: 16),

            // Product Details Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Eclipse V2',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).appBarTheme.foregroundColor,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border, color: Colors.pink),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$165.00',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF152e1a),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).appBarTheme.foregroundColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Premium polarized sunglasses designed for optimal sun protection and style. Perfect for outdoor activities.',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDetailBox('Height', '4 cm'),
                      _buildDetailBox('Width', '15 cm'),
                      _buildDetailBox('Material', 'Glass'),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Comments Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Comments',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).appBarTheme.foregroundColor,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Theme.of(context).brightness == Brightness.dark ? Colors.grey[600]! : Colors.grey[200]!),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _commentController,
                            decoration: InputDecoration(
                              hintText: 'Add a comment...',
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(4),
                          child: IconButton(
                            icon: Icon(Icons.send, color: Color(0xFF152e1a)),
                            onPressed: _addComment,
                            style: IconButton.styleFrom(
                              backgroundColor: Color(0xFF152e1a).withOpacity(0.1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 200,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: commentsCollection.snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(child: Text('Comments unavailable'));
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Center(
                            child: Text(
                              'No comments yet. Be the first to comment!',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final doc = snapshot.data!.docs[index];
                            final comment = doc['comment'];
                            final userEmail = doc['userEmail'] ?? 'Anonymous';
                            final isOwner = doc['userId'] == user?.uid;
                            return Container(
                              margin: EdgeInsets.only(bottom: 8),
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[50],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        userEmail,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF152e1a),
                                        ),
                                      ),
                                      if (isOwner)
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.edit, size: 16, color: Colors.grey[600]),
                                              onPressed: () async {
                                                final controller = TextEditingController(text: comment);
                                                final result = await showDialog<String>(
                                                  context: context,
                                                  builder: (context) => AlertDialog(
                                                    title: Text('Edit comment'),
                                                    content: TextField(
                                                      controller: controller,
                                                      autofocus: true,
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () => Navigator.pop(context),
                                                        child: Text('Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () => Navigator.pop(context, controller.text),
                                                        child: Text('Save'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                                if (result != null && result.trim().isNotEmpty) {
                                                  _updateComment(doc.id, result.trim());
                                                }
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.delete, size: 16, color: Colors.red[400]),
                                              onPressed: () => _deleteComment(doc.id),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    comment,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context).appBarTheme.foregroundColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
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

  Widget _buildDetailBox(String label, String value) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).appBarTheme.foregroundColor,
            ),
          ),
        ],
      ),
    );
  }
}