require "spec_helper"
describe AwesomeBotFactory::Skill do
  
  it "should initialize an empty match array if nothing given" do
    TestSkill.new.match.should eql([])
  end
  
  describe "Rack endpoint" do
    
    before do 
      JSON.should_receive(:parse).with("body").and_return({:all=>:fake})
      TestSkill.should_receive(:new).with({:all => :fake}).and_return(mock(:reply => {:body => "response"}))
    end
    subject {
      TestSkill.call({"rack.input" => StringIO.new("body")})
    }
    
    its([0]) { should eql(200) }
    its([1]) { should eql({"Content-Type" => "application/json"}) }
    its([2]) { should eql(['{"body":"response"}']) }

  end
  
  describe "Attributes" do
    before do 
      TestSkill.matches :one, :two
    end
    
    subject { TestSkill.new({"user" => "Mole", :room_id => "12345", :nill => nil, "match" => [1,2,3]}) }
    
    describe "accessors" do
      
      its(:one) { should eql(2)}
      its(:two) { should eql(3)}
      its(:user) { should eql("Mole") }
      its(:room_id) { should eql("12345") }
      its(:nill) { should be_nil }
      its(:message) { should eql({"user" => "Mole", :room_id => "12345", :nill => nil, "match" => [1,2,3]})}
      specify { expect { subject.undefined_methdo }.to raise_error(NoMethodError) }
    end
        
    describe "read attributes" do
      it { subject.read_attribute(:user).should eql("Mole") }
      it { subject.read_attribute(:room_id).should eql("12345") }
      it { subject.read_attribute(:nill).should be_nil }
      it { subject.read_attribute(:not_found).should be_nil }
    end
  end
  
  describe "Configuration" do
    before(:all) do 
      TestSkill.configure do |c|
        c.name = "Bender"
        c.description = "THE Bot"
      end
    end
    
    subject { TestSkill.config }
    its(:name) { should eql("Bender") }
    its(:description) { should eql("THE Bot") }
  end
  
end