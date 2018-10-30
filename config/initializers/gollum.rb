require 'gollum/app'

Precious::App.set(:gollum_path, Rails.root.join('wiki').to_s)
Precious::App.set(:default_markup, :markdown)
wiki_options = { allow_editing: true }
Precious::App.set(:wiki_options, wiki_options)