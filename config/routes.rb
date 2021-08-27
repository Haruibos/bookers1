Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :books
 root 'homes#top'



end


# routes.rb ： ルーティングを設定するファイル
# routes.rb ： URLとコントローラ（アクション）を紐づける