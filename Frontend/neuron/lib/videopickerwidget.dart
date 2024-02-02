import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';

import 'output.dart';

class VideoPickerWidget extends StatefulWidget {
  @override
  _VideoPickerWidgetState createState() => _VideoPickerWidgetState();
}

class _VideoPickerWidgetState extends State<VideoPickerWidget> {
  File? _video;
  String? _videoName;

  Future<void> _pickVideo() async {
    final picker = ImagePicker();
    final pickedVideo = await picker.pickVideo(source: ImageSource.gallery);

    setState(() {
      if (pickedVideo != null) {
        _video = File(pickedVideo.path);
        _videoName = pickedVideo.path.split('/').last;
      } else {
        print('No video selected.');
      }
    });
  }

  Future<void> _sendApiRequest() async {
    if (_video != null) {
      String apiUrl = 'http://16.171.151.23/process_video';
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        _video!.path,
      ));

      try {
        var response = await request.send();
        if (response.statusCode == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FirebaseVideoPage(videoName: _videoName),
            ),
          );
          Fluttertoast.showToast(msg: "Detection of regions is Done");
        } else {
          print('API request failed with status code ${response.statusCode}');
        }
      } catch (error) {
        print('API request error: $error');
      }
    } else {
      Fluttertoast.showToast(msg: "Select a video to detect");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/video_picker.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: _video != null
                    ? Column(
                  children: [
                    Text('Video Name: $_videoName'),
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Chewie(
                          controller: ChewieController(
                            videoPlayerController:
                            VideoPlayerController.file(_video!),
                            autoInitialize: true,
                            looping: false,
                            aspectRatio: VideoPlayerController.file(_video!)
                                .value
                                .aspectRatio,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                    : SizedBox.shrink(),
              ),
              ElevatedButton(
                onPressed: _pickVideo,
                child: Text('Select Video'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _sendApiRequest,
                child: Text('Predict'),
              ),
              SizedBox(height: 8.0),
              Text(
                'Tap the predict button only once',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
