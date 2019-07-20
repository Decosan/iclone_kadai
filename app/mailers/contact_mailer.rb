class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    @post = current_user.posts.find_by(id: params[:id])
    mail to: "junx0401@live.jp", subject: "投稿の確認メール"
  end
end
