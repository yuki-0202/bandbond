class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def purge
    current_user.image.purge if current_user.image.present?
    render :edit
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :birthday,
      :sex_id,
      :genre_id,
      :area_id,
      :part_id,
      :introduction,
      :image
    )
  end
end
