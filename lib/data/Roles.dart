class Role {
  String name;
  String imgPath;
  String? desc;
  Role(this.name, this.imgPath);
}

final List<Role> Roles = [
  new Role("Sorciére", "assets/images/witch.png"),
  new Role("Chasseur", "assets/images/chasseur.png"),
  new Role("Cupidon", "assets/images/cupidon.png"),
  new Role("Protecteur", "assets/images/protecteur.png"),
  new Role("Voyante", "assets/images/voyante.png"),
  new Role("Loup Pére", "assets/images/black_wolf.png"),
  new Role("Petite Fille", "assets/images/simple.png"),
  new Role("Voleur", "assets/images/simple.png"),
  new Role("L'Ancien", "assets/images/simple.png"),
  new Role("Le Corbeau", "assets/images/simple.png"),
];

final List<Role> privateRoles = [
  new Role("Loup", "assets/images/loup.png"),
  new Role("Simple Villagoies", "assets/images/simple.png"),
];
