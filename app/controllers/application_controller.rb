class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include CategoriasHelper
  include ItensHelper
end
