import 'package:flutter/material.dart';

import 'package:dhvanika/screens/player/player_screen.dart';
import 'package:dhvanika/utils/assets.dart';
import 'package:dhvanika/utils/strings.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {

  Strings strings = Strings();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // POPULAR HEADING
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Text(
              'Popular This Week',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // POPULAR
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? 20 : 0
                  ),
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.thumbnail),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(
                      right: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Song Name',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 50,
                              width: 200 - (50 + 30),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent.withOpacity(0.75),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.play_arrow,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        '243',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: VerticalDivider(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.file_download_outlined,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        '243',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: VerticalDivider(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.favorite,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        '243',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // TOP SONGS HEADING
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              'Top Songs',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // TOP SONGS
          ListView.builder(
            itemCount: 15,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PlayerScreen()));
                },
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    Assets.thumbnail,
                  ),
                ),
                title: Text(
                  'Song Name',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  '11,560 Played',
                  style: TextStyle(
                    color: Colors.black26,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.ac_unit,
                    color: Colors.black,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
