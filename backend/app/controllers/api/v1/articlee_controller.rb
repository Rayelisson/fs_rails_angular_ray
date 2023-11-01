class Api::V1::ArticleeController < ApplicationController
  def index
    articles = Articlee.all()
    render json: articles, status: 200
  end

   def new
    article = Articlee
  end

  #Criacao de uma usuario

  def create
     article = Articlee.new(
         title: article_params[:title], 
         body: article_params[:body], 
         author: article_params[:author] 
        )

     if article.save
      render json: article, status:200
     else
       render  json:{ error: 'create o error...'}
     end
  end

    #Atualizacao
  def update
    article = Articlee.find(params[:id])
    if article
      article.update(title: params[:title], body: params[:body], author: params[:author])
       render json: "Arthor update succeso"
      else
        render json: { error: 'update o error...'}
    end
  end

  def destroy
    article = Articlee.find(params[:id])
    if article
      article.destroy
      render json: "Article deleted succefully"
    end
  end


#Mostra por ID
  def show 
    article = Articlee.find(params[:id])
    if article
      render json: article, status: 200
      else
         render json: {error: 'Article not found'}
    end
  end

  private
  def article_params
     params.require(:articlee).permit(:title, :body, :author)
  end
end
