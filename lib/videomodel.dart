// To parse this JSON data, do
//
//     final videos = videosFromJson(jsonString);

import 'dart:convert';

Videos videosFromJson(String str) => Videos.fromJson(json.decode(str));

String videosToJson(Videos data) => json.encode(data.toJson());

class Videos {
  Videos({
     this.links,
     this.count,
     this.perPageResult,
     this.results,
    this.details,
    this.playlist,
  });

  Links links;
  int count;
  int perPageResult;
  List<Result> results;
  dynamic details;
  dynamic playlist;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
    links: Links.fromJson(json["links"]),
    count: json["count"],
    perPageResult: json["per_page_result"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    details: json["details"],
    playlist: json["playlist"],
  );

  Map<String, dynamic> toJson() => {
    "links": links.toJson(),
    "count": count,
    "per_page_result": perPageResult,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "details": details,
    "playlist": playlist,
  };
}

class Links {
  Links({
     this.next,
    this.previous,
  });

  String next;
  dynamic previous;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    next: json["next"],
    previous: json["previous"],
  );

  Map<String, dynamic> toJson() => {
    "next": next,
    "previous": previous,
  };
}

class Result {
  Result({
     this.id,
     this.profile,
     this.feeling,
     this.activity,
     this.text,
     this.createdAt,
     this.privacy,
     this.reactions,
     this.reactionsCount,
     this.commentsCount,
     this.isHidden,
     this.media,
    this.poll,
     this.videoModule,
     this.mediaPost,
     this.videoPost,
     this.profilePicturePost,
      this.coverPost,
     this.normalPost,
     this.albumPost,
     this.groupPost,
    this.group,
     this.groupBanner,
     this.pagePost,
    this.page,
     this.pageBanner,
    this.streetAdress,
    this.longitude,
    this.latitude,
     this.tags,
     this.savedPost,
     this.notificationsOn,
    this.sharedPost,
    this.friend,
    this.postAlbum,
     this.isApproved,
     this.isDeclined,
  });

  String id;
  Profile profile;
  Feeling feeling;
  Activity activity;
  String text;
  DateTime createdAt;
  Privacy privacy;
  List<Reaction> reactions;
  int reactionsCount;
  int commentsCount;
  bool isHidden;
  List<Media> media;
  dynamic poll;
  bool videoModule;
  bool mediaPost;
  bool videoPost;
  bool profilePicturePost;
  bool coverPost;
  bool normalPost;
  bool albumPost;
  bool groupPost;
  dynamic group;
  bool groupBanner;
  bool pagePost;
  dynamic page;
  bool pageBanner;
  dynamic streetAdress;
  dynamic longitude;
  dynamic latitude;
  List<dynamic> tags;
  bool savedPost;
  bool notificationsOn;
  dynamic sharedPost;
  dynamic friend;
  dynamic postAlbum;
  bool isApproved;
  bool isDeclined;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    profile: Profile.fromJson(json["profile"]),
    feeling: Feeling.fromJson(json["feeling"]),
    activity: Activity.fromJson(json["activity"]),
    text: json["text"],
    createdAt: DateTime.parse(json["created_at"]),
    privacy: privacyValues.map[json["privacy"]],
    reactions: List<Reaction>.from(json["reactions"].map((x) => Reaction.fromJson(x))),
    reactionsCount: json["reactions_count"],
    commentsCount: json["comments_count"],
    isHidden: json["is_hidden"],
    media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
    poll: json["poll"],
    videoModule: json["video_module"],
    mediaPost: json["media_post"],
    videoPost: json["video_post"],
    profilePicturePost: json["profile_picture_post"],
    coverPost: json["cover_post"],
    normalPost: json["normal_post"],
    albumPost: json["album_post"],
    groupPost: json["group_post"],
    group: json["group"],
    groupBanner: json["group_banner"],
    pagePost: json["page_post"],
    page: json["page"],
    pageBanner: json["page_banner"],
    streetAdress: json["street_adress"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    tags: List<dynamic>.from(json["tags"].map((x) => x)),
    savedPost: json["saved_post"],
    notificationsOn: json["notifications_on"],
    sharedPost: json["shared_post"],
    friend: json["friend"],
    postAlbum: json["post_album"],
    isApproved: json["is_approved"],
    isDeclined: json["is_declined"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profile": profile.toJson(),
    "feeling": feeling.toJson(),
    "activity": activity.toJson(),
    "text": text,
    "created_at": createdAt.toIso8601String(),
    "privacy": privacyValues.reverse[privacy],
    "reactions": List<dynamic>.from(reactions.map((x) => x.toJson())),
    "reactions_count": reactionsCount,
    "comments_count": commentsCount,
    "is_hidden": isHidden,
    "media": List<dynamic>.from(media.map((x) => x.toJson())),
    "poll": poll,
    "video_module": videoModule,
    "media_post": mediaPost,
    "video_post": videoPost,
    "profile_picture_post": profilePicturePost,
    "cover_post": coverPost,
    "normal_post": normalPost,
    "album_post": albumPost,
    "group_post": groupPost,
    "group": group,
    "group_banner": groupBanner,
    "page_post": pagePost,
    "page": page,
    "page_banner": pageBanner,
    "street_adress": streetAdress,
    "longitude": longitude,
    "latitude": latitude,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "saved_post": savedPost,
    "notifications_on": notificationsOn,
    "shared_post": sharedPost,
    "friend": friend,
    "post_album": postAlbum,
    "is_approved": isApproved,
    "is_declined": isDeclined,
  };
}

class Activity {
  Activity({
    this.activity,
    this.activityUnicode,
  });

  dynamic activity;
  dynamic activityUnicode;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
    activity: json["activity"],
    activityUnicode: json["activity_unicode"],
  );

  Map<String, dynamic> toJson() => {
    "activity": activity,
    "activity_unicode": activityUnicode,
  };
}

class Feeling {
  Feeling({
    this.feeling,
    this.feelingUnicode,
  });

  dynamic feeling;
  dynamic feelingUnicode;

  factory Feeling.fromJson(Map<String, dynamic> json) => Feeling(
    feeling: json["feeling"],
    feelingUnicode: json["feeling_unicode"],
  );

  Map<String, dynamic> toJson() => {
    "feeling": feeling,
    "feeling_unicode": feelingUnicode,
  };
}

class Media {
  Media({
     this.id,
     this.profile,
     this.title,
     this.description,
     this.video,
     this.vidThumbnail,
    this.shortDescription,
     this.youtubeLink,
     this.category,
     this.subCategory,
     this.createdAt,
     this.channel,
     this.post,
     this.slug,
     this.watchLater,
     this.dislikes,
     this.duration,
     this.totalViews,
  });

  String id;
  String profile;
  String title;
  String description;
  String video;
  String vidThumbnail;
  dynamic shortDescription;
  String youtubeLink;
  String category;
  String subCategory;
  DateTime createdAt;
  Channel channel;
  String post;
  String slug;
  bool watchLater;
  List<Reaction> dislikes;
  int duration;
  int totalViews;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    profile: json["profile"],
    title: json["title"],
    description: json["description"],
    video: json["video"] == null ? null : json["video"],
    vidThumbnail: json["vid_thumbnail"] == null ? null : json["vid_thumbnail"],
    shortDescription: json["short_description"],
    youtubeLink: json["youtube_link"] == null ? null : json["youtube_link"],
    category: json["category"],
    subCategory: json["sub_category"],
    createdAt: DateTime.parse(json["created_at"]),
    channel: Channel.fromJson(json["channel"]),
    post: json["post"],
    slug: json["slug"],
    watchLater: json["watch_later"],
    dislikes: List<Reaction>.from(json["dislikes"].map((x) => Reaction.fromJson(x))),
    duration: json["duration"] == null ? null : json["duration"],
    totalViews: json["total_views"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profile": profile,
    "title": title,
    "description": description,
    "video": video == null ? null : video,
    "vid_thumbnail": vidThumbnail == null ? null : vidThumbnail,
    "short_description": shortDescription,
    "youtube_link": youtubeLink == null ? null : youtubeLink,
    "category": category,
    "sub_category": subCategory,
    "created_at": createdAt.toIso8601String(),
    "channel": channel.toJson(),
    "post": post,
    "slug": slug,
    "watch_later": watchLater,
    "dislikes": List<dynamic>.from(dislikes.map((x) => x.toJson())),
    "duration": duration == null ? null : duration,
    "total_views": totalViews,
  };
}

class Channel {
  Channel({
     this.id,
     this.slug,
     this.profile,
     this.name,
     this.description,
     this.picture,
     this.createdAt,
     this.isSubscribed,
     this.totalSubscribers,
     this.totalVideos, cover,
  });

  String id;
  Slug slug;
  String profile;
  Name name;
  Description description;
  String picture;
  String cover;
  DateTime createdAt;
  bool isSubscribed;
  int totalSubscribers;
  int totalVideos;

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
    id: json["id"],
    slug: slugValues.map[json["slug"]],
    profile: json["profile"],
    name: nameValues.map[json["name"]],
    description: descriptionValues.map[json["description"]],
    picture: json["picture"] == null ? null : json["picture"],
    cover: json["cover"] == null ? null : json["cover"],
    createdAt: DateTime.parse(json["created_at"]),
    isSubscribed: json["is_subscribed"],
    totalSubscribers: json["total_subscribers"],
    totalVideos: json["total_videos"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slugValues.reverse[slug],
    "profile": profile,
    "name": nameValues.reverse[name],
    "description": descriptionValues.reverse[description],
    "picture": picture == null ? null : picture,
    "cover": cover == null ? null : cover,
    "created_at": createdAt.toIso8601String(),
    "is_subscribed": isSubscribed,
    "total_subscribers": totalSubscribers,
    "total_videos": totalVideos,
  };
}

enum Description { TESTING, LET_S_PLAY_WITH_REACT_TOGETHER_123 }

final descriptionValues = EnumValues({
  "Let's play with React together. 123": Description.LET_S_PLAY_WITH_REACT_TOGETHER_123,
  "Testing": Description.TESTING
});

enum Name { HUMAIRA_S_VLOGS, REACT_DEVELOPMENT_1234 }

final nameValues = EnumValues({
  "Humaira's vlogs": Name.HUMAIRA_S_VLOGS,
  "React Development 1234": Name.REACT_DEVELOPMENT_1234
});

enum Slug { HUMAIRA_S_VLOGS_E000, REACT_DEVELOPMENT_1234 }

final slugValues = EnumValues({
  "humaira-s-vlogs-E000": Slug.HUMAIRA_S_VLOGS_E000,
  "react-development-1234": Slug.REACT_DEVELOPMENT_1234
});

class Reaction {
  Reaction({
     this.id,
     this.createdAt,
    this.updatedAt,
     this.post,
     this.profile,
     this.type,
  });

  String id;
  DateTime createdAt;
  dynamic updatedAt;
  String post;
  String profile;
  Type type;

  factory Reaction.fromJson(Map<String, dynamic> json) => Reaction(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    post: json["post"],
    profile: json["profile"],
    type: json["type"] == null ? null : typeValues.map[json["type"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "post": post,
    "profile": profile,
    "type": type == null ? null : typeValues.reverse[type],
  };
}

enum Type { LIKE }

final typeValues = EnumValues({
  "like": Type.LIKE
});

enum Privacy { PUBLIC }

final privacyValues = EnumValues({
  "Public": Privacy.PUBLIC
});

class Profile {
  Profile({
     this.id,
     this.firstName,
     this.lastName,
     this.username,
     this.profilePicture,
  });

  String id;
  FirstName firstName;
  LastName lastName;
  Username username;
  String profilePicture;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    firstName: firstNameValues.map[json["first_name"]],
    lastName: lastNameValues.map[json["last_name"]],
    username: usernameValues.map[json["username"]],
    profilePicture: json["profile_picture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstNameValues.reverse[firstName],
    "last_name": lastNameValues.reverse[lastName],
    "username": usernameValues.reverse[username],
    "profile_picture": profilePicture,
  };
}

enum FirstName { HUMAIRA, MUHAMMAD, JAWAD }

final firstNameValues = EnumValues({
  "Humaira": FirstName.HUMAIRA,
  "Jawad": FirstName.JAWAD,
  "Muhammad": FirstName.MUHAMMAD
});

enum LastName { FAYYAZ, SAQIB, JADOON }

final lastNameValues = EnumValues({
  "Fayyaz": LastName.FAYYAZ,
  "Jadoon": LastName.JADOON,
  "Saqib": LastName.SAQIB
});

enum Username { HUMAIRAFAYYAZ010, SAQIB_IDREES95, JAWADJADOON84 }

final usernameValues = EnumValues({
  "humairafayyaz010": Username.HUMAIRAFAYYAZ010,
  "jawadjadoon84": Username.JAWADJADOON84,
  "saqib.idrees95": Username.SAQIB_IDREES95
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
