require 'rails_helper'

RSpec.describe List, type: :model do
  describe '#complete_all_tasks!' do
    it 'should mark all tasks belonging to the list as complete' do
      list = List.create(name: "Chores")
      Task.create(list_id: list.id, complete: false, name: "Take out trash")
      Task.create(list_id: list.id, complete: false, name: "Feed the cat")
      list.complete_all_tasks!
      list.tasks.each do |task|
        expect(task.complete).to eq(true)
      end
    end
  end
end
