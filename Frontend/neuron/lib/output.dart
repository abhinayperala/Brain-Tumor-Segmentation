import 'package:flutter/material.dart';

import 'package:neuron/videopickerwidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prediction Results',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: FirebaseVideoPage(),
    );
  }
}

class FirebaseVideoPage extends StatefulWidget {
  final String? videoName; // Add the videoName parameter

  FirebaseVideoPage({this.videoName});
  @override
  _FirebaseVideoPageState createState() => _FirebaseVideoPageState();
}

class _FirebaseVideoPageState extends State<FirebaseVideoPage> {

  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    loadVideo();
  }

  Future<void> loadVideo() async {
    final videoUrl =
    await storage.ref('videos/output.mp4').getDownloadURL();

    videoPlayerController = VideoPlayerController.network(videoUrl);
    await videoPlayerController?.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: false,
      looping: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );

    setState(() {});
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction Result'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text('The Identified tumor region from the video'),
            AspectRatio(
              aspectRatio:
              videoPlayerController?.value.aspectRatio ?? 16 / 9,
              child: Container(
                width: double.infinity,
                child: chewieController != null &&
                    chewieController!.videoPlayerController.value
                        .isInitialized
                    ? Chewie(controller: chewieController!)
                    : CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}