class ContactMailer < ActionMailer::Base
  default :from => "contact@grouppic.cognii.com"
  default :to => "grouppic@cognii.com"
  def send_contact(form)
    @body = form[:message]
    mail(:subject => "[GroupPic] " + form[:subject])
  end
end
