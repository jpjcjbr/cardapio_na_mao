class ApplicationController < ActionController::Base
  protect_from_forgery
  #teste
  include CategoriasHelper
  include ItensHelper
  include DateHelper
end
