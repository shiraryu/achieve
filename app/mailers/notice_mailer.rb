class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog(blog)
    @greeting = "Hi"
      @blog = blog

    mail to: "siraryu1113@yahoo.co.jp",
      subject:'[Achieve]ブログが投稿されました'
  end

  def sendmail_contact(contact)
    @greeting = "Hi"
      @contact = contact

    mail to: "siraryu1113@yahoo.co.jp",
      subject:'[Achieve]お問い合わせ送信完了通知'
  end
end
