class BlogPost::Operation::Destroy < Trailblazer::Operation
  step Model(BlogPost, :find_by)
  step :destroy

  def destroy(context, **)
    context[:model].destroy
  end
end
