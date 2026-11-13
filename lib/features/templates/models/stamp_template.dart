enum StampCategory { geometric, postage, decorative, creative, seasonal }

enum StampShape {
  square,
  rectangle,
  circle,
  oval,
  postage,
  scalloped,
  heart,
  flower,
  cloud,
  arch,
  ticket,
  filmFrame,
  roundedRectangle,
}

class StampTemplate {
  final String id;
  final String name;
  final StampCategory category;
  final StampShape shape;
  final double aspectRatio;
  final String description;

  const StampTemplate({
    required this.id,
    required this.name,
    required this.category,
    required this.shape,
    required this.aspectRatio,
    required this.description,
  });
}
