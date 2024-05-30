import 'dart:convert';

QuickLinkModal quickLinkModalFromJson(String str) =>
    QuickLinkModal.fromJson(json.decode(str));

class QuickLinkModal {
  String icon;
  String title;
  String text;
  String link;

  QuickLinkModal({
    required this.icon,
    required this.title,
    required this.text,
    required this.link,
  });

  factory QuickLinkModal.fromJson(Map<String, dynamic> json) => QuickLinkModal(
        icon: json["icon"],
        title: json["title"],
        text: json["text"],
        link: json["link"],
      );
}
