void main() {
  print("Tipos de variables en Dart");
  
  final String pokemon = "Ditto";
  print(pokemon);
  String myName = 'Jimmy';
  myName = 'Ayala';
  print(myName);
  const String elemento = 'Fuego';
  print("elemento: $elemento");
  bool active = false;
  print("Es activo: $active");
  int hp = 1000;
  print("caballos de fuerza $hp");
  List<String> abilities=["impostor","correlon"];
  print("habilidades $abilities");
  final sprites = <String>["src/image1.jpg","image2"];
  print("Imagenes $sprites");
  print("Impresion envarias linesas");
  print("""
  $pokemon
  $myName
  $elemento
  $active
  $hp
  $abilities
  $sprites
  """);
}
