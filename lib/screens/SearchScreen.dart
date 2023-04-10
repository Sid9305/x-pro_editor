import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import '../components/colors.dart';
import '../dummy/dummyCategories.dart';
import '../dummy/dummySearch.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<DummyCategories> categories = [
    DummyCategories(categoryName: "All"),
    DummyCategories(categoryName: "Marketing"),
    DummyCategories(categoryName: "Corporate"),
    DummyCategories(categoryName: "Education"),
    DummyCategories(categoryName: "Celebration"),
    DummyCategories(categoryName: "Festival/Holiday"),
    DummyCategories(categoryName: "Social Media"),
    DummyCategories(categoryName: "Vlog"),
    DummyCategories(categoryName: "Review/Tutorial"),
    DummyCategories(categoryName: "Memes"),
  ];
  List<DummySearch> mysearch = [
    DummySearch(
        image:
            "https://i0.wp.com/www.printmag.com/wp-content/uploads/2021/02/4cbe8d_f1ed2800a49649848102c68fc5a66e53mv2.gif?fit=476%2C280&ssl=1",
        downloads: "20K",
        likes: "50K",
      category: ""
    ),
    DummySearch(
        image:
        "https://thumbs.gfycat.com/FriendlyEnormousDodo-max-1mb.gif",
        downloads: "20K",
        likes: "50K",
        category: ""
    ),
    DummySearch(
        image:
        "https://img.freepik.com/free-vector/cute-panda-sipping-boba-milk-tea-cartoon-icon-illustration-animal-food-icon-concept-isolated-flat-cartoon-style_138676-2173.jpg?w=2000",
        downloads: "25",
        likes: "500",
        category: ""
    ),
    DummySearch(
        image:
        "https://img1.ak.crunchyroll.com/i/spire2/f502d225e63d2dcf6ea9810c37048f971651090640_full.jpg",
        downloads: "250K",
        likes: "500K",
        category: ""
    ),
    DummySearch(
        image:
        "https://img.etimg.com/photo/97983351/97983351.jpg",
        downloads: "250K",
        likes: "500K",
        category: ""
    ),
    DummySearch(
        image:
        "https://www.shutterstock.com/image-illustration/little-cheetah-cute-adorable-ideal-260nw-2208498755.jpg",
        downloads: "2.2K",
        likes: "8K",
        category: ""
    ),
    DummySearch(
        image:
        "https://tierragamer.com/wp-content/uploads/2020/06/Kimetsu-no-Yaiba.jpg",
        downloads: "7K",
        likes: "9K",
        category: ""
    ),
    DummySearch(
        image:
        "https://sm.mashable.com/t/mashable_in/photo/default/8ede538fcf75a0a1bd812810edb50cb7_733r.720.jpg",
        downloads: "600",
        likes: "6.9K",
        category: ""
    ),
    DummySearch(
        image:
        "https://i0.wp.com/www.galvanizeaction.org/wp-content/uploads/2022/06/Wow-gif.gif?fit=450%2C250&ssl=1",
        downloads: "250K",
        likes: "500K",
        category: ""
    ),
    DummySearch(
        image:
        "https://media1.giphy.com/media/dyjrpqaUVqCELGuQVr/giphy.gif",
        downloads: "20K",
        likes: "50K",
        category: ""
    ),
    DummySearch(
        image:
        "https://www.gifcen.com/wp-content/uploads/2021/02/demon-slayer-gif-17.gif",
        downloads: "20K",
        likes: "50K",
        category: ""
    ),
    DummySearch(
        image:
        "https://i.pinimg.com/736x/c9/3a/58/c93a589f2975c86172b1b60b7c517340.jpg",
        downloads: "3.1K",
        likes: "5.9K",
        category: ""
    ),
    DummySearch(
        image:
        "https://media2.giphy.com/media/xThuWcaa4U4XZQDgvm/giphy.gif",
        downloads: "20K",
        likes: "50K",
        category: ""
    ),
    DummySearch(
        image:
        "https://www.thisiscolossal.com/wp-content/uploads/2018/08/Isopoly_05.gif",
        downloads: "20K",
        likes: "50K",
        category: ""
    ),
    DummySearch(
        image:
        "https://media4.giphy.com/media/q217GUnfKAmJlFcjBX/giphy.gif",
        downloads: "20K",
        likes: "50K",
        category: ""
    ),
    DummySearch(
        image:
        "https://media.tenor.com/vQ3dD3RAla0AAAAd/kurama.gif",
        downloads: "20K",
        likes: "50K",
        category: ""
    ),
    DummySearch(
        image:
        "https://www.shutterstock.com/image-illustration/baby-dog-tiny-cute-adorable-260nw-2208569943.jpg",
        downloads: "5.4K",
        likes: "7.2K",
        category: ""
    ),
    DummySearch(
        image:
        "https://media.tenor.com/ErbuHeMFBnoAAAAC/nine-tails-kurama.gif",
        downloads: "20K",
        likes: "50K",
        category: ""
    ),
    DummySearch(
        image:
        "https://media.tenor.com/ops2fSMYjz0AAAAd/gojo-gojo-satoru.gif",
        downloads: "20K",
        likes: "50K",
        category: ""
    ),
    DummySearch(
        image:
        "https://www.gifcen.com/wp-content/uploads/2022/09/hunter-x-hunter-gif-2.gif",
        downloads: "20K",
        likes: "50K",
        category: ""
    ),
    DummySearch(
        image:
        "https://i.pinimg.com/originals/a3/89/8c/a3898c5d3d0bbf93a5c2d636fcf4f893.gif",
        downloads: "20K",
        likes: "50K",
        category: ""
    ),
    DummySearch(
        image:
        "https://media0.giphy.com/media/c2jy2J8z43vhu/giphy.gif",
        downloads: "20K",
        likes: "50K",
        category: ""
    ),
    DummySearch(
        image:
        "https://i.imgflip.com/76534t.gif",
        downloads: "20K",
        likes: "50K",
        category: ""
    ),
    DummySearch(
        image:
        "https://i.gifer.com/origin/a2/a25e1a4d8e103728ceab3fc6bc1d89cb_w200.gif",
        downloads: "20K",
        likes: "50K",
        category: ""
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: const BoxDecoration(),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  hintText: "Search for Videos",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton.extended(
                          backgroundColor: shawdowColor,
                          onPressed: () {},
                          label: Text(categories[index].categoryName)),
                    );
                  }),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: mysearch.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15.0,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      height: 1000,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              mysearch[index].image),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        color: shawdowColor,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                  Colors.transparent,
                                  Colors.black,
                                ])),
                          ),
                          Positioned(
                              bottom: 15,
                              left: 0,
                              right: 0,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    child: const Icon(
                                      Icons.download,
                                      color: Colors.white,
                                    ),
                                    onTap: (){
                                      GallerySaver.saveImage(mysearch[index].image,albumName: "X-pro Editor");
                                    }
                                    ,
                                  ),
                                  Text(
                                    mysearch[index].downloads,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                   Text(
                                    mysearch[index].likes,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
