require 'rubygems' unless defined? Gem
require './bundle/bundler/setup'
require "alfredo"
require "./code.rb"

def console_log(msg)
  escape = proc{ |m| m.gsub("'", "'\\\\''") }
  `logger -t 'Alfred Workflow' '#{escape[msg]}'`
end

args = ARGV[0] ? ARGV[0].split : ""

if(args[0] == "__setcode")
  new_code = args[1]
  Code.write(new_code)
  puts new_code
else
  workflow = Alfredo::Workflow.new
  new_code = args[0]
  if(!new_code || new_code.empty?)
    current_code = Code.read
    if(!current_code || current_code.empty?)
      workflow << Alfredo::Item.new(:valid => false, :title => "Set Affiliate Code", :subtitle => "Provide Amazon Tag (e.g. 'clear0e4-20')", :icon_path => "icon.png")
    else
      workflow << Alfredo::Item.new(:valid => false, :title => "Current Affiliate Code is '#{current_code}'", :icon_path => "icon.png")
    end
  else
    # set the new code
    workflow << Alfredo::Item.new(:arg=> "__setcode #{new_code}", :title => "Set Affiliate Code", :subtitle => "to '#{new_code}'", :icon_path => "icon.png")
  end
  workflow.output!
end
