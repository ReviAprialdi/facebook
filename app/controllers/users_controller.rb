class UsersController < ApplicationController
  def view
   @statuses = current_user.statuses
  end
end
