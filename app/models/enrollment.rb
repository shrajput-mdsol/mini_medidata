class Enrollment < ApplicationRecord
  belongs_to :study
  belongs_to :subject

  after_save :audit_log

  def audit_log
    Rails.logger.info "*******Inside Audit Log***********"
    def perform(*args)
      Rails.logger.info "*********Inside Perform******** #{args} And #{args.class}"

      enrollment = args[0]  #enrollment object
      study_name, subject_name = enrollment.study.name, enrollment.subject.name

      file = File.join(File.dirname(__FILE__), 'audit.txt')
      File.open(file, 'a') { |f| f.puts "A subject named #{subject_name} , enrolled to a Study named #{study_name}" }
    end
  end
  end

