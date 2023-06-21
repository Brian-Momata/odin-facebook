class MyRegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      UserWelcomeMailer.with(user: resource).welcome_email.deliver_now if resource.persisted?
    end
  end
end
