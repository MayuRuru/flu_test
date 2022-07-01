class GameModel {
//constructor to initializa the object:

  GameModel(this.target,
      [this.current = sliderStart,
      this.totalScore = scoreStart,
      this.round = roundStart]);

//define the contexts:

  static const sliderStart = 50;
  static const scoreStart = 0;
  static const roundStart = 1;

//variables that hold the state:
  int target;
  int current;
  int totalScore;
  int round;
}
