class UsersController < ApplicationController
	before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
	before_action :correct_user,   only: [:edit, :update]
	before_action :admin_user,     only: :destroy

		def index
		@users = User.paginate(page: params[:page])
	end

	def new
		@user = User.new
		puts "MMMMMMMMMMMMMMMMMMMMMM"
		p @user
		puts "$$$$$$$$$$$$$$$$$$$$$$$$"
	end

	def show
		@user = User.find(params[:id])
		puts "MMMMMMMMMMMMMMMMMMMMMM"
		p @user
		puts "$$$$$$$$$$$$$$$$$$$$$$$$"
	end

	def edit
		@user = User.find(params[:id])
		puts "MMMMMMMMMMMMMMMMMMMMMM"
		p @user
		puts "$$$$$$$$$$$$$$$$$$$$$$$$"
	end

	def create
		#@user = User.new(params[:user])
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "User added Successfully..."
			#	    render 'show'
			redirect_to @user
		else
			flash[:error] = "Error occurred in user creation..."
			render 'new'
		end

	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted."
		redirect_to users_url
	end

	private

	def signed_in_user
		unless signed_in?
			store_location
			redirect_to signin_url, notice: "Please sign in."
		end
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_url) unless current_user?(@user)
	end

	def user_params
		params.require(:user).permit(:name, :email, :password,
																 :password_confirmation)
	end

	def admin_user
		redirect_to(root_url) unless current_user.admin?
	end
end
