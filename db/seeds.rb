require 'csv'

jenn = User.create(name: "jenn", password_digest: "password")

jenn.recipes << Recipe.create(name: "applesauce")

CSV.foreach('db/nutrient_data_abbrev.csv', headers: true, header_converters: :symbol) do |food_item|
  FoodItem.create(name: "#{food_item[:shrt_desc]}", total_fat: food_item[:lipid_tot_g].to_f, total_protein: food_item[:protein_g].to_f, total_carb: food_item[:carbohydrt_g].to_f)
end
