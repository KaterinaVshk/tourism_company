class OdersController < ApplicationController

  def create
    if current_user
      binding.pry
      @oder = Oder.find_or_create_by(oder_params)
      if @oder.save
        binding.pry
        flash[:notice] = 'Бронь успешно отправлена'
      else 
        flash[:alert] = 'Что-то пошло не так, попробуйте ещё раз'
      end
      redirect_to(profile_path)
    else
      redirect_to(new_user_session_path)
    end
  end

  private
  def oder_params
    parametrs = params.fetch(:oder).permit(:tour_id, :date, :persons)
    parametrs[:user_id] = current_user.id
    parametrs
  end
end
