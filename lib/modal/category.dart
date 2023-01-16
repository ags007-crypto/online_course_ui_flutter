class Category {
  final String name;
  final int numOfCourses;
  final String image;

  Category(this.name, this.numOfCourses, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'] as String, item['courses'] as int,
        item['image'] as String))
    .toList();

var categoriesData = [
  {"name": "Marketing", 'courses': 17, 'image': "assets/images/marketing.jpg"},
  {"name": "UX Design", 'courses': 25, 'image': "assets/images/ux_design.jpg"},
  {
    "name": "Photography",
    'courses': 13,
    'image': "assets/images/photography.jpg"
  },
  {"name": "Business", 'courses': 17, 'image': "assets/images/business.jpg"},
];
