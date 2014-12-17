group :development,:test do
  #RSpec関連
  gem 'rspec-rails'           #テストフレームワーク 
  gem 'factory_girl_rails'    #テストデータ作成
  gem 'faker'                 #ダミーデータ作成
  
  #pry関連
  gem 'pry-rails'             #PEPLをirbからpryにする
  gem 'pry-doc'               #Ruby自身のCソースコードを表示する
  gem 'pry-byebug'            #デバッグツール
  gem 'pry-stack_explorer'    #スタックトレース表示
end
