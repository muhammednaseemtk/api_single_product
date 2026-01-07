class Dimensions {
  final double? width;
  final double? height;
  final double? depth;

  Dimensions({
    this.width,
    this.height,
    this.depth
  });

  factory Dimensions.fromJson(Map<String,dynamic> json) {
    return Dimensions(
      width: (json['width']as num).toDouble(),
      height: (json['height']as num).toDouble(),
      depth: (json['depth']as num).toDouble()
    );
  }
}