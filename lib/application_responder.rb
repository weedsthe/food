class ApplicationResponder < ActionController::Responder
  def api_behavior(error)
    raise error unless resourceful?

    if get?
      display resource
    elsif post?
      display resource, :status => :created, :location => api_location
    elsif put?
      display resource, status: :ok, location: api_location
    else
      head :no_content
    end
  end
end

