require 'rails_helper'

describe Study, type: :model do
  # negative scenarios
  context 'when study do not have a name' do
    it 'is invalid & gives appropriate error for name' do
      study = Study.create(name: '')
      error_messages = study.errors.messages
      expect(study.valid?).to eq false
      expect(error_messages[:name].at(0)).to eq "can't be blank"
    end
  end

  context 'when study do not have a drug' do
    it 'is invalid & gives appropriate error for drug' do
      study = Study.create(drug: '')
      error_messages = study.errors.messages
      expect(study.valid?).to eq false
      expect(error_messages[:drug].at(0)).to eq "can't be blank"
    end
  end

  context 'when study do not have a age within age limit' do
    it 'is invalid & gives appropriate error for age' do
      study = Study.create(age_limit: 6)
      error_messages = study.errors.messages
      expect(study.valid?).to eq false
      expect(error_messages[:age_limit].at(0)).to eq 'must be greater than 7'
    end
  end

  context 'when study do not have a phase within phase limit' do
    it 'is invalid & gives appropriate error for phase' do
      study = Study.create(phase: 6)
      error_messages = study.errors.messages
      expect(study.valid?).to eq false
      expect(error_messages[:phase].at(0)).to eq 'must be less than or equal to 5'
    end
  end

  # postive scenario
  context 'when a study have a valid name, drug, age_limit, phase' do
    it 'is valid' do
      study = Study.new(name: 'Cetaphil Study', drug: 'Cetaphil', age_limit: 8, phase: 2)
      expect(study.valid?).to eq true
    end
  end

  context 'when a valid study record is saved into the database' do
    it 'is valid & record get created in database' do
      study = Study.new(name: 'Covid Study', drug: 'Remdisivir', age_limit: 30, phase: 3)
      expect(study.valid?).to eq true
      expect(study.save).to eq true
    end
  end
  # Doubt
  # If a create|save method is called from here, will this data get stored in some db, if yes where?
  
end
