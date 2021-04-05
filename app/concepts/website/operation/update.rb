class Website::Operation::Update < Trailblazer::Operation
  step Model(Website, :find_by)
  step Contract::Build(constant: Website::Contract::Update)
  step Contract::Validate()
  step Contract::Persist()
end
