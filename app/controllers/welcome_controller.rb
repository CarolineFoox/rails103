class WelcomeController < ApplicationController
  def index
     flash[:notice] = "早安，亲爱的！"
end
end
