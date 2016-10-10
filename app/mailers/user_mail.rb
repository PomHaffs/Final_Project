class UserMail < ApplicationMailer

default from: "FeshMeatApp@gmail.com"

  def welcome(user)
    @user = user #@user will be whatever user we pass in to the 'welcome' method
    mail( :to => @user.email, :subject => "Welcome to the Fresh Meat App!", :cc => "FreshMeatApp@gmail.com" )
  end

end
