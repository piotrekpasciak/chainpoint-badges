class BadgesController < ApplicationController
  def new
    @submit_badge_form = SubmitBadgeForm.new
  end

  def create
    @submit_badge_form = SubmitBadgeForm.new(submit_badge_form_params)

    @badge = @submit_badge_form.save

    if @badge.present?
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
