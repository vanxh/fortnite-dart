/// STW Banner quest object
class BannerQuest {
  /// name of quest
  String name;

  int completionCurrent;
  int completionTotal;

  /// Constructor
  BannerQuest(this.name, this.completionCurrent, this.completionTotal);

  /// is the quest completed
  bool get isCompleted => completionCurrent >= completionTotal;
}
