class StudyMailer < ApplicationMailer
  #can be called from anywhere
  # def success_mail
  #   @study = params[:study]
  #   mail(to: 'shrajput@mdsol.com', subject: 'First Study Registration')
  # end

  def test_email
    mail(to: 'shrajput@mdsol.com', subject: 'Myyyyy Studyyyyy Registration')
  end
end