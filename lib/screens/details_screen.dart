import 'package:flutter/material.dart';
import 'package:flutter_peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no movie';

    return Scaffold(
        body: CustomScrollView(slivers: [
      _CustomAppBar(),
      SliverList(
          delegate: SliverChildListDelegate(
              [_PosterAndTitle(), _Overview(), CastingCards()]))
    ]));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Colors.indigo,
        expandedHeight: 200,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: const EdgeInsets.all(0),
            title: Container(
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 10),
                color: Colors.black12,
                child: const Text(
                  'movie.title',
                  style: TextStyle(fontSize: 16),
                )),
            background: const FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(
                  'https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
              fit: BoxFit.cover,
            )));
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(
                  'https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
              height: 150,
            )),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'movie.title',
              style: textTheme.headlineSmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              'movie.original_title',
              style: textTheme.titleMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Row(children: [
              Icon(Icons.star_outline, size: 15, color: Colors.yellow[700]),
              const SizedBox(width: 5),
              Text(
                'movie.vote_average',
                style: textTheme.bodySmall,
              )
            ]),
          ],
        ),
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Mollit cillum minim laborum mollit sit. Ut minim dolor id officia in. Amet est aliquip eiusmod nostrud anim eiusmod. Nostrud sint officia dolore sit excepteur velit velit et officia enim. Lorem officia velit dolore nostrud quis elit ut aliqua. Amet qui in laboris mollit ut nulla mollit velit Lorem quis. Exercitation aute magna nisi commodo dolor dolor sint ipsum voluptate fugiat duis est.',
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
