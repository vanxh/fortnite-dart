import "../../resources/daily_rewards.dart";

/// A class that represents the response of claim daily rewards.
class ClaimDailyRewardResponse {
  /// days logged in
  int daysLoggedIn;

  /// was the reward already claimed?
  bool alreadyClaimed;

  /// list of rewards by day
  List<Item> rewardsByDay;

  /// Creates a new instance of this class.
  ClaimDailyRewardResponse({
    required this.daysLoggedIn,
    required this.alreadyClaimed,
    required this.rewardsByDay,
  });

  /// Creates a new instance of this class from day.
  factory ClaimDailyRewardResponse.fromDay(int _day, bool _alreadyClaimed) =>
      ClaimDailyRewardResponse(
        daysLoggedIn: _day,
        alreadyClaimed: _alreadyClaimed,
        rewardsByDay: dailyRewards
            .getRange(
              (_day - 1) % 336,
              ((_day - 1) % 336) + 7,
            )
            .toList(),
      );
}
