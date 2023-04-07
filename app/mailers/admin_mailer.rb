class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.welcome.subject
  #
  def welcome
    @greeting = "Hello User"
    @user = params[:user]
    mail(to: @user.email ,subject: "Welcome to Community")
  end

  def pdf_profile
    @message = "Hi there"
    @user = params[:user]
    # pdf = pdf_from_html_file()
    # attachments["user_#{user.id}.pdf"] = WickedPdf.new.pdf_from_html_file("home/darshanb/ror/march/06_03/Apex_2/app/views/users/download")
    #  WickedPdf.new.pdf_from_string( render_to_string(template: "users/download", layout: 'pdf', pdf: 'profile'))
    pdf = WickedPdf.new.pdf_from_string(
      render_to_string(template: 'users/download', layout: 'pdf', pdf: 'profile',
        page_size: "A4")
    )
    attachments["user_#{@user.id}.pdf"] = pdf
    mail(to: @user.email ,subject: 'Your Profile PDF is attached')
  end

end
