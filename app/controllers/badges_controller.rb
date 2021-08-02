class BadgesController < ApplicationController
  def new
    @submit_badge_form = SubmitBadgeForm.new
  end

  def create
    @submit_badge_form = SubmitBadgeForm.new(submit_badge_form_params)

    if @submit_badge_form.save
      render :create
    else
      render :new
    end
  end

  private

  def submit_badge_form_params
    params.require(:submit_badge_form).permit(:issue_date, :recipient_name, :uuid)
  end
end
