extension StringExtension on String {
  String asImagePng() => 'assets/images/$this.png';
  String asIconPng() => 'assets/icons/$this.png';
  String asIconSvg() => 'assets/icons/$this.svg';
}
