class Website::Operation::Create < Trailblazer::Operation
  step Model(Website, :new)
  step Contract::Build(constant: Website::Contract::Update)
  step Contract::Validate()
  step Contract::Persist()
end
