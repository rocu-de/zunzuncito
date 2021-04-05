class BlogPost::Operation::Update < Trailblazer::Operation
  step Model(BlogPost, :find_by)
  step Contract::Build(constant: BlogPost::Contract::Update)
  step Contract::Validate()
  step Contract::Persist()
end
