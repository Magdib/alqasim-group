List<Map<String, bool>> getGiftState(int giftState) {
  switch (giftState) {
    case 1:
      return [
        {"canWatch": false, "watched": true},
        {"canWatch": true, "watched": false},
        {"canWatch": false, "watched": false},
        {"canWatch": false, "watched": false},
      ];
    case 2:
      return [
        {"canWatch": false, "watched": true},
        {"canWatch": false, "watched": true},
        {"canWatch": true, "watched": false},
        {"canWatch": false, "watched": false},
      ];
    case 3:
      return [
        {"canWatch": false, "watched": true},
        {"canWatch": false, "watched": true},
        {"canWatch": false, "watched": true},
        {"canWatch": true, "watched": false},
      ];
    default:
      return [
        {"canWatch": true, "watched": false},
        {"canWatch": false, "watched": false},
        {"canWatch": false, "watched": false},
        {"canWatch": false, "watched": false},
      ];
  }
}
