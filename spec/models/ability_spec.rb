require 'rails_helper'
require "cancan/matchers"

describe Ability do
  subject(:ability) { Ability.new(user) }
  describe 'гость' do
    let(:user) { nil }
    it { should be_able_to :read, Advert }
    it { should be_able_to :read, Comment }
  end
  describe 'адмін' do
    let(:user) { create :user, admin: true }
    it { should be_able_to :manege, :all }
  end
  describe 'користувач' do
    let(:user) { create :user }
    let(:othe) { create :user }
    it { should_not be_able_to :manage, :all}
    it { should be_able_to :read, :all }

    it { should be_able_to :create, Advert }
    it { should be_able_to :create, Comment }

    it { should be_able_to :update, create( :advert, user: user), user: user}
    it { should_not be_able_to :update, create( :advert, user: othe), user: user}
    it { should be_able_to :destroy, create( :advert, user: user), user: user}
    it { should_not be_able_to :destroy, create( :advert, user: othe), user: user}
  end
end
