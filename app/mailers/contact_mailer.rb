class ContactMailer < ApplicationMailer
  def contact_mail(user)
    @current_user = user

    mail to: "junx0401@gmail.com", subject: "投稿の確認メール"
  end
end
