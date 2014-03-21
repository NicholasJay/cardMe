class ConnectionsController < ApplicationController

 def index
    @connections = current_user.connections
    render json: @connections
  end


  def create
    @connection = Connection.create(user_id: params[:user], card_id: params[:card])
    render json: {connection: @connection.id, success: true, id: params[:user]}
  end

end