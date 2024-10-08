import 'package:flutter/material.dart';
import 'provider/my-provider.dart';
import 'package:provider/provider.dart';

import 'componants/now_playing_componant.dart';
import 'componants/result_search_componant.dart';
import 'models/movie_response.dart';

class WatchlistScreen extends StatelessWidget {
  Color darkGray = Color(0xFF282A28);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProviderApp>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkGray,
        toolbarHeight: 70,
        title: Text('Watch List'),
      ),
      body: provider.watchlist.isEmpty
          ? Center(child: Text('Your watchlist is empty.'))
          : ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 0.7,
                  color: Colors.grey,
                );
              },
              itemCount: provider.watchlist.length,
              itemBuilder: (context, index) {
                MovieDitails movie = provider.watchlist[index];
                return ResultSearchWidget(movie: movie);
              },
            ),
    );
  }
}
