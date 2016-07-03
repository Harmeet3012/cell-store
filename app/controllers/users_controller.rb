class UsersController < ApplicationController
  skip_before_action :check_session, only: [:new, :create, :login, :validate_login, :edit, :index, :show, :forget_password]
  http_basic_authenticate_with name: "admin", password: "admin1234", only: :index
  include ExtraFromUsers
  
  def index
    @user = User.all
  end
  
  def frgt_pswrd
    
  end

  def edit
    @user = User.find(params[:id])
    @user.build_image
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path(@user)
      flash[:message]="Record Updated"
    else
      render :edit
      flash[:message]="Something went wrong,please have a look"
    end
  end
  
  def new
    @user = User.new
    @user.build_image
  end
  
  def create
   @user = User.new(user_params)
   if @user.save
     byebug
     SendEmail.welcome_email(@user.email).deliver!
     redirect_to user_path(@user)
   else
     render :new
   end
  end

  def show
    @user = User.find(params[:id])
  end
  
  def login
    if !session[:user_id].blank?
       redirect_to mobiles_path
    else
       @user = User.new
    end
  end

  def validate_login
    @user = User.authenticate(user_params[:email],user_params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to mobiles_path
      flash[:notice] = "successfully logged in"
    else
      redirect_to users_login_path
      flash[:notice] = "invalid credentials"
    end
  end
  
  
  
  def logout
    session[:user_id] = nil
    redirect_to users_login_path
  end
  private
  def user_params
    params.require(:user).permit! #(:name, :email, :password, :confirm_password, :mobile)
  end
end
