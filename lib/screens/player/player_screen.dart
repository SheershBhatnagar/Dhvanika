import 'package:flutter/material.dart';

import 'package:dhvanika/utils/assets.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.ac_unit,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 50),

            // SONG THUMBNAIL
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                Assets.thumbnail,
                height: 250,
                width: 250,
              ),
            ),

            const SizedBox(height: 50),

            // SONG NAME
            Text(
              'Song Name',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            // SONG ARTIST NAME
            Text(
              'Song Artist',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black26,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 50),

            // SEEKBAR
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '01:32',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Expanded(
                  child: Slider(
                    value: 92,
                    onChanged: (value) {},
                    min: 0,
                    max: 222,
                    activeColor: Colors.black,
                    inactiveColor: Colors.black26,
                  ),
                ),

                Text(
                  '03:42',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),

            // PLAYER CONTROLS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous_rounded,
                    size: 50,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow_rounded,
                    size: 50,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next_rounded,
                    size: 50,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
