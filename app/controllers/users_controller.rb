class UsersController < ApplicationController

  def edit
      render('edit')
  end

  def update
    @user = current_user

    if @user.update(user_params)
      flash[:notice] = 'Профиль успешно обновлен'
      redirect_to(profile_path)
    else
      render('edit')
    end
  end

  private

  def user_params
    params.fetch(:user).permit(:name, :surname, :phone, :image)
  end
end
