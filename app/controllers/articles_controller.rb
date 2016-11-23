class ArticlesController < ApplicationController
    
    def index
        #Grab all the articles from the database
        @articles = Article.all
        
    end
    
    def new
        @article = Article.new
        
    end
    
    def edit
        @article = Article.find(params[:id])
        
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
            flash[:notice] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
        
    end
    
    def update
        @article = Article.find(params[:id])
        
            if @article.update(article_params)            
            flash[:notice] = "Article was successfully updated"
            redirect_to article_path(@article)
            else
            render 'edit'
            end
        
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    private 
    def article_params
        params.require(:article).permit(:title)
    end

    
    
    
    
end
