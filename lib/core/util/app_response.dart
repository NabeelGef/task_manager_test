class AppResponse{
  final dynamic data;
  final int? statusCode;
  final Map<String, String>? headers;

  AppResponse({this.data, this.statusCode, this.headers});
  List<T> toList<T>(T Function(Map<String, dynamic> json) fromJson,
      /*{String? index}*/{bool? isOtherData}) {
    if(isOtherData!=null&&isOtherData){
      return /*(index != null ? data[index] : */(data["data"]["data"]as List)
          .map((e) => fromJson(e))
          .toList();
    }
    return /*(index != null ? data[index] : */(data["data"]as List)
        .map((e) => fromJson(e))
        .toList();
  }
  T? toFromJson<T>(T Function(Map<String, dynamic> json) fromJson) {
    return data["data"]==null?null :data["data"] is bool ? null : fromJson(data["data"]);
  }
}