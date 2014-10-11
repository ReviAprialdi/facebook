class UsersController < ApplicationController

  def view
   @statuses = current_user.statuses
  end

  def edit
    @codes = IsoCountryCodes.all
  end
  
  def update
    if current_user.update_attributes(params.require(:user).permit(:first_name, :last_name, :contrycode, :phone_number, :avatar))
    redirect_to statuses_path
    else
      Rails.logger.info(current_user.errors.messages.inspect)
      redirect_to edit_profil_path
    end 
  end
end
