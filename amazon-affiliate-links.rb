require 'rubygems' unless defined? Gem
require './bundle/bundler/setup'
require "alfredo"
require "addressable/uri"
require "./code.rb"

def console_log(msg)
  escape = proc{ |m| m.gsub("'", "'\\\\''") }
  `logger -t 'Alfred Workflow' '#{escape[msg]}'`
end

workflow = Alfredo::Workflow.new

def create_affiliate_link(product_url, code)
  uri = Addressable::URI.parse(product_url)
  return nil unless uri.host && uri.host.match(/amazon/)
  uri.path = uri.path.sub(/ref=\w*/, '') # strip the referrer if it's there
  uri.query_values = {tag: code}
  uri.to_s
end

return nil if ARGV[0].match("code")
# Get the arguments from {query}
product_url = ARGV[0]
aff_code = Code.read
if(!aff_code || aff_code.empty?)
  workflow << Alfredo::Item.new(:valid => false, :title => "No Affiliate Code Set", :subtitle => "Run 'alink code your-code-tag' to setup", :icon_path => "icon.png")
elsif(!product_url || product_url.empty?)
  workflow << Alfredo::Item.new(:valid => false, :title => "Generate Link", :subtitle => "Provide Product URL", :icon_path => "icon.png")
elsif(new_url = create_affiliate_link(product_url, aff_code))
  workflow << Alfredo::Item.new(:arg => new_url, :title => "Generate Link", :subtitle => "with Amazon Affiliate Code", :icon_path => "icon.png")
else
  workflow << Alfredo::Item.new(:valid => false, :title => "Invalid URL", :subtitle => "Provide Product URL", :icon_path => "icon.png")
end

workflow.output!
