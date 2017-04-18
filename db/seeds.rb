User.create(:name => 'Brett', :email => 'example1@gmail.com', :password => '3115')
User.create(:name => 'Rach', :email => 'example2@gmail.com', :password => '1114')
User.create(:name => 'Mark', :email => 'example3@gmail.com', :password => '4510')
User.create(:name => 'Tina', :email => 'example4@gmail.com', :password => '007')
User.create(:name => 'Isla Jane', :email => 'example5@gmail.com', :password => 'July24')
User.create(:name => 'Caliana May', :email => 'example6@gmail.com', :password => 'July24')

Recipe.create(:title => 'Filet Mignon with Rich Balsamic Glaze',
  :description => 'This is an elegant and quick romantic dinner for two. Wonderful served with steamed asparagus and baby red potatoes.',
  :directions => 'Sprinkle freshly ground pepper over both sides of each steak, and sprinkle with salt to taste.
  Heat a nonstick skillet over medium-high heat. Place steaks in hot pan, and cook for 1 minute on each side, or
  until browned. Reduce heat to medium-low, and add balsamic vinegar and red wine. Cover, and cook for 4 minutes on each
  side, basting with sauce when you turn the meat over.
  Remove steaks to two warmed plates, spoon one tablespoon of glaze over each, and serve immediately.',
  :prep_time => '5 mins', :cook_time => '15 mins', :gluten_free => false, :vegan => false, :user_id => 1)
Recipe.create(:title => 'Chicken Cordon Bleu II',
  :description => "'Cordon Bleu' is a French term, literally translated as 'blue ribbon', that originally referred to an award for
  culinary excellence given to women cooks! The term can now apply to any superior cook (yes, men too), and also to this dish
  (chicken, ham and Swiss cheese slices, breaded and sauteed). This yummy version adds paprika and a creamy white wine sauce worthy
  of its own blue ribbon. Two blue ribbon tastes in wedded bliss -- Chicken Cordon Bleu II!",
  :directions => 'Pound chicken breasts if they are too thick. Place a cheese and ham slice on each breast within 1/2 inch of the edges.
  Fold the edges of the chicken over the filling, and secure with toothpicks. Mix the flour and paprika in a small bowl, and coat the
  chicken pieces. Heat the butter in a large skillet over medium-high heat, and cook the chicken until browned on all sides. Add the
  wine and bouillon. Reduce heat to low, cover, and simmer for 30 minutes, until chicken is no longer pink and juices run clear. Remove
  the toothpicks, and transfer the breasts to a warm platter. Blend the cornstarch with the cream in a small bowl, and whisk slowly
  into the skillet. Cook, stirring until thickened, and pour over the chicken. Serve warm.',
  :prep_time => '15 mins', :cook_time => '45 mins', :gluten_free => false, :vegan => false, :user_id => 2)
Recipe.create(:title => 'Juicy Roasted Chicken',
  :description => "My grandmother's recipe for roasted chicken. We are German and she used to do it this way all the time. I never
  have had a chicken this juicy before; this little trick works and makes the people eating it go silent. It's funny. We nibble on the
  celery after.", :directions => "Preheat oven to 350 degrees F (175 degrees C). Place chicken in a roasting pan, and season generously
  inside and out with salt and pepper. Sprinkle inside and out with onion powder. Place 3 tablespoons margarine in the chicken cavity.
  Arrange dollops of the remaining margarine around the chicken's exterior. Cut the celery into 3 or 4 pieces, and place in the chicken
  cavity.", :prep_time => '10 mins', :cook_time => '1h 15 mins', :gluten_free => true, :vegan => false, :user_id => 3)
Recipe.create(:title => 'Vegan Fajitas', :description => "This is a wonderful meatless version of traditional fajitas! It can be prepared in advance, or right away.",
  :directions => "In a large bowl combine olive oil, vinegar, oregano, chili powder, garlic salt, salt, pepper and sugar. To the marinade
  add the zucchini, yellow squash, onion, green pepper and red pepper. Marinate vegetables in the refrigerator for at least 30 minutes, but
  not more than 24 hours. Heat oil in a large skillet over medium-high heat. Drain the vegetables and saute until tender, about 10 to 15 minutes.
  Stir in the corn and beans; increase the heat to high for 5 minutes, to brown vegetables.", :prep_time => '20 mins', :cook_time => '20 mins',
  :gluten_free => true, :vegan => true, :user_id => 2)
Recipe.create(:title => 'Pan Seared Salmon', :description => "Simply seasoned with salt and pepper, these salmon fillets are pan seared with capers, and garnished with slices of lemon.",
  :directions => "Preheat a large heavy skillet over medium heat for 3 minutes. Coat salmon with olive oil. Place in skillet, and increase heat to high. Cook for 3
  minutes. Sprinkle with capers, and salt and pepper. Turn salmon over, and cook for 5 minutes, or until browned. Salmon is done when it flakes easily with a fork. Transfer
  salmon to individual plates, and garnish with lemon slices.", :prep_time => '10 mins', :cook_time => ' 10 mins', :gluten_free => false, :vegan => false, :user_id => 4)
Recipe.create(:title => 'Baked Teriyaki Chicken', :description => 'A much requested chicken recipe! Easy to double for a large group. Delicious!', :directions => 'In a small
  saucepan over low heat, combine the cornstarch, cold water, sugar, soy sauce, vinegar, garlic, ginger and ground black pepper. Let simmer, stirring frequently, until sauce
  thickens and bubbles. Preheat oven to 425 degrees F (220 degrees C). Place chicken pieces in a lightly greased 9x13 inch baking dish. Brush chicken with the sauce. Turn
  pieces over, and brush again. Bake in the preheated oven for 30 minutes. Turn pieces over, and bake for another 30 minutes, until no longer pink and juices run clear.
  Brush with sauce every 10 minutes during cooking.', :prep_time => '30 mins', :cook_time => '1 hour', :gluten_free => false, :vegan => false, :user_id => 5)
Recipe.create(:title => 'Brown Sugar Meatloaf', :description => "This is an easy tasty meatloaf. It tastes as good as it smells!", :directions => "Preheat oven to 350 degrees F (175 degrees C).
  Lightly grease a 5x9 inch loaf pan. Press the brown sugar in the bottom of the prepared loaf pan and spread the ketchup over the sugar. In a mixing bowl, mix thoroughly all remaining
  ingredients and shape into a loaf. Place on top of the ketchup. Bake in preheated oven for 1 hour or until juices are clear.", :prep_time => '20 mins', :cook_time => '1 hour', :gluten_free => false,
  :vegan => false, :user_id => 6)

RecipeIngredient.create(:recipe_id => 1, :ingredient_id => 1, :quantity => '2 (4 ounce)')
RecipeIngredient.create(:recipe_id => 1, :ingredient_id => 2, :quantity => '1/2 teaspoon')
RecipeIngredient.create(:recipe_id => 1, :ingredient_id => 3, :quantity => '')
RecipeIngredient.create(:recipe_id => 1, :ingredient_id => 4, :quantity => '1/4 cup')
RecipeIngredient.create(:recipe_id => 1, :ingredient_id => 5, :quantity => '1/4 cup')
RecipeIngredient.create(:recipe_id => 2, :ingredient_id => 6, :quantity => '6 skinless')
RecipeIngredient.create(:recipe_id => 2, :ingredient_id => 7, :quantity => '6 slices')
RecipeIngredient.create(:recipe_id => 2, :ingredient_id => 8, :quantity => '6 slices')
RecipeIngredient.create(:recipe_id => 2, :ingredient_id => 9, :quantity => '3 tablespoons')
RecipeIngredient.create(:recipe_id => 2, :ingredient_id => 10, :quantity => '1 teaspoon')
RecipeIngredient.create(:recipe_id => 2, :ingredient_id => 11, :quantity => '6 tablespoons')
RecipeIngredient.create(:recipe_id => 2, :ingredient_id => 12, :quantity => '1/2 cup')
RecipeIngredient.create(:recipe_id => 2, :ingredient_id => 13, :quantity => '1 teaspoon')
RecipeIngredient.create(:recipe_id => 2, :ingredient_id => 14, :quantity => '1 tablespoon')
RecipeIngredient.create(:recipe_id => 2, :ingredient_id => 15, :quantity => '1 cup')
RecipeIngredient.create(:recipe_id => 3, :ingredient_id => 16, :quantity => '1 (3 pound)')
RecipeIngredient.create(:recipe_id => 3, :ingredient_id => 3, :quantity => '')
RecipeIngredient.create(:recipe_id => 3, :ingredient_id => 17, :quantity => '')
RecipeIngredient.create(:recipe_id => 3, :ingredient_id => 18, :quantity => '1 tablespoon')
RecipeIngredient.create(:recipe_id => 3, :ingredient_id => 19, :quantity => '1/2 cup')
RecipeIngredient.create(:recipe_id => 3, :ingredient_id => 20, :quantity => '1 stalk')
RecipeIngredient.create(:recipe_id => 4, :ingredient_id => 21, :quantity => '1/4 cup')
RecipeIngredient.create(:recipe_id => 4, :ingredient_id => 22, :quantity => '1/4 cup')
RecipeIngredient.create(:recipe_id => 4, :ingredient_id => 23, :quantity => '1 teaspoon')
RecipeIngredient.create(:recipe_id => 4, :ingredient_id => 24, :quantity => '2 small')
RecipeIngredient.create(:recipe_id => 4, :ingredient_id => 25, :quantity => '2 medium')
RecipeIngredient.create(:recipe_id => 4, :ingredient_id => 26, :quantity => '1 large')
RecipeIngredient.create(:recipe_id => 4, :ingredient_id => 27, :quantity => '1')
RecipeIngredient.create(:recipe_id => 4, :ingredient_id => 28, :quantity => '1')
RecipeIngredient.create(:recipe_id => 4, :ingredient_id => 29, :quantity => '1 (8.75 ounce) can')
RecipeIngredient.create(:recipe_id => 4, :ingredient_id => 30, :quantity => '1 (15 ounce) can')
RecipeIngredient.create(:recipe_id => 5, :ingredient_id => 31, :quantity => '4 (6 ounce)')
RecipeIngredient.create(:recipe_id => 5, :ingredient_id => 21, :quantity => '2 tablespoons')
RecipeIngredient.create(:recipe_id => 5, :ingredient_id => 32, :quantity => '2 tablespoons')
RecipeIngredient.create(:recipe_id => 5, :ingredient_id => 33, :quantity => '1/8 teaspoon')
RecipeIngredient.create(:recipe_id => 5, :ingredient_id => 34, :quantity => '1/8 teaspoon')
RecipeIngredient.create(:recipe_id => 5, :ingredient_id => 35, :quantity => '4 slices')
RecipeIngredient.create(:recipe_id => 6, :ingredient_id => 14, :quantity => '1 tablespoon')
RecipeIngredient.create(:recipe_id => 6, :ingredient_id => 36, :quantity => '1 tablespoon')
RecipeIngredient.create(:recipe_id => 6, :ingredient_id => 37, :quantity => '1/2 cup')
RecipeIngredient.create(:recipe_id => 6, :ingredient_id => 38, :quantity => '1/2 cup')
RecipeIngredient.create(:recipe_id => 6, :ingredient_id => 39, :quantity => '1/4 cup')
RecipeIngredient.create(:recipe_id => 6, :ingredient_id => 40, :quantity => '1 clove')
RecipeIngredient.create(:recipe_id => 6, :ingredient_id => 41, :quantity => '1/2 teaspoon')
RecipeIngredient.create(:recipe_id => 6, :ingredient_id => 34, :quantity => '1/4 teaspoon')
RecipeIngredient.create(:recipe_id => 6, :ingredient_id => 42, :quantity => '12')
RecipeIngredient.create(:recipe_id => 7, :ingredient_id => 43, :quantity => '1/2 cup')
RecipeIngredient.create(:recipe_id => 7, :ingredient_id => 44, :quantity => '1/2 cup')
RecipeIngredient.create(:recipe_id => 7, :ingredient_id => 45, :quantity => '1 1/2 punds')
RecipeIngredient.create(:recipe_id => 7, :ingredient_id => 46, :quantity => '3/4 cup')
RecipeIngredient.create(:recipe_id => 7, :ingredient_id => 47, :quantity => '2')
RecipeIngredient.create(:recipe_id => 7, :ingredient_id => 33, :quantity => '1 1/2 teaspoons')
RecipeIngredient.create(:recipe_id => 7, :ingredient_id => 34, :quantity => '1/4 teaspoon')
RecipeIngredient.create(:recipe_id => 7, :ingredient_id => 26, :quantity => '1 small')
RecipeIngredient.create(:recipe_id => 7, :ingredient_id => 41, :quantity => '1/4 teaspoon')
RecipeIngredient.create(:recipe_id => 7, :ingredient_id => 48, :quantity => '3/4 cup')


Ingredient.create(:name => 'filet mignon steaks')
Ingredient.create(:name => 'freshly ground black pepper')
Ingredient.create(:name => 'salt to taste')
Ingredient.create(:name => 'balsamic vinegar')
Ingredient.create(:name => 'dry red wine')
Ingredient.create(:name => 'boneless chicken breast halves')
Ingredient.create(:name => 'swiss cheese')
Ingredient.create(:name => 'ham')
Ingredient.create(:name => 'all-purpose flour')
Ingredient.create(:name => 'paprika')#10
Ingredient.create(:name => 'butter')
Ingredient.create(:name => 'dry white wine')
Ingredient.create(:name => 'chicken bouillon granules')
Ingredient.create(:name => 'cornstarch')
Ingredient.create(:name => 'heavy whipping cream')
Ingredient.create(:name => 'whole chicken, giblets removed')
Ingredient.create(:name => 'black pepper to taste') # 17
Ingredient.create(:name => 'onion powder')
Ingredient.create(:name => 'margarine')
Ingredient.create(:name => 'celery, leaves removed') #20
Ingredient.create(:name => 'olive oil')
Ingredient.create(:name => 'red wine vinegar')
Ingredient.create(:name => 'chili powder')
Ingredient.create(:name => 'zucchini, julienned')
Ingredient.create(:name => 'yellow squash, julienned')
Ingredient.create(:name => 'onion')
Ingredient.create(:name => 'green bell pepper, cut into thin strips')
Ingredient.create(:name => 'red bell pepper, cut into sthink strips')
Ingredient.create(:name => 'whole kernel corn')
Ingredient.create(:name => 'black beans') #30
Ingredient.create(:name => 'salmon fillets')
Ingredient.create(:name => 'capers')
Ingredient.create(:name => 'salt')
Ingredient.create(:name => 'ground black pepper')
Ingredient.create(:name => 'lemon')
Ingredient.create(:name => 'cold water')
Ingredient.create(:name => 'white sugar')
Ingredient.create(:name => 'soy sauce')
Ingredient.create(:name => 'cider vinegar')
Ingredient.create(:name => 'garlic')
Ingredient.create(:name => 'ground ginger')
Ingredient.create(:name => 'skinless chicken thighs')
Ingredient.create(:name => 'brown sugar')
Ingredient.create(:name => 'ketchup')
Ingredient.create(:name => 'lean ground beef')
Ingredient.create(:name => 'milk')
Ingredient.create(:name => 'eggs')
Ingredient.create(:name => 'finely crushed saltine cracker crumbs')


Rating.create(:recipe_id => '4', :user_id => '1', :rating => '4', :review => "These are the best tasting vegan fajitas I've ever had!")
Rating.create(:recipe_id => '1', :user_id => '3', :rating => '5', :review => "I love soft filet mignon with the pepper and salt on top. It's a simple but tasty meal.")
Rating.create(:recipe_id => '4', :user_id => '1', :rating => '1', :review => "This is the worst recipe I've ever used. That's all I can say.")
