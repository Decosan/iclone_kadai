class ContactMailer < ApplicationMailer
  def contact_mail(user)
    @current_user = user

    mail to: "junx0401@live.jp", subject: "投稿の確認メール"
  end
end
