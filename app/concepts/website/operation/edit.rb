class Website::Operation::Edit < Trailblazer::Operation
  step Model(Website, :find_by)
  step Contract::Build(constant: Website::Contract::Update)
end
