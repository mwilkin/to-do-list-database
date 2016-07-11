require('rspec')
require('task')
require('pg')
require('spec_helper')

describe(Task) do
  describe('.all') do
    it('is empty at first') do
      expect(Task.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a task to the array of saved tasks') do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :completion_date => "1998-12-31"})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('#description') do
    it('lets you give it a description') do
    test_task = Task.new({:description => "learn SQL", :list_id => 1, :completion_date => "1998-12-31"})
    expect(test_task.description()).to(eq('learn SQL'))
    end
  end

  describe('#list_id') do
    it('lets you read the list ID out') do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :completion_date => "1998-12-31"})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe('#completion_date') do
    it('lets you give the task a due date') do
      test_task = Task.new({:description => "learn SQL",:list_id => 1, :completion_date => "1983-07-08"})
      expect(test_task.completion_date()).to(eq("1983-07-08"))
    end
  end

  describe('#==') do
    it('is the same task if it has the same description and list ID') do
      task1 = Task.new({:description => "learn SQL", :list_id => 1, :completion_date => "1998-12-31"})
      task2 = Task.new({:description => "learn SQL", :list_id => 1, :completion_date => "1998-12-31"})
      expect(task1).to(eq(task2))
    end
  end
end
