require 'spec_helper'

describe List do
  it { should validate_presence_of :name }
  it { should have_many :tasks }

  it 'lets you see all the completed tasks' do
    list = List.create(:name => 'travel')
    task1 = Task.create(:name => 'buy plane ticket', :list_id => list.id, :done => true)
    task2 = Task.create(:name => 'buy tooth paste', :list_id => list.id)
    list.done_tasks.should eq [task1]
  end

  it 'lets you see all the unfinished tasks' do
    list = List.create(:name => 'travel')
    task1 = Task.create(:name => 'buy plane ticket', :list_id => list.id, :done => true)
    task2 = Task.create(:name => 'buy tooth paste', :list_id => list.id)
    list.not_done_tasks.should eq [task2]
  end
end
