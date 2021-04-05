class BlogPostsController < ApplicationController
  def index
    @website = Website.find(params[:website_id])
  end

  def new
    run BlogPost::Operation::New
  end

  def edit
    run BlogPost::Operation::Edit
  end

  def create
    run BlogPost::Operation::Create do
      return redirect_to website_blog_posts_path(@model.website), notice: 'Blogpost was successfully created.'
    end

    render :new, status: :unprocessable_entity
  end

  def update
    run BlogPost::Operation::Update do
      return redirect_to website_blog_posts_path(@model.website), notice: 'Blogpost was successfully updated.'
    end

    render :edit, status: :unprocessable_entity
  end

  def destroy
    run BlogPost::Operation::Destroy
    redirect_to website_blog_posts_path(@model.website), notice: 'Blog post was successfully destroyed.'
  end
end
