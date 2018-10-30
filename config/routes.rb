Rails.application.routes.draw do
  mount Minerva::Engine => 'ims/rs/v1p0'
  mount Precious::App, at: 'wiki'
end
