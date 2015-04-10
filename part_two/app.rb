require 'sinatra'

get '/' do
    "Hello, world"
end

# get the index.html file and serve it. Gets from ./public/index.html
# sinatra also serves anything in the ./public folder when asked. Try /main.css
get '/home' do
    send_file File.expand_path('index.html', settings.public_folder)
end


get '/template' do
    erb :name, :locals => {:name => params['name']}
end

# adds numbers in the url
get '/sum/:first/:second' do
    answer = params[:first].to_i + params[:second].to_i
    "The sum is #{answer}"
end

# bad code for finding the links on a page and outputting them. 
# don't actually do this
get '/links/:site' do
   require 'open-uri'
   links = open("http://"+params[:site]).read.scan(/href="(.+)"/)
   "#{params[:site]} has #{links.count.to_s} links. They are #{links}"
end





