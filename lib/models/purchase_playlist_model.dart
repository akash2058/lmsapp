class MyPlayListModel {
  bool? success;
  Data? data;
  String? message;

  MyPlayListModel({this.success, this.data, this.message});

  MyPlayListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? totalPlayDuration;
  List<Playlist>? playlist;

  Data({this.totalPlayDuration, this.playlist});

  Data.fromJson(Map<String, dynamic> json) {
    totalPlayDuration = json['total_play_duration'];
    if (json['playlist'] != null) {
      playlist = <Playlist>[];
      json['playlist'].forEach((v) {
        playlist!.add(Playlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_play_duration'] = totalPlayDuration;
    if (playlist != null) {
      data['playlist'] = playlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Playlist {
  int? id;
  String? title;
  String? timeDuration;
  List<Video>? videos;

  Playlist({this.id, this.title, this.timeDuration, this.videos});

  Playlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    timeDuration = json['time_duration'];
    if (json['videos'] != null) {
      videos = <Video>[];
      json['videos'].forEach((v) {
        videos!.add(Video.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['time_duration'] = timeDuration;
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Video {
  int? videoId;
  String? videoTitle;
  String? videoDuration;

  Video({this.videoId, this.videoTitle, this.videoDuration});

  Video.fromJson(Map<String, dynamic> json) {
    videoId = json['video_id'];
    videoTitle = json['video_title'];
    videoDuration = json['video_duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['video_id'] = videoId;
    data['video_title'] = videoTitle;
    data['video_duration'] = videoDuration;
    return data;
  }
}
