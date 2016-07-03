module ExtraFromUsers
    extend ActiveSupport::Concern
  def reset_password
  if params["token"] == "yes"
    @user = User.where(email: params[:email]).last
    if @user
      @user.update({password: params[:password], confirm_password: params[:confirm_password]})
      redirect_to root_path
      flash[:message]="Sucessfully reset password"
    else
      redirect_to root_path
      flash[:message]="Email id is not correct"
    end
  else
    SendEmail.forget_password(params[:email]).deliver!
    redirect_to root_path
    flash[:message]="A link has been sent to your email id.Please use that link to change your password"
  end
  end
end