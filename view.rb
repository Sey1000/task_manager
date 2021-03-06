require 'date'

class View
  def view_today(tasks)
    puts ""
    puts "== TODAY =="
    tasks.each do |task|
      puts "#{task.id} - #{task.top_priority ? '[!] ' : ''}#{task.title} (#{task.due})"
    end
  end

  def view_week(tasks)
    puts ""
    puts "== THIS WEEK =="
    tasks.each do |task|
      puts "#{task.id} - #{task.title} (#{task.due})"
    end
  end

  def view_longterm(tasks)
    puts ""
    puts "== LONG TERM =="
    tasks.each do |task|
      puts "#{task.id} - #{task.title} (#{task.due})"
    end
  end

  def revive?
    puts "" 
    puts "[!] Done tasks are saved for 30 days from due date"
    puts "Revive a task? [y/n]"
    return STDIN.gets.chomp == 'y'
  end

  def revive_selection
    puts "Revive which task?"
    return STDIN.gets.chomp.to_i
  end

  def get_done_id
    puts "\n             run : taskki done TASK_ID\n\n"
  end

  def get_delete_id
    puts "             run : taskki delete TASK_ID\n\n"
  end

  def edit_selection
    puts ""
    puts "Edit which task?"
    id = STDIN.gets.chomp
    return id.to_i
  end

  def edit_option(task)
    tks = task.takes
    intv = task.interval
    puts ""
    puts "1 - title: #{task.title}"
    puts "2 - due: #{task.due}"
    puts tks == 0 ? "3 - takes: not specified" : "3 - takes: #{tks} days"
    puts "4 - top priority: #{task.top_priority}"
    puts intv == 0 ? "5 - repeat: not specified" : "5 - repeat: every #{intv} days"
    puts "6 - CANCEL EDIT\n\n"
    puts "Edit which information?"
    return STDIN.gets.chomp.to_i
  end

  def new_info(info)
    case info
    when 'title', 'due' then puts "New #{info}?"
    when 'takes' then puts "How many days does it take?"
    when 'reoccur' then puts "[t] for toggle, [#] of days for update"
    when 'repeat' then puts "How often to repeat? ([#] of days)"
    end
    return STDIN.gets.chomp
  end
end