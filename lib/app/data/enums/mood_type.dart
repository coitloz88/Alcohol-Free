enum MoodType {
  sad("sad"),
  angry("angry"),
  relaxed("relaxed"),
  happy("happy"),
  joyful("joyful");

  const MoodType(this.iconPath);

  final String iconPath;

  factory MoodType.fromPath(String path) {
    return values.firstWhere((element) => element.iconPath == path);
  }

  @override
  String toString() {
    return iconPath;
  }

  String toKorean() {
    switch (iconPath) {
      case "sad":
        return "기분은 슬펐어요";
      case "angry":
        return "기분은 화가났어요";
      case "relaxed":
        return "기분은 편안했어요";
      case "happy":
        return "기분은 행복했어요";
      case "joyful":
        return "기분은 즐거웠어요";
      default:
        return "";
    }
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'icon': iconPath,
    };
  }
}
