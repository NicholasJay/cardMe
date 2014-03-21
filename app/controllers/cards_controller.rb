class CardsController < ApplicationController
  before_action(:load_user, {only: [:create, :new, :edit, :update, :user, :show] })
  before_action(:load_card, {only: [:edit, :update, :destroy, :show] })
  
  def index
    @group = Group.new
    @user = current_user
    @groups = current_user.groups
    @connections = @user.connections
  #   @nytarticles = news_stories(@card.organization)
  end

  def edit
  end

  def show
    @cards = @user.cards.all
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
    redirect_to user_path(@card.user_id)
  end

  def card_params
    params.require(:card).permit(:email, :card_name, :position, :organization, :phone_number, :user_id, :background_image, :ogranization_logo, :profile_picture)
  end

  # def news_stories(organization)
  #   allarticles = HTTParty.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=#{organization}&api-key=#{NYTIMES_CLIENT_ID}")
  #   @articles = allarticles["response"]["docs"].map { |article| {"Title" => "#{article["snippet"]}", "Url" => "#{article["web_url"]}" }}
  # end


# <div class ="news-stories">
#   <% @nytarticles.each do |article| %>
#     <%= article["Title"] %>
#     <%= article["Url"] %>
#   <% end %>
# </div> 

private

  def load_user
    return @user = User.find(params[:user_id])
  end 

  def load_card
    return @card = Card.find(params[:id])
  end

end
