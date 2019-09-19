require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get "/" do
      erb :super_hero
    end

    post "/" do
      @team = Team.new(params[:team])
      
      @heroes = params[:members].map do |member|
        Hero.new(member[:name], member[:power], member[:bio], @team)
      end
      
      erb :team
    end

end
