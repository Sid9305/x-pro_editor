import 'package:Xpro_editor/components/colors.dart';
import 'package:Xpro_editor/dummy/dummyVideoScroll.dart';
import 'package:flutter/material.dart';

class MixScreen extends StatefulWidget {
  const MixScreen({Key? key}) : super(key: key);

  @override
  State<MixScreen> createState() => _MixScreenState();
}

class _MixScreenState extends State<MixScreen> {
  PageController controller = PageController(initialPage: 0);

  List<DummyVideo> myVid = [
    DummyVideo(
        likes: "12K",
        messages: "1.2k",
        shares: "209",
        image: "assets/img_1.png",
        title: "BLAH BLAH",
        duration: "0:02",
        ratio: "3:1"),
    DummyVideo(
        likes: "12K",
        messages: "1.2k",
        shares: "209",
        image: "assets/img.png",
        title: "HUI HUI",
        duration: "0:02",
        ratio: "3:1"),
    DummyVideo(
        likes: "12K",
        messages: "1.2k",
        shares: "209",
        image: "assets/sunrise.jpg",
        title: "NIGGGGAAAA",
        duration: "0:02",
        ratio: "3:1"),
    DummyVideo(
        likes: "12K",
        messages: "1.2k",
        shares: "209",
        image: "assets/img_1.png",
        title: "SHESSHHH",
        duration: "0:02",
        ratio: "3:1"),
    DummyVideo(
        likes: "12K",
        messages: "1.2k",
        shares: "209",
        image: "assets/img.png",
        title: "TF BHAI",
        duration: "0:02",
        ratio: "3:1"),
    DummyVideo(
        likes: "12K",
        messages: "1.2k",
        shares: "209",
        image: "assets/sunrise.jpg",
        title: "HUI HUI",
        duration: "0:02",
        ratio: "3:1"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: PageView.builder(
            controller: controller,
            itemCount: myVid.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int itemIndex) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  image: DecorationImage(
                      image: AssetImage(myVid[itemIndex].image),
                      fit: BoxFit.cover),
                ),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 40,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              myVid[itemIndex].likes,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.message_rounded,
                                color: Colors.white,
                                size: 40,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              myVid[itemIndex].messages,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.ios_share,
                                color: Colors.white,
                                size: 40,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              myVid[itemIndex].shares,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                myVid[itemIndex].title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.lock_clock,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                myVid[itemIndex].duration,
                                style: const TextStyle(color: Colors.white),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.rectangle,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                myVid[itemIndex].ratio,
                                style: const TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${myVid[itemIndex].shares} downloads',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Container(
                                width: 90,
                                child: FloatingActionButton.extended(
                                    onPressed: () {}, label: const Text("USE")),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            }));
  }
}
