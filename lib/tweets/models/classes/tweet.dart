class Tweet {
  final String nickName;
  final String content;
  final int timestampDate;

  Tweet(this.nickName, this.content, this.timestampDate);

  DateTime get date => DateTime.fromMillisecondsSinceEpoch(timestampDate);
  String get timeAgo => _getTimeDifferenceWithToday();

  String _getTimeDifferenceWithToday() {
    Duration difference = DateTime.now().difference(date);

    if(difference.inDays > 0)
      return difference.inDays.toString() + "d";

    if(difference.inHours > 0)
      return difference.inHours.toString() + "h";

    if(difference.inMinutes > 0)
      return difference.inMinutes.toString() + "m";

    return "Just now";
  }
}