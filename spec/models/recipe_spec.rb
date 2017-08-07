RSpec.describe Recipe, type: :model do
  it { should belong_to(:user) }
 end

 describe Recipe, 'validations' do
   it { should validate_presence_of(:title) }
   it { should validate_presence_of(:description) }
 end

 describe Recipe, "search" do
   it "can search recipe" do
     user = User.new(id: 1,name: "example", password: "abc123", email: "example@example.com")
     user.save
     recipe = Recipe.new(title: "abc", user_id: 1, description: "b")
     recipe.save
     expect(Recipe.search("abc")).to include(recipe)
   end
 end
