class TrainInfo {
// 發布時間
  late String updateTime = '';
// 有效日期
  late String effectiveDate = '';
// 結束日期
  late String expiringDate = '';
// 車次代碼
  late String trainNo = '';
// 行駛方向
  late String direction = '';
// 起點站
  late String startingStationName = '';
// 終點站
  late String endingStationName = '';
// 停靠車站
  late String station = '';

  void setUpdatetime(String updateTime) {
    this.updateTime = updateTime;
  }

  void setEffectiveDate(String effectiveDate) {
    this.effectiveDate = effectiveDate;
  }

  void setExpiringDate(String expiringDate) {
    this.expiringDate = expiringDate;
  }

  void setTrainNo(String trainNo) {
    this.trainNo = trainNo;
  }

  void setDirection(String direction) {
    this.direction = direction;
  }

  void setStartingStationName(String startingStationName) {
    this.startingStationName = startingStationName;
  }

  void setEndingStationName(String endingStationName) {
    this.endingStationName = endingStationName;
  }

  void setStation(String station) {
    this.station = station;
  }

  String getFullTrainInfo() {
    return ('\n車次代碼 : ' +
        this.trainNo +
        '\n' +
        '行駛方向 : ' +
        this.direction +
        '\n' +
        '起點站 : ' +
        this.startingStationName +
        '\n' +
        '終點站 : ' +
        this.endingStationName +
        '\n' +
        '-------------\n' +
        '沿途停靠\n' +
        this.station);
  }
}
