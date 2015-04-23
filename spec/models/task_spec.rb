require 'rails_helper'

RSpec.describe Task do
  context 'with search action' do
    it 'can be created' do
      Task.create_search!('trololololo')
    end

    it 'can be performed' do
      task = Task.create_search!('trololololo')
      task.perform!
      expect(task.destroyed?).to be true
      expect(Task.count).to be > 0
    end
  end

  context 'with scrap action' do
    it 'can be created' do
      Task.create_scrap!('ffCIwC3hUDk')
    end

    it 'can be performed' do
      task = Task.create_scrap!('ffCIwC3hUDk')
      task.perform!
      expect(task.destroyed?).to be true
      expect(Video.count).to be 1
    end
  end
end
