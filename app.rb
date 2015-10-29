require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle_2 < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect to('/play')
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.attacked_player)
    erb(:attack)
  end

  get '/switch_turn' do
    @game = $game
    @game.switch_turn
    redirect to('/play')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
