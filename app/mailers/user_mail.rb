class UserMail < ApplicationMailer

default from: "FreshMeatApp@gmail.com"

  def intro(user)
    @user = user #@user will be whatever user we pass in to the 'welcome' method
    mail( :to => @user.email, :subject => "Welcome to the Fresh Meat App!", :cc => "FreshMeatApp@gmail.com" )
  end

  def send_recipe(user, recipe_data)
    @user = user
    @recipe_data = recipe_data
    @fridge = @user.fridges.first
    @items = @fridge.fridge_items.limit(3).sort { |i| i.use_by_date }.reverse.map { |i| i.name }
    mail( :to => @user.email, :subject => "Things that need to be eaten!", :cc => "FreshMeatApp@gmail.com" )
  end

end
