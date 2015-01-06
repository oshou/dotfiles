Pry.config.prompt = proc do |obj, nest_level, _pry_|
  version = ''
  version << "#{RUBY_VERSION}"

  "#{version} #{Pry.config.prompt_name}(#{Pry.view_clip(obj)})> "
end
