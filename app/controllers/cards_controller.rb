class CardsController < ApplicationController
  before_action(:load_user, {only: [:create, :new, :edit, :update, :user] })
  before_action(:load_card, {only: [:edit, :update, :destroy, :show] })
  
  def index
    @group = Group.new
    @user = current_user
    @groups = current_user.groups
    @connections = @user.connections
    @cards = @user.cards.all
    @all_cards = Card.all
    #@connection = @connections.find_by(card_id: 3)
    #@connection_card = Card.find(@connection.card_id)
    #@nytarticles = news_stories(@connection_card.organization)


## TO DO : PUT BACK IN CARDS INDEX
#     <div class ="news-stories">
#   <h1>News Stories</h1>
#   <% @nytarticles.take(4).each do |article| %>
#     <li><a href= "<%= article["Url"] %>"><%= article["Title"] %></a></li>
#   <% end %>
# </div> 


  end

  def edit
  end

  def show
    render json: @card
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

  def news_stories(organization)
    allarticles = HTTParty.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=#{organization}&api-key=#{NYTIMES_CLIENT_ID}&begin_date=20130101")
    articles = allarticles["response"]["docs"].map { |article| {"Title" => "#{article["snippet"]}", "Url" => "#{article["web_url"]}" }}
  end


private

  def load_user
    return @user = User.find(params[:user_id])
  end 

  def load_card
    return @card = Card.find(params[:id])
  end

end
