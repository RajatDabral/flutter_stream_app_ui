import 'package:flutter/material.dart';
import 'package:music_app_ui/data/model/live_battles.dart';

import './model/models.dart';

class DataModel with ChangeNotifier {
  List<Show> get shows => _shows;
  List<Genres> get trends => _trendingGenres;
  List<String> get performamce => _performance;
  List<LiveBattles> get liveBattles => _liveTeamBattle;
  List<Map<String, String>> get episodeList => _episodeList;

  ///TV SHOWS
  ///
  List<Show> _shows = [
    Show(
      name: 'Singing Stars',
      battleType: 'Team Battle',
      imageUrl:
          "https://cdn.pixabay.com/photo/2015/12/03/09/33/microphone-1074362__340.jpg",
      seasons: ['Season 1', 'Season 2', 'Season 3'],
    ),
    Show(
      name: 'Rising Stars',
      battleType: 'Team Battle',
      imageUrl:
          "https://cdn.pixabay.com/photo/2014/07/09/12/17/live-concert-388160_960_720.jpg",
      seasons: ['Season 1', 'Season 2', 'Season 3', 'Season 4'],
    ),
    Show(
      name: 'Battle Of Queens',
      battleType: '1 vs 1 Battle',
      imageUrl:
          "https://cdn.pixabay.com/photo/2018/02/22/23/07/people-3174228_960_720.jpg",
      seasons: ['Season 1', 'Season 2'],
    ),
  ];

  ///Trending
  ///

  List<Genres> _trendingGenres = [
    Genres(
      name: 'Hip-Hop kings',
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/04/18/16/01/girl-5059757_960_720.jpg',
    ),
    Genres(
      name: 'Remix Battle',
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/04/29/17/11/dj-745740_960_720.jpg',
    ),
    Genres(
      name: 'Top Classical',
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/04/07/18/06/microphone-5014373__340.jpg',
    ),
    Genres(
      name: 'Indie Pop',
      imageUrl:
          "https://cdn.pixabay.com/photo/2014/07/09/12/17/live-concert-388160_960_720.jpg",
    ),
  ];

  ///Top Preformance

  List<String> _performance = [
    "https://cdn.pixabay.com/photo/2014/07/09/12/17/live-concert-388160_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/05/24/11/20/dance-1412144_960_720.jpg",
    "https://cdn.pixabay.com/photo/2015/02/28/15/59/design-653712_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/03/27/20/49/women-1284228_960_720.jpg",
    "https://cdn.pixabay.com/photo/2020/05/21/05/28/man-5199237_960_720.jpg",
  ];

  ///Live Battles
  List<LiveBattles> _liveTeamBattle = [
    LiveBattles(
      name: 'Rising Star S1',
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/04/07/18/06/microphone-5014373__340.jpg',
    ),
    LiveBattles(
      name: 'Dance Heros S8',
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/05/21/05/28/man-5199237_960_720.jpg',
    )
  ];

  ///Episode Data Model
  ///
  final _episodeList = [
    {
      'ep': 'Ep 1',
      'title': 'Introducton',
      'info':
          'Introducing Team A and Team B for the show, checkout their style',
      'firstImage':
          "https://cdn.pixabay.com/photo/2020/05/21/05/28/man-5199237_960_720.jpg",
      'secondImage':
          "https://cdn.pixabay.com/photo/2016/05/24/11/20/dance-1412144_960_720.jpg",
    },
    {
      'ep': 'Ep 2',
      'title': 'FreeStyle Dance',
      'info':
          'Mind blowning episode of FreeStyle dance form, grab a chair and dont leave',
      'firstImage':
          "https://cdn.pixabay.com/photo/2014/07/09/12/17/live-concert-388160_960_720.jpg",
      'secondImage':
          "https://cdn.pixabay.com/photo/2020/04/18/16/01/girl-5059757_960_720.jpg",
    },
    {
      'ep': 'Ep 3',
      'title': 'Face Off',
      'info':
          'Which Team will win the Face off, crazy moves, crazy style, Teams at their best',
      'firstImage':
          "https://cdn.pixabay.com/photo/2020/05/21/05/28/man-5199237_960_720.jpg",
      'secondImage':
          "https://cdn.pixabay.com/photo/2016/05/24/11/20/dance-1412144_960_720.jpg",
    },
    {
      'ep': 'Ep 4',
      'title': 'B-Boying',
      'info':
          'Check out the latest episode, if you can keep your eyes from falling. Stay Tuned.',
      'firstImage':
          "https://cdn.pixabay.com/photo/2014/07/09/12/17/live-concert-388160_960_720.jpg",
      'secondImage':
          "https://cdn.pixabay.com/photo/2020/04/18/16/01/girl-5059757_960_720.jpg",
    },
  ];
}
