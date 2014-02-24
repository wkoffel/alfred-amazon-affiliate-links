require 'json'

class Code

  def self.read
    code = nil
    begin
      code = JSON.parse(File.read("settings.json"))["code"]
    rescue
    end
  end

  def self.write(new_code)
    f = File.open("settings.json", "w")
    f.write({"code" => new_code}.to_json)
    f.close
  end

end
