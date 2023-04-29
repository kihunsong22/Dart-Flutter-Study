import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import '../models/webtoon_detail_model.dart';
import '../services/api_services.dart';
import '../widgets/episodes.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<List<WebtoonEpisodeModel>> episodes;
  late Future<WebtoonDetailModel> webtoon = ApiService.getToonById(widget.id);
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (likedToons.contains(widget.id) == true) {
        // user has liked this toon
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList('likedToons', []);
    }
    developer.log('likedToons: $likedToons');
  }

  @override
  void initState() {
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatesetEpisodesById(widget.id);
    initPrefs();
    // WidgetsFlutterBinding.ensureInitialized();
  }

  onHeartTap() async {
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (isLiked) {
        likedToons.remove(widget.id);
      } else {
        likedToons.add(widget.id);
      }
      await prefs.setStringList('likedToons', likedToons);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: onHeartTap,
            icon: Icon(
              // Icons.favorite_outline_outlined,
              isLiked ? Icons.favorite : Icons.favorite_outline,
            ),
          )
        ],
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.id,
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            offset: const Offset(8, 8),
                            color: Colors.black.withOpacity(0.5),
                          )
                        ]),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(widget.thumb),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            FutureBuilder(
              future: webtoon,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!.about,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${snapshot.data!.genre} / ${snapshot.data!.age}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  );
                }
                return const Text('...');
              },
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder(
              future: episodes,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      for (var episode in snapshot.data!)
                        Episode(episode: episode, webtoonId: widget.id),
                    ],
                  );
                }
                return Container();
              },
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
