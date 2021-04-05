class Website::Operation::Show < Trailblazer::Operation
  step Model(Website, :find_by)
end
