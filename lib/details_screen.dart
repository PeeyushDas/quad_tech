import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'movie_model.dart';

class DetailsScreen extends StatelessWidget {
  final Show show;

  const DetailsScreen({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: show.imageUrl ?? 'https://via.placeholder.com/400',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey[900],
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      show.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (show.type != null)
                      Text(
                        'Type: ${show.type}',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                        ),
                      ),
                    if (show.status != null)
                      Text(
                        'Status: ${show.status}',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                        ),
                      ),
                    if (show.premiered != null)
                      Text(
                        'Premiered: ${show.premiered}',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                        ),
                      ),
                    const SizedBox(height: 10),
                    if (show.genres.isNotEmpty)
                      Wrap(
                        spacing: 8,
                        children: show.genres
                            .map((genre) => Chip(
                                  label: Text(genre),
                                  backgroundColor: Colors.red[700],
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                ))
                            .toList(),
                      ),
                    const SizedBox(height: 10),
                    if (show.rating != null)
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.yellow, size: 24),
                          const SizedBox(width: 5),
                          Text(
                            '${show.rating?.toStringAsFixed(1)}/10',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 20),
                    const Text(
                      'Summary',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      show.summary ?? 'No summary available',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
