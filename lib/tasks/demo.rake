namespace :demotask do
  desc 'Demo rake task for getting the current environment'
  task :current_environment => :environment do
    puts "You are running the rake task in #{Rails.env} environment"
  end
end
#rake demotask:current_environment       # Demo rake task for getting the current environment

#rake task to add subject
#rake add:subjects
#
# Add fields 'email' and `invitation_sent` flag to subject. It will be false by default, when an invitation is send to the subject mailing address set it to true.
# Write a rake task to process and send invitations to all the subjects for whom, invitations are pending.

namespace :add do
  desc 'Rake task to add subjects to a study'
  task :subject, [:study_name, :subject_count] => :environment do |task, args|
    obtained_study = Study.find_by_name(args[:study_name])
    abort('Study not found') unless obtained_study
    #Adding subjects
    args[:subject_count].to_i.times do
      begin
        subj = Subject.create!(name: Faker::Name.unique.name,
                               age: rand(obtained_study.age_limit..100))
        enrollment = Enrollment.create!(study: obtained_study,
                                        subject: subj)
        puts "Subject named: #{subj.name} is successfully enrolled, Enrollment Id is: #{enrollment.id}!"
      rescue => e
        puts "Couldn't enroll student named: #{subj.name} because of #{e.message}!"
      end
    end
  end
end

#Assignment
namespace :send_email do
  desc "Rake task to send invitation to subjects"
  task :to_subjects => :environment do
    #Check the subjects invitation_sent status
    Subject.all.each do |subject|
      if !subject.invitation_flag
        puts "1. Send email to subject named: #{subject.name}"
        InvitationMailer.with(subject: subject).send_invitation_mail.deliver_later
        puts "2. Set the flag to true"
        subject.update(invitation_flag: true)
      end
    end
  end
end


#Amit's Explanation
# namespace :add_subjects do
  #   desc 'Add given no of subjects to a study'
  #   task :process, [:study_name,:subject_count] => :environment do |t, args|
  #     study = Study.find_by_name(args[:study_name])
  #     abort('Study not found') unless study
  #
  #     puts "Adding #{args[:subject_count].to_i} subjects to study: #{study.name}"
  #
  #     args[:subject_count].to_i.times do |i|
  #       subject = Subject.new(
  #         name: Faker::Name.name,
  #         age: rand(study.age_limit..100),
  #         blood_group: Faker::Blood.group.downcase,
  #         )
  #       begin
  #         subject.save!
  #         puts "Adding subject with name: #{subject.name} to study: #{study.name}"
  #         Enrollment.create!(study: study, subject: subject)
  #       rescue => e
  #         puts "Unable to add subject due to: #{e}"
  #       end
  #     end
  #     puts "Added #{args[:subject_count]} subjects to study with name #{study.name}"
  #   end
  # end
#
namespace :test do
  desc 'tesing'
  task :check_email_sent => :environment do
    StudyMailer.test_email.deliver_now
  end
end