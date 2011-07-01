class UsersController < ApplicationController

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new
    @user.login = params[:user][:email]
    password = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{@user.login}--")[0,6]
    @user.password = password
    @user.password_confirmation = password
    @user.email = params[:user][:email]

    success = @user && @user.save
    if success && @user.errors.empty?
            
      redirect_to root_path
      UserMailer.deliver_invite_person(@user, password)
      flash[:notice] = "Email will sent to follwing address"
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
end
