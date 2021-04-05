class WebsitesController < ApplicationController
  def index
    @websites = Website.all
  end

  def show
    run Website::Operation::Show
  end

  def new
    run Website::Operation::New
  end

  def edit
    run Website::Operation::Edit
  end

  def create
    run Website::Operation::Create do
      return redirect_to @model, notice: 'Website was successfully created.'
    end

    render :new, status: :unprocessable_entity
  end

  def update
    run Website::Operation::Update do
      return redirect_to @model, notice: 'Website was successfully updated.'
    end

    render :edit, status: :unprocessable_entity
  end

  def destroy
    run Website::Operation::Destroy
    redirect_to websites_url, notice: 'Website was successfully destroyed.'
  end
end
