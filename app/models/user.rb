class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def create
    @user = User.new(user_params)
    if @user.save
      @user.set_confirmation_token
      @user.save(validate:false)
      UserMailer.registration_confirmation(@user).deliver_now
      falsh[:success] = "Please Confirm your email address to continue"
    else
      flash[:error] = "Invalid Email !!!"
      render :new 
    end   
  end  

  private
  def validate_email
    self.email_confirmed = true
    self.confirm_token = nil
  end 
  
  private
  def set_confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end      

end
