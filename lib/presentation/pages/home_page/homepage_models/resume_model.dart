// To parse this JSON data, do
//
//     final resume = resumeFromJson(jsonString);

import 'dart:convert';

Resume resumeFromJson(String str) => Resume.fromJson(json.decode(str));

class Resume {
  Resume({
    this.enUs,
    this.deDe,
  });

  final EnUs? enUs;
  final DeDe? deDe;

  factory Resume.fromJson(Map<String, dynamic> json) => Resume(
        enUs: EnUs.fromJson(json["en_US"]),
        deDe: DeDe.fromJson(json["de_DE"]),
      );
}

class DeDe {
  DeDe({
    this.label,
    this.dob,
    this.skills,
  });

  final String? label;
  final String? dob;
  final List<String>? skills;

  factory DeDe.fromJson(Map<String, dynamic> json) => DeDe(
        label: json["label"],
        dob: json["dob"],
        skills: List<String>.from(json["skills"].map((x) => x)),
      );
}

class EnUs {
  EnUs({
    this.name,
    this.label,
    this.address1,
    this.pno1,
    this.pno2,
    this.email,
    this.dob,
    this.aboutPicture,
    this.avatarPicture,
    this.bannerPicture,
    this.freelancePicture,
    this.professionalSummary,
    this.skills,
    this.profiles,
    this.services,
    this.coding,
    this.languages,
    this.workHistory,
    this.education,
    this.interests,
    this.hobbies,
    this.portfolio,
    this.testimonial,
    this.blog,
    this.currentLocstion,
    this.contact,
  });

  final String? name;
  final String? label;
  final String? address1;
  final String? pno1;
  final String? pno2;
  final String? email;
  final String? dob;
  final String? aboutPicture;
  final String? avatarPicture;
  final String? bannerPicture;
  final String? freelancePicture;
  final String? professionalSummary;
  final List<String>? skills;
  final List<Profile>? profiles;
  final List<Service>? services;
  final List<Coding>? coding;
  final List<Language>? languages;
  final List<WorkHistory>? workHistory;
  final List<Education>? education;
  final List<String>? interests;
  final List<String>? hobbies;
  final List<Portfolio>? portfolio;
  final List<Testimonial>? testimonial;
  final List<Blog>? blog;
  final CurrentLocstion? currentLocstion;
  final Contact? contact;

  factory EnUs.fromJson(Map<String, dynamic> json) => EnUs(
        name: json["name"],
        label: json["label"],
        address1: json["address1"],
        pno1: json["pno1"],
        pno2: json["pno2"],
        email: json["email"],
        dob: json["dob"],
        aboutPicture: json["about_picture"],
        avatarPicture: json["avatar_picture"],
        bannerPicture: json["banner_picture"],
        freelancePicture: json["freelance_picture"],
        professionalSummary: json["professional_summary"],
        skills: List<String>.from(json["skills"].map((x) => x)),
        profiles: List<Profile>.from(
            json["profiles"].map((x) => Profile.fromJson(x))),
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
        coding:
            List<Coding>.from(json["coding"].map((x) => Coding.fromJson(x))),
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
        workHistory: List<WorkHistory>.from(
            json["work_history"].map((x) => WorkHistory.fromJson(x))),
        education: List<Education>.from(
            json["education"].map((x) => Education.fromJson(x))),
        interests: List<String>.from(json["interests"].map((x) => x)),
        hobbies: List<String>.from(json["hobbies"].map((x) => x)),
        portfolio: List<Portfolio>.from(
            json["portfolio"].map((x) => Portfolio.fromJson(x))),
        testimonial: List<Testimonial>.from(
            json["testimonial"].map((x) => Testimonial.fromJson(x))),
        blog: List<Blog>.from(json["blog"].map((x) => Blog.fromJson(x))),
        currentLocstion: CurrentLocstion.fromJson(json["current_locstion"]),
        contact: Contact.fromJson(json["contact"]),
      );
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
        url: json["url"],
      );
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

class Language {
  Language({
    this.language,
    this.level,
  });

  final String? language;
  final int? level;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
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
