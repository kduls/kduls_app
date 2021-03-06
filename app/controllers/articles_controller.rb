class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show, :destroy]

	def index
		@articles = Article.all
	end


	def new
		@article = Article.new
	end

	def edit
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "Creation of Article Succesfull"
			redirect_to article_path(@article)
		else
			render 'new'
		end
		
	end

	def update
		if @article.update(article_params)
			flash[:notice] = "Article Updated Succesfully"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def show
	end

	def destroy
		@article.destroy
		flash[:notice] = "Article Succesfully Deleted"
		redirect_to articles_path
	end

    private
    def set_article
    	@article = Article.find(params[:id])
    end


     def article_params
    	params.require(:article).permit(:title, :description)
    end

end	