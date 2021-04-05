class BlogPost::Operation::Edit < Trailblazer::Operation
  step Model(BlogPost, :find_by)
  step Contract::Build(constant: BlogPost::Contract::Update)
end
