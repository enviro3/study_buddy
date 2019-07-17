Rails.application.routes.draw do
  get 'welcome/index'
  get 'flash_cards/:id/answer', to: 'flash_cards#answer', as: "flash_cards_answer"
  get 'flash_cards/:id/next', to: 'flash_cards#next', as: "flash_cards_next"
  get 'flash_cards/:id/previous', to: 'flash_cards#previous', as: "flash_cards_previous"
  resources :flash_cards

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
