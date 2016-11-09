class ParticipationsController < ApplicationController
  before_action :check_if_ended, only: [:create]
  def create
    if current_user.event_participations.ids.include?(params[:event_id].to_i)
      destroy_old_participation(current_user
        .participations
        .where(event_id: params[:event_id]))
    end
    participation = Participation.new(participation_params)
    participation.user = current_user
    if participation.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def participation_params
    params.permit(:event_id, :status)
  end

  def destroy_old_participation(participation_id)
    Participation.destroy(participation_id)
  end

  def check_if_ended
    if Event.find_by_id(params[:event_id]).try(:is_ended)
      redirect_to events_path, notice: 'Event is already ended'
    end
  end
end
