class HttpError{
  int errorCode;
  int statusCode;
  String message;

  HttpError(int errorCode, Map<String, dynamic> json){
    this.errorCode = errorCode;
    if(json.containsKey('statusCode')){

      if(json['statusCode'] is String  )
        this.statusCode = int.parse(json['statusCode']);
      else
        this.statusCode = json['statusCode'];


    }else{
      this.statusCode = -1;
    }
    if(json.containsKey('message')){
      this.message = json['message'];
    }else{
      this.message = "";
    }
  }

  @override
  String toString() {
    return "HTTP Error - httpcode:" + errorCode.toString() + " , server status code:" + statusCode.toString() + " , message:" + this.message;
  }
}