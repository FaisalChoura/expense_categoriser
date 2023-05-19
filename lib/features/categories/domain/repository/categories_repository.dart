import '../../../../shared/domain/model/uncategories_row_data.dart';
import '../model/category.dart';

abstract class CategoriesRepository {
  Future<Category?> putCategory(Category category);

  Future<bool> deleteCategory(int id);

  Future<Category?> getCategory(int id);
  Future<List<Category>> getAllCategories();
}
