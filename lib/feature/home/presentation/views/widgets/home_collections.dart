import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/get_collections/get_collections.dart';
import '../../view_models/get_collection_cubit/get_collection_cubit.dart';

class HomeCollections extends StatefulWidget {
  const HomeCollections({super.key});

  @override
  State<HomeCollections> createState() => _HomeCollectionsState();
}

class _HomeCollectionsState extends State<HomeCollections> {
  late ScrollController _scrollController;
  bool _isAtStart = true;
  bool _isAtEnd = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _isAtStart = _scrollController.position.atEdge &&
          _scrollController.position.pixels == 0;
      _isAtEnd = _scrollController.position.maxScrollExtent -
              _scrollController.position.pixels <
          200;
    });
  }

  void _scrollLeft() {
    if (!_isAtStart) {
      _scrollController.animateTo(
        _scrollController.position.pixels - MediaQuery.of(context).size.width,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void _scrollRight() {
    if (!_isAtEnd) {
      _scrollController.animateTo(
        _scrollController.position.pixels + MediaQuery.of(context).size.width,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Collections',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            Opacity(
              opacity: _isAtStart ? 0.3 : 1.0,
              child: IconButton(
                icon: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.arrow_back, color: Colors.black),
                ),
                onPressed: _isAtStart ? null : _scrollLeft,
              ),
            ),
            Expanded(
              child: BlocBuilder<GetCollectionCubit, GetCollectionState>(
                builder: (context, state) {
                  if (state is GetCollectionLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetCollectionFailure) {
                    return Center(child: Text(state.errMessage));
                  } else if (state is GetCollectionSuccess) {
                    return CollectionListView(
                      collections: state.collections,
                      scrollController: _scrollController,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
            Opacity(
              opacity: _isAtEnd ? 0.5 : 1.0,
              child: IconButton(
                icon: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.arrow_forward, color: Colors.black),
                ),
                onPressed: _isAtEnd ? null : _scrollRight,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CollectionListView extends StatelessWidget {
  final List<GetCollections> collections;
  final ScrollController scrollController;

  const CollectionListView({
    super.key,
    required this.collections,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: collections.length,
        itemBuilder: (BuildContext context, int index) {
          final collection = collections[index];
          return CollectionItem(collection: collection);
        },
      ),
    );
  }
}

class CollectionItem extends StatelessWidget {
  final GetCollections collection;

  const CollectionItem({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: collection.image!.url!,
              height: 170,
              memCacheWidth: 170,
              memCacheHeight: 170,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Text(
            collection.title!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
