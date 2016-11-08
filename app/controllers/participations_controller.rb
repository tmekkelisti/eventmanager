class EventsController < ApplicationController
  def create
    participation = Participation.new(participation_params)
    participation.user = current_user

    if participation.save
      redirect_back(fallback_location: root_path), notice: 'saved'
    else
      redirect_back(fallback_location: root_path), notice: 'Was not able to save'
  end

  private
  def participation_params
    params.require(:participation).permit(:event, :status)
  end
end
