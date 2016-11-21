class ArticlesController < ApplicationController
    
    def new
        @article = Article.new
        
    end
    
    def create
        #to inspect what is being passed
        #render plain: params[:article].inspect
        
        #create an instance variable
        @article = Article.new(article_params)
        @article.save
        
        #page to redirect to after saving
        redirect_to articles_show(@article)
        
    end
    
    private 
    def article_params
        params.require(:article).permit(:title)
    end

    
    
    
    
end