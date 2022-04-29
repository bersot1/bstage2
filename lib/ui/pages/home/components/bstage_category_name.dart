import 'dart:math';

class CategoryModelAux {
  final String id;
  final String name;

  CategoryModelAux(this.id, this.name);
}

class BstageCategoryName {
  static List<CategoryModelAux> bstageCategories = [
    CategoryModelAux('0e29d2dd-da6c-4747-9ba5-3f6907147eca', 'Samba'),
    CategoryModelAux('1fc04967-b077-42f0-81e9-82ceb995fd9a', 'Balada'),
    CategoryModelAux('f1ffd898-a4a9-4ddb-bbcb-efc4d7b4ec3d', 'Funk'),
    CategoryModelAux('02ac9693-ad21-43c0-b027-6217bf6c67c2', 'Reggae'),
    CategoryModelAux('5c04ec46-b6db-4aa4-ae25-dc03b45cfe5c', 'Balada'),
    CategoryModelAux('6d83dd32-36b1-40dd-bf2d-a6b46157db0b', 'Gospel'),
    CategoryModelAux('6df16d57-650f-4025-b383-6ecddd63d704', 'Sport'),
    CategoryModelAux('6ff6dd63-3921-447e-a326-e4a7268e48cc', 'Pop'),
    CategoryModelAux('07e4cd53-c4b0-4e07-9a5a-e82aab00c960', 'Forró'),
    CategoryModelAux('15e9ec31-64ce-4863-a8cb-b8ed91db1ce7', 'Hip-Hop'),
    CategoryModelAux('29d415b5-a23d-45b5-a24f-eb39ec3d71a2', 'Teatro'),
    CategoryModelAux('33eebc38-0466-4cc3-93f2-ecb3422ebaef', 'Rock'),
    CategoryModelAux('036cfb88-23b8-490c-bb49-105b9727c8b2', 'Carnaval'),
    CategoryModelAux('76ad6d67-1c67-44e8-a0ce-d23c1ea60257', 'Indie'),
    CategoryModelAux('974241b7-c7a5-4eaf-ae14-5de3ac212478', 'K-pop'),
    CategoryModelAux('a4bd7adb-667c-4420-b869-909b9b35ebf9', 'Jazz'),
    CategoryModelAux('d01d8c09-c692-44bd-bda1-8f0a074166f5', 'Eletrônica'),
    CategoryModelAux('d71eb701-ff04-45d8-bf98-efd9e241a4fd', 'Formatura'),
    CategoryModelAux('da673118-90d0-4bd0-aaed-c0900167e35f', 'Churrasco'),
  ];

  static String getNameCategory(String id) {
    final response = bstageCategories.where((element) => element.id == id).toList();

    return response[0].name;
  }

  static String getRandomCategoryId() {
    final category = bstageCategories[Random().nextInt(18)];
    return category.id;
  }
}
