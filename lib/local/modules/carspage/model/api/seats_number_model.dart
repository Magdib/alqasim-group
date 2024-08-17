class SeatsNumberModel {
  String? seatNum;

  SeatsNumberModel({this.seatNum});

  SeatsNumberModel.fromJson(Map<String, dynamic> json) {
    this.seatNum = json["seat_num"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["seat_num"] = this.seatNum;
    return data;
  }
}
