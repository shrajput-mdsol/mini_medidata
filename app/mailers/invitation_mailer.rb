class InvitationMailer < ApplicationMailer
  def send_invitation_mail
    @subject = params[:subject]
    @url = 'https://distro.imedidata.net/'
    mail(to: @subject.email, Subject: "Invitation For Study on Distro")
  end
end
