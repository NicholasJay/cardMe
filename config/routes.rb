Cardme::Application.routes.draw do
  root "welcome#index"

  resources :users do
    resources :cards, shallow: true 
    resources :groups
    resources :connections
  end

  resources :cards, only: [:index]


  get "/users/:user_id/connections/:id/cards", to: "cards#allcards"

 get "/groupsconnections", to: "groups_connections#index"

  post "/users/:id", to: "users#send_mail"
  post "/users/:id/sms", to: "users#send_sms"

  get "/invite", to: "invites#show"

  post "/invitesession", to: "session#newsession" 

  post "/joinfrominvite", to: "invites#create"

  #get "/allcards", to: "cards#allcards"

  get "/connections", to: "connections#index"
  get "/connections/:id/groupsconnections", to: "groups_connections#index"
  post "/connections", to: "connections#create"
  delete "/connections/:id", to: "connections#destroy"

  post "/groupsconnections", to: "groups_connections#create"
  delete "/groupsconnections", to: "groups_connections#destroy"

  # get "/groupsconnections", to: "groups_connections#index"

  #get "/groupsconnections", to: "groups_connections#index"
  #get "connections/:id/groupsconnections", to: "groups_connections#index"


  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/logout", to: "session#destroy"

  get "/card_dashboard/:id", to: "cards#card_dashboard"

  # # PJ: Below is a suggeseted direction for your routes, to make them fit a more 
  # # RESTful convention. For more, see: http://guides.rubyonrails.org/routing.html
  
  # # your groups interface is very simple, and you got it mostly right...
  # root "welcome#index"

  # # singular resource, maybe not with new... for the invites you can post
  # # the necessary data to let it know the request is an invite-session request
  # resource  :session, only: [:new, :create, :destroy]

  # resources :users, shallow: true do # possible as long as the nested routes below
  #                                    # are only ever accessed in the context of a
  #                                    # user, such as the current user

  #   resources :cards     # full CRUD on the user's own personal cards

  #   # nearly full CRUD on connections... so here is the deal:
  #   # A CONNECTION REPRESENTS A CARD HELD BY ANOTHER USER, thus
  #   # it is always in the context of a user, but may also be
  #   # accessed by its relationship to a user's groups (see below)
  #   # and needn't enclose a card route, instead it IS a card...
  #   resources :connections, except: [:new]          # a card is sent to you...
  #   get "connections/invite", to: "connections#new" # providing us full CRUD on 'cards'
  #                                                   # that aren't the user's, ie
  #                                                   # 'connections'
    
  #   resources :groups do # full CRUD on the user's own groups

  #     # these routes refer to a connection's relationship to a group...
  #     # and all you can do is list the connections in a group
  #     resources :connections, only: [:create, :index, :destroy], to: "groups_connections"
  #   end
  # end

  # resources :invites, only: [:create, :show]

  # # outside the contest of a user or a connection, you can still possibly see all
  # # cards or just one card... not sure if this is necessary
  # # resources :cards, only: [:index, :show]

  # # no need for a card dashboard: instead it's a connection#show
end
