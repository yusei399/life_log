class GroupsController < ApplicationController
	before_action :authenticate_user!
	before_action :ensure_correct_user, only: [:edit, :update]

	def index
		@user_step_log = UserStepLog.new
		@groups = Group.all
	end

	def show
		@user_step_log = UserStepLog.new
		@group = Group.find(params[:id])
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)
		@group.owner_id = current_user.id
		
		# binding.irb
		if @group.save
			redirect_to group_path(@group)
			# binding.irb
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @group.update(group_params)
			redirect_to user_step_log_group_path(@user_step_log, group)
		else
			render "edit"
		end
	end

	private

	def group_params
		params.require(:group).permit(:name)
	end

	def ensure_correct_user
		@group = Group.find(params[:id])
		unless @group.owner_id == current_user.id
		  redirect_to groups_path
    end
	end
end

