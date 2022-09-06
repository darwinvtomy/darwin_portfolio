import 'dart:convert';

import '../../../resources/strings_manager.dart';

Resume resumeFromJson(String str) => Resume.fromJson(json.decode(str));

class Resume {
  Resume({
    this.currentLocation,
    this.age,
    this.datafromLanguage,
    this.name,
    this.address1,
    this.pno1,
    this.pno2,
    this.email,
    this.dob,
    this.aboutPicture,
    this.avatarPicture,
    this.bannerPicture,
    this.freelancePicture,
    this.languages,
    this.coding,
  });

  final String? name;
  final String? address1;
  final String? pno1;
  final String? pno2;
  final String? email;
  final int? dob;
  final int? age;
  final String? aboutPicture;
  final String? avatarPicture;
  final String? bannerPicture;
  final String? freelancePicture;
  final List<ResumeLanguage>? languages;
  final List<Coding>? coding;
  final DatafromLanguage? datafromLanguage;
  final CurrentLocation? currentLocation;

  Map<String, InLanguage>? get getLanguageList =>
      datafromLanguage!.languageList!;
  factory Resume.fromJson(Map<String, dynamic> json) {
    List<ResumeLanguage>? languages = List<ResumeLanguage>.from(
        json["languages"].map((x) => ResumeLanguage.fromJson(x)));
    DatafromLanguage datafromLanguage =
        DatafromLanguage.fromKeyandJson(json, languages);
    return Resume(
        name: json["name"],
        address1: json["address1"],
        pno1: json["pno1"],
        pno2: json["pno2"],
        email: json["email"],
        dob: json["dob"] as int,
        age: json["age"] as int,
        aboutPicture: json["about_picture"],
        avatarPicture: json["avatar_picture"],
        bannerPicture: json["banner_picture"],
        freelancePicture: json["freelance_picture"],
        languages: languages,
        coding:
            List<Coding>.from(json["coding"].map((x) => Coding.fromJson(x))),
        currentLocation: CurrentLocation.fromJson(json["current_location"]),
        datafromLanguage: datafromLanguage);
  }

  String? getlabelfromData(String languageId) {
    return getLanguageList![languageId]!.label ??
        getLanguageList![AppStrings.defaultLanguage]?.label;
  }

  String? getProfessionalSummery(String languageId) {
    return getLanguageList![languageId]!.professionalSummary ??
        getLanguageList![AppStrings.defaultLanguage]?.professionalSummary;
  }

  List<Service>? getServicesList(String languageId) {
    return getLanguageList![languageId]!.services ??
        getLanguageList![AppStrings.defaultLanguage]?.services;
  }

  List<WorkHistory>? getWorkHistory(String languageId) {
    return getLanguageList![languageId]!.workHistory ??
        getLanguageList![AppStrings.defaultLanguage]?.workHistory;
  }

  List<Education>? getEducationHistory(String languageId) {
    return getLanguageList![languageId]!.education ??
        getLanguageList![AppStrings.defaultLanguage]?.education;
  }

  List<Portfolio>? getPortfolioList(String languageId) {
    return getLanguageList![languageId]!.portfolio ??
        getLanguageList![AppStrings.defaultLanguage]?.portfolio;
  }

  List<Testimonial>? getTestimonials(String languageId) {
    return getLanguageList![languageId]!.testimonial ??
        getLanguageList![AppStrings.defaultLanguage]?.testimonial;
  }

  List<Blog>? getPersonalBlogs(String languageId) {
    return getLanguageList![languageId]!.blog ??
        getLanguageList![AppStrings.defaultLanguage]?.blog;
  }
}

class DatafromLanguage {
  final Map<String, InLanguage>? languageList;
  DatafromLanguage({
    this.languageList,
  });

  factory DatafromLanguage.fromKeyandJson(
      Map<String, dynamic> json, List<ResumeLanguage>? languages) {
    Map<String, InLanguage> languageList = {};
    for (ResumeLanguage value in languages!) {
      languageList[value.id!] = InLanguage.fromJson(json[value.languageKey]);
      print(
          "ADDING DATA GETTING VALUE ${InLanguage.fromJson(json[value.languageKey]).professionalSummary}");
    }
    return DatafromLanguage(languageList: languageList);
  }
}

class Coding {
  Coding({
    this.skill,
    this.level,
  });

  final String? skill;
  final int? level;

  factory Coding.fromJson(Map<String, dynamic> json) => Coding(
        skill: json["skill"],
        level: json["level"],
      );
}

class InLanguage {
  InLanguage({
    this.label,
    this.professionalSummary,
    this.skills,
    this.profiles,
    this.services,
    this.languages,
    this.workHistory,
    this.education,
    this.interests,
    this.hobbies,
    this.portfolio,
    this.testimonial,
    this.blog,
    // this.currentLocstion,
    this.contact,
  });

  final String? label;
  final String? professionalSummary;
  final List<String>? skills;
  final List<Profile>? profiles;
  final List<Service>? services;
  final List<LanguageSkill>? languages;
  final List<WorkHistory>? workHistory;
  final List<Education>? education;
  final List<String>? interests;
  final List<String>? hobbies;
  final List<Portfolio>? portfolio;
  final List<Testimonial>? testimonial;
  final List<Blog>? blog;
  final Contact? contact;

  factory InLanguage.fromJson(Map<String, dynamic> json) {
    return InLanguage(
      label: json["label"],
      professionalSummary: json["professional_summary"],
      skills: json["skills"] == null
          ? null
          : List<String>.from(json["skills"].map((x) => x)),
      profiles: json["profiles"] == null
          ? null
          : List<Profile>.from(
              json["profiles"].map((x) => Profile.fromJson(x))),
      services: json["services"] == null
          ? null
          : List<Service>.from(
              json["services"].map((x) => Service.fromJson(x))),
      languages: json["languages"] == null
          ? null
          : List<LanguageSkill>.from(
              json["languages"].map((x) => LanguageSkill.fromJson(x))),
      workHistory: json["work_history"] == null
          ? null
          : List<WorkHistory>.from(
              json["work_history"].map((x) => WorkHistory.fromJson(x))),
      education: json["education"] == null
          ? null
          : List<Education>.from(
              json["education"].map((x) => Education.fromJson(x))),
      interests: json["interests"] == null
          ? null
          : List<String>.from(json["interests"].map((x) => x)),
      hobbies: json["hobbies"] == null
          ? null
          : List<String>.from(json["hobbies"].map((x) => x)),
      portfolio: json["portfolio"] == null
          ? null
          : List<Portfolio>.from(
              json["portfolio"].map((x) => Portfolio.fromJson(x))),
      testimonial: json["testimonial"] == null
          ? null
          : List<Testimonial>.from(
              json["testimonial"].map((x) => Testimonial.fromJson(x))),
      blog: json["blog"] == null
          ? null
          : List<Blog>.from(json["blog"].map((x) => Blog.fromJson(x))),
      // currentLocstion: CurrentLocstion.fromJson(json["current_locstion"]),
      contact:
          json["contact"] == null ? null : Contact.fromJson(json["contact"]),
    );
  }
}

class Blog {
  Blog({
    this.image,
    this.name,
    this.description,
    this.imageurl,
    this.url,
  });

  final String? image;
  final String? name;
  final String? description;
  final String? imageurl;
  final String? url;

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        image: json["image"],
        name: json["name"],
        description: json["description"],
        imageurl: json["imageurl"],
      );
}

class Contact {
  Contact({
    this.formDetails,
    this.submitMail,
  });

  final List<FormDetail>? formDetails;
  final String? submitMail;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        formDetails: List<FormDetail>.from(
            json["form_details"].map((x) => FormDetail.fromJson(x))),
        submitMail: json["submit_mail"],
      );
}

class FormDetail {
  FormDetail({
    this.title,
    this.hint,
  });

  final String? title;
  final String? hint;

  factory FormDetail.fromJson(Map<String, dynamic> json) => FormDetail(
        title: json["title"],
        hint: json["hint"],
      );
}

class CurrentLocstion {
  CurrentLocstion({
    this.lat,
    this.long,
  });

  final String? lat;
  final String? long;

  factory CurrentLocstion.fromJson(Map<String, dynamic> json) =>
      CurrentLocstion(
        lat: json["lat"],
        long: json["long"],
      );
}

class Education {
  Education({
    this.instution,
    this.degree,
    this.location,
  });

  final String? instution;
  final String? degree;
  final String? location;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        instution: json["instution"],
        degree: json["degree"],
        location: json["location"],
      );
}

class LanguageSkill {
  LanguageSkill({
    this.language,
    this.level,
  });

  final String? language;
  final int? level;

  factory LanguageSkill.fromJson(Map<String, dynamic> json) => LanguageSkill(
        language: json["language"],
        level: json["level"],
      );
}

class Portfolio {
  Portfolio({
    this.image,
    this.title,
    this.type,
    this.url,
  });

  final String? image;
  final String? title;
  final String? type;
  final String? url;

  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
        image: json["image"],
        title: json["title"],
        type: json["type"],
        url: json["url"],
      );
}

class Profile {
  Profile({
    this.network,
    this.username,
    this.url,
  });

  final String? network;
  final String? username;
  final String? url;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        network: json["network"],
        username: json["username"],
        url: json["url"],
      );
}

class Service {
  Service({
    this.icon,
    this.title,
    this.description,
  });

  final String? icon;
  final String? title;
  final String? description;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        icon: json["icon"],
        title: json["title"],
        description: json["description"],
      );
}

class Testimonial {
  Testimonial({
    this.image,
    this.name,
    this.description,
  });

  final String? image;
  final String? name;
  final String? description;

  factory Testimonial.fromJson(Map<String, dynamic> json) => Testimonial(
        image: json["image"],
        name: json["name"],
        description: json["description"],
      );
}

class WorkHistory {
  WorkHistory({
    this.startDate,
    this.endDate,
    this.companyName,
    this.location,
    this.summary,
    this.website,
    this.role,
    this.descripton,
  });

  final String? startDate;
  final String? endDate;
  final String? companyName;
  final String? location;
  final String? summary;
  final String? website;
  final String? role;
  final List<String>? descripton;

  factory WorkHistory.fromJson(Map<String, dynamic> json) => WorkHistory(
        startDate: json["start_date"],
        endDate: json["end_date"],
        companyName: json["company_name"],
        location: json["location"],
        summary: json["summary"],
        website: json["website"],
        role: json["role"],
        descripton: List<String>.from(json["descripton"].map((x) => x)),
      );
}

class CurrentLocation {
  CurrentLocation({
    this.lat,
    this.long,
  });

  final double? lat;
  final double? long;

  factory CurrentLocation.fromJson(Map<String, dynamic> json) =>
      CurrentLocation(
        lat: json["lat"],
        long: json["long"],
      );
}

class ResumeLanguage {
  ResumeLanguage({
    this.title,
    this.id,
    this.languageKey,
    this.locale,
  });

  final String? title;
  final String? id;
  final String? languageKey;
  final String? locale;

  factory ResumeLanguage.fromJson(Map<String, dynamic> json) => ResumeLanguage(
        title: json["title"],
        id: json["id"],
        languageKey: json["language_key"],
        locale: json["locale"],
      );
}
