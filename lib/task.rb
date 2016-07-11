class Task
  attr_reader(:description, :list_id, :completion_date)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @list_id = attributes.fetch(:list_id)
    @completion_date = attributes.fetch(:completion_date)
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks ORDER BY completion_date ASC;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      list_id = task.fetch('list_id').to_i()
      completion_date = task.fetch("completion_date")
      tasks.push(Task.new({:description => description, :list_id => list_id, :completion_date => completion_date}))
    end
    tasks
  end

  define_method(:save) do
    DB.exec("INSERT INTO tasks (description, list_id, completion_date) VALUES ('#{@description}', #{@list_id}, '#{@completion_date}');")
  end

  define_method(:==) do |another_task|
    self.description().==(another_task.description()).&(self.list_id().==(another_task.list_id()))
  end

end
