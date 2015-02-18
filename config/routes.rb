Rails.application.routes.draw do
    resources :users do
      resources :itemauctions
      resources :items_bidded, only: :index
    end

    resources :itemauctions do
      resources :bids
      resources :bidders, only: :index
    end
end

#                  Prefix Verb   URI Pattern                                           Controller#Action
#       user_itemauctions GET    /users/:user_id/itemauctions(.:format)                itemauctions#index
#                         POST   /users/:user_id/itemauctions(.:format)                itemauctions#create
#    new_user_itemauction GET    /users/:user_id/itemauctions/new(.:format)            itemauctions#new
#   edit_user_itemauction GET    /users/:user_id/itemauctions/:id/edit(.:format)       itemauctions#edit
#        user_itemauction GET    /users/:user_id/itemauctions/:id(.:format)            itemauctions#show
#                         PATCH  /users/:user_id/itemauctions/:id(.:format)            itemauctions#update
#                         PUT    /users/:user_id/itemauctions/:id(.:format)            itemauctions#update
#                         DELETE /users/:user_id/itemauctions/:id(.:format)            itemauctions#destroy
# user_items_bidded_index GET    /users/:user_id/items_bidded(.:format)                items_bidded#index
#                   users GET    /users(.:format)                                      users#index
#                         POST   /users(.:format)                                      users#create
#                new_user GET    /users/new(.:format)                                  users#new
#               edit_user GET    /users/:id/edit(.:format)                             users#edit
#                    user GET    /users/:id(.:format)                                  users#show
#                         PATCH  /users/:id(.:format)                                  users#update
#                         PUT    /users/:id(.:format)                                  users#update
#                         DELETE /users/:id(.:format)                                  users#destroy
#        itemauction_bids GET    /itemauctions/:itemauction_id/bids(.:format)          bids#index
#                         POST   /itemauctions/:itemauction_id/bids(.:format)          bids#create
#     new_itemauction_bid GET    /itemauctions/:itemauction_id/bids/new(.:format)      bids#new
#    edit_itemauction_bid GET    /itemauctions/:itemauction_id/bids/:id/edit(.:format) bids#edit
#         itemauction_bid GET    /itemauctions/:itemauction_id/bids/:id(.:format)      bids#show
#                         PATCH  /itemauctions/:itemauction_id/bids/:id(.:format)      bids#update
#                         PUT    /itemauctions/:itemauction_id/bids/:id(.:format)      bids#update
#                         DELETE /itemauctions/:itemauction_id/bids/:id(.:format)      bids#destroy
#     itemauction_bidders GET    /itemauctions/:itemauction_id/bidders(.:format)       bidders#index
#            itemauctions GET    /itemauctions(.:format)                               itemauctions#index
#                         POST   /itemauctions(.:format)                               itemauctions#create
#         new_itemauction GET    /itemauctions/new(.:format)                           itemauctions#new
#        edit_itemauction GET    /itemauctions/:id/edit(.:format)                      itemauctions#edit
#             itemauction GET    /itemauctions/:id(.:format)                           itemauctions#show
#                         PATCH  /itemauctions/:id(.:format)                           itemauctions#update
#                         PUT    /itemauctions/:id(.:format)                           itemauctions#update
#                         DELETE /itemauctions/:id(.:format)                           itemauctions#destroy
