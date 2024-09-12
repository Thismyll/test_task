import 'package:flutter/material.dart';
import '../models/photo.dart';
import '../services/api_services.dart';
import '../widgets/photo_item.dart';
import 'photo_detail_view.dart';

class GalleryView extends StatefulWidget {
  @override
  _GalleryViewState createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  late Future<List<Photo>> futurePhotos;

  @override
  void initState() {
    super.initState();
    futurePhotos = ApiService().fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      body: FutureBuilder<List<Photo>>(
        future: futurePhotos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                Photo photo = snapshot.data![index];
                return PhotoItem(photo: photo, onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhotoDetailView(photo: photo),
                    ),
                  );
                });
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load photos'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
