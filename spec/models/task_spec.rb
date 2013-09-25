require 'spec_helper'

describe Task do
  it { should validate_presence_of :name }
  it { should belong_to :list }

  it "starts as not done" do
  task = Task.new(name: 'stuff')
  task.done.should eq false
  end
end