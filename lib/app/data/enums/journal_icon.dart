enum JournalIcon {
  happy("happy"),
  sad("sad"),
  soso("soso"),
  angry("angry"),
  joy("joy");

  const JournalIcon(this.iconPath);

  final String iconPath;

  factory JournalIcon.fromPath(String path) {
    return values.firstWhere((element) => element.iconPath == path);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'icon': iconPath,
    };
  }
}
