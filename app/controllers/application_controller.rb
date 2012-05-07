require "application_responder"

class ApplicationController < ActionController::Base
  protect_from_forgery

  self.responder = ApplicationResponder
end
