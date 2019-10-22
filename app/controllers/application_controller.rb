require "dry/monads/result"
require "dry/matcher/result_matcher"

class ApplicationController < ActionController::Base
  include Pagy::Backend
end
