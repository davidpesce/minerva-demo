Rails.application.routes.draw do
  mount Minerva::Engine => 'ims/rs/v1p0'
end
