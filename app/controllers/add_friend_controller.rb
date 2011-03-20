
class AddFriendController < ApplicationController

  # PUT /add_friend/1
  # PUT /add_friend/1.xml
  def update
    @user = current_user
    friend = User.find(params[:id])
    current_user.add_friend(friend)
    redirect_to user_url(current_user)
  end
end