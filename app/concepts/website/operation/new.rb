class Website::Operation::New < Trailblazer::Operation
  step Model(Website, :new)
  step Contract::Build(constant: Website::Contract::Update)
end
