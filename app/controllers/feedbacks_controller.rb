class FeedbacksController < ApplicationController
  expose(:feedback)

  def new
  end

  def create
    ApplicationMailer.feedback(feedback).deliver_now! if feedback.save
    respond_with(feedback, location: root_path)
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :name, :text)
  end
end
