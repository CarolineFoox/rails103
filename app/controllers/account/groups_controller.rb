class Account::GroupController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.participated_groups
  end
end
