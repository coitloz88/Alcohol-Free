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

  String toString() {
    return iconPath;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'icon': iconPath,
    };
  }
}
