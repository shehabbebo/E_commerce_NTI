class SliderModel {
  final String image;
  final String title;
  final String subtitle;
  final String buttonText;

  SliderModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      image: json['image'],
      title: json['title'],
      subtitle: json['subtitle'],
      buttonText: json['button_text'],
    );
  }
}
