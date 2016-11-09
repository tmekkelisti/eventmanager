module EventsHelper
  def participating_with_status(user_id, event_id, status)
    if p = User.find(user_id).participations.find_by(event_id: event_id)
      p.status.include?(status)
    end
  end
end
