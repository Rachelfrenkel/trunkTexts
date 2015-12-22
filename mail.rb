#Program to send automated text messages to members of TRUNK when they have a show
#by: Rachel Frenkel

require 'rubygems'
require 'mail'
require 'date'
require_relative 'peopleinfo.rb'

$email
$body = "Wow, you're looking good. Good thing, too, because you \
have a TRUNK show at "

class CreateMail
    def makeMsg
        show_data = File.open('show_data.txt','r')

        show_data.each do |line|
            if line.split[0] == (Date.today + 1).to_s
                @time = line.split[1].to_s
                @names = line.split(' ')[2..-1]
                $body = $body + @time
                @names.each do |name|
                    name = name.to_s
                        email_message = Mailing.new
                        phone_message = Mailing.new

                        $email = People[name].email.to_s
                        email_message.sendMail

                        puts "sending to #{$email}"
                        $email = People[name].phone.to_s
                        phone_message.sendMail
                end
            end
        end
        show_data.close
    end
    class Mailing
        def sendMail
            Mail.defaults do
              delivery_method :smtp, {
                :address => 'smtp.gmail.com',
                :port => '587',
                :user_name => '****@gmail.com',
                :password => '*****',
                :authentication => :plain,
                :enable_starttls_auto => true
              }
            end

            mail = Mail.new do
              from     '****@gmail.com'
              to       $email
              subject  'SHOWSHOWSHOW'
              body     $body

            end

            mail.deliver!
        end
    end

end

program = CreateMail.new
program.makeMsg
