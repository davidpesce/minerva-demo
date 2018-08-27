Rails.application.routes.draw do
  mount Minerva::Engine => 'ims/rs/v1p0'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
