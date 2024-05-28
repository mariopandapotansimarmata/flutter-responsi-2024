class TeamModel {
  List<Data>? data;

  TeamModel({this.data});

  TeamModel.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? idCLub;
  String? nameClub;
  String? logoClubUrl;
  String? stadiumName;
  String? captainName;
  String? headCoach;

  Data(
      {this.idCLub,
        this.nameClub,
        this.logoClubUrl,
        this.stadiumName,
        this.captainName,
        this.headCoach});

  Data.fromJson(Map<String, dynamic> json) {
    idCLub = json['IdCLub'];
    nameClub = json['NameClub'];
    logoClubUrl = json['LogoClubUrl'];
    stadiumName = json['StadiumName'];
    captainName = json['CaptainName'];
    headCoach = json['HeadCoach'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdCLub'] = this.idCLub;
    data['NameClub'] = this.nameClub;
    data['LogoClubUrl'] = this.logoClubUrl;
    data['StadiumName'] = this.stadiumName;
    data['CaptainName'] = this.captainName;
    data['HeadCoach'] = this.headCoach;
    return data;
  }
}