require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron '*/1 * * * *' do
  BorrowedBook.update_overdue_status
end
