class MenuModal {
  String menu;
  String icons;
  bool isSelected = false;

  MenuModal({
    required this.menu,
    required this.icons,
  });

  factory MenuModal.fromJson(Map<String, dynamic> json) => MenuModal(
        menu: json["menu"],
        icons: json["icons"],
      );

  Map<String, dynamic> toJson() => {
        "menu": menu,
        "icons": icons,
      };
}
