class ApplicationMailer < ActionMailer::Base
  layout "mailer"

  def feedback(feedback)
    @feedback = feedback
    mail(subject: "Feedback", from: feedback.email, to: ENV.fetch("ADMIN_EMAIL"))
  end
end
