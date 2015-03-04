class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      authy = Authy::API.register_user(
        email: @user.email,
        cellphone: @user.phone_number,
        country_code: @user.country_code
      )
      @user.update(authy_id: authy.id)
      Authy::API.request_sms(id: @user.authy_id)
      redirect_to verify_path
    else
      render :new
    end
  end

  def show_verify
    return redirect_to new_user_path unless session[:user_id]
  end

  def verify
    @user = current_user
    token = Authy::API.verify(id: @user.authy_id, token: params[:token])
    if token.ok?
      @user.update(verified: true)
      send_message("You did it! Signup complete :)")
      redirect_to user_path(@user.id)
    else
      flash.now[:danger] = "Incorrect code, please try again"
      render :show_verify
    end
  end

  def resend
    @user = current_user
    Authy::API.request_sms(id: @user.authy_id)
    flash[:notice] = "Verification code re-sent"
    redirect_to verify_path
  end
  private

  def send_message(message)
    @user = current_user
    twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    message = @client.account.messages.create(
      :from => twilio_number,
      :to => @user.country_code+@user.phone_number,
      :body => message
    )
    puts message.to
  end

  def user_params
    params.require(:user).permit(
      :email, :password, :name, :country_code, :phone_number
    )
  end

end
