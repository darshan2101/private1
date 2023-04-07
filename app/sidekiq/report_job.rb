class ReportJob
  include Sidekiq::Job

  def perform(user_id)
    user = User.find(user_id)
    # AdminMailer.with(user: user).welcome.deliver_now
    AdminMailer.with(user: user).pdf_profile.deliver_later(wait: 30.seconds)
  end
end
