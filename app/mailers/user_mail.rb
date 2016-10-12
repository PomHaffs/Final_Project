class UserMail < ApplicationMailer

default from: "FreshMeatApp@gmail.com"

  def intro(user)
    @user = user #@user will be whatever user we pass in to the 'welcome' method
    @fridge = @user.fridges.first
    @items = @fridge.fridge_items.limit(3).sort { |i| i.use_by_date }.reverse.map { |i| i.name }
    @user.get_recipes( @items )
    mail( :to => @user.email, :subject => "Welcome to the Fresh Meat App!", :cc => "FreshMeatApp@gmail.com" )
  end

end
