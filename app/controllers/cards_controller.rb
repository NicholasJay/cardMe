class CardsController < ApplicationController
  before_action(:load_user, {only: [:create, :new, :edit, :update, :destroy, :user] })
  before_action(:load_card, {only: [:edit, :update, :destroy] })
  
  def index
    @group = Group.new
    @user = current_user
    @groups = current_user.groups
    @connections = @user.connections
  end

  def edit
  end

  def show
  end

  def update
    @card.update(card_params)
    redirect_to user_path(@user)
  end


  def new
    @card = @user.cards.new
  end

  def create
    @card = @user.cards.create(card_params)
    redirect_to user_path(@user)
  end

  def destroy
    @card.destroy
    redirect_to user_path(@user)
  end

  def card_params
    params.require(:card).permit(:email, :card_name, :position, :organization, :phone_number, :user_id)
  end


private

  def load_user
    return @user = User.find(params[:user_id])
  end 

  def load_card
    return @card = Card.find(params[:id])
  end

end
