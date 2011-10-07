require 'spec_helper'

describe PaginaInicialController do
  
  before do
    @user_logado = Factory(:user)
    sign_in @user_logado
  end

  it "deve fazer o download do aplicativo mobile" do
    get :download
    response.should be_success
  end
end
