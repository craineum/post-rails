require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.import' do
    subject { described_class.import(user) }

    let(:email_primary) { FactoryBot.build(:api_email, is_primary: true) }
    let(:email) { FactoryBot.build(:api_email, is_primary: false) }
    let(:emails) { [email, email_primary] }
    let(:user) { FactoryBot.build(:api_user, emails: emails) }

    it { is_expected.to be_an_instance_of(User) }

    it 'create a record' do
      expect { subject }.to change(User, :count).by 1
    end

    it 'set email' do
      expect(subject.email).to eq(email_primary.email)
    end

    it 'set name' do
      expect(subject.name).to eq(user.name)
    end
  end
end
