class GroupsController < ApplicationController
 
  def index
    @user = current_user
    @groups = current_user.groups
    render json: @groups
  end

  def create
    @user = current_user
    @group = Group.create(user: current_user, group_name: params[:group_name])
    render json: @group
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    render json: @group
  end
end