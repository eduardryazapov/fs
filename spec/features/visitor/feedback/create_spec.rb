require "rails_helper"

feature "Create Feedback" do
  let(:feedback_attributes) { attributes_for(:feedback) }

  scenario "Visitor creates his feedback" do
    visit new_feedback_path

    fill_form :feedback, feedback_attributes

    click_button "Submit feedback"

    open_email(ENV.fetch("ADMIN_EMAIL"))

    expect(current_email).to have_subject("Feedback")
    expect(current_email).to be_delivered_from(feedback_attributes[:email])

    expect(current_email).to have_body_text(feedback_attributes[:name])
    expect(current_email).to have_body_text(feedback_attributes[:email])
    expect(current_email).to have_body_text(feedback_attributes[:text])

    expect(page).to have_content("Feedback was successfully send!")
  end

  scenario "Visitor cannot creates his feedback" do
    visit new_feedback_path

    click_button "Submit feedback"

    expect(page).to have_content("Your feedback has not been sent.")
  end
end
