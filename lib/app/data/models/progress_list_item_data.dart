class PromiseProgressItem {
  final String promiseName;
  final String startDate;
  final String endDate;
  final String profileImage;
  final double progress;

  PromiseProgressItem({
    required this.promiseName,
    required this.startDate,
    required this.endDate,
    required this.profileImage,
    required this.progress,
  });
}

List<PromiseProgressItem> samplePromises = [
  PromiseProgressItem(
      promiseName: '호중이 혼맥 줄이기',
      startDate: '2022.03.01',
      endDate: '2023.03.01',
      profileImage: 'no data',
      progress: 0.5),
  PromiseProgressItem(
      promiseName: '가은이와의 밀-당',
      startDate: '2023.01.12',
      endDate: '2023.03.12',
      profileImage: 'no data',
      progress: 0.2),
];
