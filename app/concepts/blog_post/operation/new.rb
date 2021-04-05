class BlogPost::Operation::New < Trailblazer::Operation
  step :find_website
  step :new
  step Contract::Build(constant: BlogPost::Contract::Update)

  def find_website(ctx, **_args)
    ctx[:website] = Website.find(ctx[:params][:website_id])
  end

  def new(ctx, **_args)
    ctx[:model] = BlogPost.new(website: ctx[:website])
  end
end
