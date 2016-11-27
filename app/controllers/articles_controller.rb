class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit,:update,:show,:destroy]
    
    
    def index
        #Grab all the articles from the database
        @articles = Article.all
        
    end
    
    def new
        @article = Article.new
        
    end
    
    def edit
        
        
    end
    
    def create
        #to inspect what is being passed
        #render plain: params[:article].inspect
        
        #create an instance variable
        @article = Article.new(article_params)
        #@article.save
        
        #page to redirect to after saving
        #redirect_to article_path(@article)
        
        if @article.save
            flash[:success] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
        
    end
    
    def update
        
        
            if @article.update(article_params)            
            flash[:success] = "Article was successfully updated"
            redirect_to article_path(@article)
            else
            render 'edit'
            end
        
    end
    
    def show
        
    end
    
    def destroy
        
        @article.destroy
        
        flash[:success] = "Article was successfully deleted"
        redirect_to articles_path
    end
    
    
    private 
    def set_article
        @article = Article.find(params[:id])
    end
    
    def article_params
        params.require(:article).permit(:title)
    end

    
    
    
    
end
