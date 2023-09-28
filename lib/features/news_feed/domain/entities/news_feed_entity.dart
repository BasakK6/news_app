import 'package:equatable/equatable.dart';

class NewsFeedEntity extends Equatable {
  final String? status;
  final int? totalResults;
  final List<ArticlesEntity>? articles;

  const NewsFeedEntity({this.status, this.totalResults, this.articles});

  @override
  List<Object?> get props => [status, totalResults, articles];
}

class ArticlesEntity extends Equatable {
  final SourceEntity? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticlesEntity(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  String get timeAgo {
    // Parse the publishedAt String into a DateTime object
    if (publishedAt == null) {
      return "Unknown";
    }
    final DateTime now = DateTime.now();
    final DateTime parsedTime = DateTime.parse(publishedAt!).toLocal();

    // Calculate the time difference
    final Duration difference = now.difference(parsedTime);

    if (difference.inDays > 0) {
      // If the difference is in days
      return '${difference.inDays} ${difference.inDays == 1 ? 'Day' : 'Days'} ago';
    } else if (difference.inHours > 0) {
      // If the difference is in hours
      return '${difference.inHours} ${difference.inHours == 1 ? 'Hour' : 'Hours'} ago';
    } else if (difference.inMinutes > 0) {
      // If the difference is in minutes
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'Minute' : 'Minutes'} ago';
    } else {
      // If the difference is in seconds or less
      return 'Just now';
    }
  }

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content
      ];
}

class SourceEntity extends Equatable {
  final String? id;
  final String? name;

  const SourceEntity({this.id, this.name});

  @override
  List<Object?> get props => [id, name];
}
