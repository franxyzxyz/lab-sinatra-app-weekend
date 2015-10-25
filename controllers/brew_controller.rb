class BrewApp < Sinatra::Base

  get '/brew/' do
    if params[:sort]
      case params[:sort]
      when 'rating'
        @brews = Brew.order(rating: :desc)
      when 'name'
        @brews = Brew.order(:beanName)
      when 'id'
        @brews = Brew.order(:id)
      when 'createAt'
        @brews = Brew.order(created_at: :desc)
      end
    else
      @brews = Brew.all
    end
    erb(:"brew/index")
  end

  # get '/brew/' do
  #   @sortString = params[:sort]
  #   # @brews = Brew.order(rating: :desc) if params[:sort]. == "rating"
  #   erb(:"brew/index")
  # end

  get '/brew/add' do
    erb(:"brew/add")
  end

  get '/brew/:id' do
    @brew = Brew.find(params[:id])
    erb(:"brew/view")
  end

  post '/brew/' do
    @brew = Brew.new(params[:brew])
    if @brew.save
      redirect("/brew/#{@brew.id}")
    else
      erb(:"brew/add")
    end
  end

  put '/brew/edit/:id' do
    @brew = Brew.find(params[:id])
    if @brew.update_attributes(params[:brew])
      redirect("/brew/")
    else
      erb(:"/brew/")
    end
  end

  get '/brew/edit/:id' do
    @brew = Brew.find(params[:id])
    erb(:"brew/edit")
  end

  delete '/brew/delete/:id' do
    @brew = Brew.find(params[:id])
    if @brew.destroy
      redirect("/brew/")
    else
      erb(:"/brew/")
    end
  end


end