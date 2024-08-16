import 'dart:io';

import 'package:agricstock/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _messageController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Map<String, dynamic>? _replyingTo;
  late User _currentUser;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    _currentUser = _auth.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forum Chat')),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('messages')
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = snapshot.data!.docs[index];
                    bool isCurrentUser = document['userId'] == _currentUser.uid;
                    return GestureDetector(
                      onLongPressStart: (LongPressStartDetails details) =>
                          _showMessageOptions(
                              context, document, details.globalPosition),
                      child: Align(
                        alignment: isCurrentUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isCurrentUser
                                ? Colors.blue[100]
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(document['text']),
                              if (document['imageUrl'] != null &&
                                  document['imageUrl'] != '')
                                Image.network(
                                  document['imageUrl'],
                                  height: 150,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Text('Error loading image');
                                  },
                                ),
                              if (document['replyTo'] != null)
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                      'Replying to: ${document['replyTo']}'),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          if (_replyingTo != null)
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Replying to:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(_replyingTo!['text']),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _replyingTo = null;
                      });
                    },
                  ),
                ],
              ),
            ),
          Container(
            // color: Colors.red,
            margin: EdgeInsets.only(left: 6.h),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(
                          30.h,
                        )),
                    child: TextField(
                      controller: _messageController,
                      maxLines: 3,
                      minLines: 1,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 12.h),
                          hintText: 'Enter message',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                IconButton.filledTonal(
                  color: Colors.white,
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(137, 6, 95, 70))),
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_messageController.text.isEmpty) {
                      return;
                    }
                    _sendMessage;
                  },
                ),
                IconButton.filledTonal(
                  color: Colors.white,
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(137, 6, 95, 70))),
                  icon: const Icon(Icons.image),
                  onPressed: _uploadImage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showMessageOptions(
      BuildContext context, DocumentSnapshot document, Offset tapPosition) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        tapPosition & const Size(40, 40), // Arbitrary size, but it works
        Offset.zero & overlay.size,
      ),
      items: [
        PopupMenuItem(
          child: const Text('Delete'),
          onTap: () => _deleteMessage(document.id),
        ),
        PopupMenuItem(
          child: const Text('Reply'),
          onTap: () => _replyToMessage(document),
        ),
      ],
    );
  }

  void _deleteMessage(String messageId) async {
    await _firestore.collection('messages').doc(messageId).delete();
  }

  void _replyToMessage(DocumentSnapshot document) {
    setState(() {
      _replyingTo = {
        'text': document['text'],
        'userId': document['userId'],
      };
    });
  }

  void _sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _firestore.collection('messages').add({
        'text': _messageController.text,
        'imageUrl': '',
        'timestamp': FieldValue.serverTimestamp(),
        'replyTo': _replyingTo != null ? _replyingTo!['text'] : null,
        'replyToUserId': _replyingTo != null ? _replyingTo!['userId'] : null,
        'userId': _currentUser.uid,
      });
      _messageController.clear();
      setState(() {
        _replyingTo = null;
      });
    }
  }

  void _uploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child('chat_images/${DateTime.now().toString()}');
      await ref.putFile(File(pickedFile.path));
      final url = await ref.getDownloadURL();

      await _firestore.collection('messages').add({
        'text': 'Image',
        'imageUrl': url,
        'timestamp': FieldValue.serverTimestamp(),
        'replyTo': _replyingTo != null ? _replyingTo!['text'] : null,
        'replyToUserId': _replyingTo != null ? _replyingTo!['userId'] : null,
        'userId': _currentUser.uid,
      });

      setState(() {
        _replyingTo = null;
      });
    }
  }
}
