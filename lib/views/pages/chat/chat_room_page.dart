import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/firebase_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/controllers/chat_room_controller.dart';
import 'package:duuit/services/auth.dart';
import 'package:duuit/services/db/db_6.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ChatRoomPage extends StatelessWidget {
  ChatRoomPage({Key? key}) : super(key: key);

  final ChatRoomPageController1 _controller1 = Get.find();
  final ChatRoomPageController2 _controller2 = Get.find();
  final _chatPageController = Get.put(ChatPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        toolbarHeight: AppSizes.height10 * 6.5,
        backgroundColor: ColorConst.primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
          statusBarColor: ColorConst.primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(AppSizes.height10 * 3),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              StringConst.messages,
              style: TextStyle(
                fontSize: AppSizes.height10 * 2.7,
                color: ColorConst.whiteColor,
                fontWeight: FontWeight.bold,
                fontFamily: StringConst.nunitoSansFont,
              ),
            ),
            Icon(
              Icons.telegram_outlined,
              size: AppSizes.height10 * 4,
              color: ColorConst.greyColor,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Obx(
          () {
            return _controller1.isEmpty()
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.height10 * 1.5,
                      vertical: AppSizes.height10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          StringConst.newBuddies,
                          style: TextStyle(
                            fontSize: AppSizes.height10 * 2.2,
                            color: ColorConst.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: StringConst.nunitoSansFont,
                          ),
                        ),
                        SizedBox(height: AppSizes.height10 * 1.5),
                        Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _controller1.length(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  GestureDetector(
                                    child: Image.asset(
                                      _controller1.avatarImageConst(index),
                                      height: AppSizes.height10 * 6,
                                    ),
                                    onTap: () async {
                                      // await _chatPageController
                                      //     .getChats(_controller1.userId(index));
                                      _chatPageController.saveBuddies1(
                                          _controller1, index);
                                      Get.to(() => ChatPage(chatRoom: false));
                                    },
                                  ),
                                  SizedBox(width: AppSizes.width10),
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(height: AppSizes.height10 * 1.5),
                        Text(
                          StringConst.conversation,
                          style: TextStyle(
                            fontSize: AppSizes.height10 * 2.2,
                            color: ColorConst.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: StringConst.nunitoSansFont,
                          ),
                        ),
                        SizedBox(height: AppSizes.height10 * 1.5),
                        Expanded(
                          flex: 9,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _controller2.length(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  const Divider(thickness: 2, height: 0),
                                  ListTile(
                                    leading: Image.asset(
                                      _controller2.avatarImageConst(index),
                                      height: AppSizes.height10 * 6,
                                    ), //
                                    title: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2, bottom: 7),
                                      child: Text(
                                        _controller2.userName(index),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    subtitle: Text(
                                      _controller2.userDescription(index),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    onTap: () async {
                                      // await _chatPageController
                                      //     .getChats(_controller2.userId(index));
                                      _chatPageController.saveBuddies2(
                                          _controller2, index);
                                      Get.to(() => ChatPage(chatRoom: true));
                                    },
                                  ),
                                  const Divider(thickness: 2, height: 0),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  final bool chatRoom;
  const ChatPage({Key? key, required this.chatRoom}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatPageController _chatPageController = Get.find();
  final AuthController _authController = Get.find();

  Stream<QuerySnapshot>? _stream;
  final messageTextEditingController = TextEditingController();
  final _focusNode = FocusNode();
  late String chat;
  bool chatRoom() {
    return widget.chatRoom;
  }

  late bool chatRoomOrNot;
  Widget messages() {
    return StreamBuilder<QuerySnapshot>(
      stream: _stream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                reverse: true,
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data!.docs[index];

                  return ds[FirebaseConst.messageBy] == _authController.userId
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 15),
                              margin: const EdgeInsets.only(
                                  top: 10, bottom: 5, left: 90, right: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorConst.greenColor,
                              ),
                              child: Text(
                                ds[FirebaseConst.message],
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 15),
                              margin: const EdgeInsets.only(
                                  top: 10, bottom: 5, left: 12, right: 90),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorConst.greyColor,
                              ),
                              child: Text(
                                ds[FirebaseConst.message],
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                },
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }

  getAndSetMessage() async {
    if (messageTextEditingController.text != '') {
      setState(() {
        chat = messageTextEditingController.text;
      });

      if (chatRoomOrNot == false) {
        await DbController6().saveSelfChatRooms(_chatPageController.userId());
        await DbController6().saveChatRooms(_chatPageController.userId());
      }
      setState(() {
        chatRoomOrNot = true;
      });
      messageTextEditingController.clear();

      await DbController6().saveSelfChats(
          _chatPageController.userId(), chat, _authController.userId);
      await DbController6().saveChats(
          _chatPageController.userId(), chat, _authController.userId);

      setState(() {});
      _stream =
          await _chatPageController.getChats(_chatPageController.userId());
      setState(() {});
    }
  }

  @override
  void initState() {
    doThis();
    chatRoomOrNot = chatRoom();

    super.initState();
  }

  doThis() async {
    setState(() {});

    _stream = await _chatPageController.getChats(_chatPageController.userId());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        toolbarHeight: AppSizes.height10 * 6.5,
        backgroundColor: ColorConst.primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
          statusBarColor: ColorConst.primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(AppSizes.height10 * 3),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              child: Image.asset(
                _chatPageController.avatarImageConst(),
                height: AppSizes.height10 * 6,
              ),
              onTap: () {},
            ),
            Text(
              _chatPageController.userName(),
              style: TextStyle(
                fontSize: AppSizes.height10 * 2.7,
                color: ColorConst.whiteColor,
                fontWeight: FontWeight.bold,
                fontFamily: StringConst.nunitoSansFont,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: messages(),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: TextFormField(
                focusNode: _focusNode,
                textAlign: TextAlign.start,
                controller: messageTextEditingController,
                keyboardType: TextInputType.name,
                autofocus: false,
                decoration: InputDecoration(
                  filled: true,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send, color: ColorConst.greyColor),
                    splashRadius: 25,
                    onPressed: () {
                      getAndSetMessage();
                    },
                  ),
                  prefixIcon:
                      const Icon(Icons.chat, color: ColorConst.greyColor),
                  hintText: 'Type a message',
                  hintStyle: const TextStyle(color: ColorConst.greyColor),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
