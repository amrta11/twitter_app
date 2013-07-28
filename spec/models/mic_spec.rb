require 'spec_helper'

describe Micropost do

	let(:user) { FactoryGirl.create(:user) }
	before { @micropost = user.microposts.build(content: "Lorem ipsum") }

	subject { @micropost }

	it { should respond_to(:content) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	its(:user) { should == user }

	it { should be_valid }

	describe "accessible attributes" do
		it "should not allow to access 'user_id'" do
			expect do
				Micropost.new(content: "Lorem ipsum", user_id: user.id)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end

	describe "when user user_id is not present" do
		before { @micropost.user_id = nil }
		it { should_not be_valid }
	end

end