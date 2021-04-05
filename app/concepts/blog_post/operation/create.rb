class BlogPost::Operation::Create < Trailblazer::Operation
  step Model(BlogPost, :new)
  step Contract::Build(constant: BlogPost::Contract::Update)
  step :set_website_id
  step Contract::Validate()
  step Contract::Persist()

  def set_website_id(ctx, **_args)
    ctx[:model][:website_id] = ctx[:params][:website_id]
  end
end
