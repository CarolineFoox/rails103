class GroupsController < ApplicationController
  before_action :authenticate_user! ,only: [:new, :create, :edit, :update, :destroy]
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
    if current_user != @group.user
      redirect_to root_path,aler:"您没有权限"
    end
  end


  def new
    @group = Group.new
  end


  def create
    @group = Group.new(group_params)
    @group.user = current_user

    if @group.save
      redirect_to groups_path
    else
      render :new
    end
   end


  def update
    @group = Group.find(params[:id])

    if current_user !=@group.user
      redirect_to group_path, alert:"您没有权限"
    end

    if @group.update(group_params)
      redirect_to groups_path,notice:"已更新"
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])

    if current_user != @group.user
      redirect_to root_path, alert:"您没有权限"
    end

    @group.destroy
    redirect_to groups_path，alert: "已删除"
  end



   private

   def group_params
     params.require(:group).permit(:title, :description)
   end
 end
