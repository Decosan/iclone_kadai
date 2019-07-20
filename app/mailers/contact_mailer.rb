class ContactMailer < ApplicationMailer
  def contact_mail(user)
    @current_user = user

    mail to: @current_user.email, subject: "投稿の確認メール"
  end
end
