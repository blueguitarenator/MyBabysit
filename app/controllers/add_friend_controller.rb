
class AddFriendController < ApplicationController

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = current_user
    friend = User.find(params[:id])
    current_user.add_friend(friend)
    redirect_to user_url(current_user)
  end
end