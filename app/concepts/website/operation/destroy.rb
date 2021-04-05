class Website::Operation::Destroy < Trailblazer::Operation
  step Model(Website, :find_by)
  step :destroy

  def destroy(context, **)
    context[:model].destroy
  end
end
