class UserStepLogsController < ApplicationController
	
	def index
		@user_step_logs = UserStepLog.all
	end

	def new
		@user_step_log = UserStepLog.new
	end

	def create
		@user_step_log = UserStepLog.new(user_step_log_params)
		if @user_step_log.save
			redirect_to user_step_log_path(@user_step_log)
		else
			redirect_to action: :new
		end
	end

	def edit
		@user_step_log = UserStepLog.find(params[:id])
	end

	def update
		@user_step_log = UserStepLog.find(params[:id])
		if @user_step_log.update(user_step_log_params)
			redirect_to user_step_log_path(@user_step_log.id)
		else
			redirect_to action: :new
		end
	end

	def show
		@user_step_log = UserStepLog.find(params[:id])
		@favorite = Favorite.new
	end


	def destroy
		@user_step_log = UserStepLog.find(params[:id])
		if @user_step_log.destroy
			redirect_to user_step_logs_path
		end
	end

	private
		def user_step_log_params
			params.require(:user_step_log).permit(:steps).merge({ user_id: current_user.id })
		end
	end
