class Item {
  String id;
  bool isSelected;
  String? description;
  Item({
    required this.id,
    this.isSelected = false,
    this.description = 'no description',
  });
}

List<Item> items = List.generate(13, (index) => Item(id: '${index + 1}'));
