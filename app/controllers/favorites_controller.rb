class FavoritesController < ApplicationController
	def create
		
		@user_step_log = UserStepLog.find(params[:user_step_log_id])
		@favorite = current_user.favorites.new(user_step_log_id: params[:user_step_log_id])
		@favorite.save
		redirect_to user_step_log_path(@user_step_log)
	end

	def destroy
		@user_step_log = UserStepLog.find(params[:user_step_log_id])
		@favorite = current_user.favorites.find_by!(user_step_log_id: @user_step_log.id)
		if @favorite.destroy
			redirect_to user_step_logs_path
		else
			flash[:alert] = "削除に失敗しました"
			redirect_to edit_user_step_log_path(@user_step_log)
		end
	end
end
