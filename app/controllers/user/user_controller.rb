class UserController < ApplicationController
	
	def index
		@users = User.all.order("name ASC")
		if @users.empty?
			render :no_users_found
		end
	end

	def show
		begin
			@user = User.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:error] = "No project found, try to go to the index page"
			render :no_user_found
		end
	end

	def new
		@user = User.new

	def create
		@user = User.new user_params

		if @user.save
			redirect_to user_path(@user)
		else
			render :new
		end
	end

	def update
		if @user.update(user_params)
			flash[:notice] = "User updated successfully"

			redirect_to user_path(@user)
		else
			flash[:error] = "Check the errors, user cannot be updated"

			render :edit
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email)
	end
end
